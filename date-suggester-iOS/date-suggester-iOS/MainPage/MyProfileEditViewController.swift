//
//  MyProfileEditViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/04/07.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class MyProfileEditViewController: UIViewController {
    
    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var userName: CustomPlofielTextField!
    @IBOutlet weak var profileEditButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        userIcon.layer.cornerRadius = 70
        profileEditButton.layer.masksToBounds = true
        profileEditButton.layer.cornerRadius = 20
        cancelButton.layer.masksToBounds = true
        cancelButton.layer.cornerRadius = 20
    }
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)

        let defaults = UserDefaults.standard
        debugPrint("responseUserName:\(defaults.string(forKey: "responseUserName"))")
        guard let userName = defaults.string(forKey: "responseUserName") else{
            self.userName.placeholder = "名もなき恋の達人"
            return
        }
        self.userName.placeholder = userName
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func canselButton(_ sender: Any) {
         self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func profileEditButton(_ sender: Any) {
        let config: URLSessionConfiguration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: config)
        
        let name = userName.text

        let userEditParams = [
           "name": name,
           "email": UserDefaults.standard.getUserEmail(),
           "birth_year": UserDefaults.standard.getSelectedBirthYear(),
            "gender": "",
            "area_id": UserDefaults.standard.getSelectedAreaId()
            ] as [String : Any]

        let user_id = UserDefaults.standard.getUserId()
        let url = URL(string: "https://api.date-suggester.com/v1/users/\(user_id)")!

        var req: URLRequest = URLRequest(url: url)
        req.httpMethod = "PUT"
        
        //ヘッダーを付与
        let myToken = UserDefaults.standard.getResponseToken()
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        req.setValue("Bearer " + myToken, forHTTPHeaderField: "Authorization")
        
        let parameter = ["user": userEditParams]
        req.httpBody = try! JSONSerialization.data(withJSONObject: parameter, options: .prettyPrinted)
        print(String(data: req.httpBody!, encoding: .utf8))
        
        let task = session.dataTask(with: req){(data, response, error) in
            print(data)
            print("response:\(response)")
            print(error)
            
            let responseString: String =  String(data: data!, encoding: .utf8)!
            print("responseString:\(responseString)")
            
            
            do {
                let response: [String: Any] = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
                
                print(response)
                

                UserDefaults.standard.setUserName(userName: response["name"] as? String ?? "")
                
                DispatchQueue.main.async {
                    self.navigationController?.popViewController(animated: true)
                    print("プロフィール変更完了")
                }
                
            } catch{
                
            }
        }
        task.resume()

        
    }
    
    @IBAction func userDelete(_ sender: Any) {
        let config: URLSessionConfiguration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: config)
        
        let user_id = UserDefaults.standard.getUserId()
        
        print(user_id)
        let url = URL(string: "https://api.date-suggester.com/v1/users/\(user_id)")!
        print(url)
        //URLRequestの生成
        var req: URLRequest = URLRequest(url: url)
        req.httpMethod = "DELETE"
        
        //ヘッダーを付与
        let myToken = UserDefaults.standard.getResponseToken()
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        req.setValue("Bearer " + myToken, forHTTPHeaderField: "Authorization")
        
        //APIを呼ぶよ
        let task = session.dataTask(with: req){(data, response, error) in
            do {
                //                let response: [String: Any] = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
                let httpResponse = response as? HTTPURLResponse
                debugPrint(httpResponse!.statusCode)
                
                debugPrint("ユーザ情報が削除されたよ")
                DispatchQueue.main.async {
                    //                    self.dismiss(animated: true, completion: nil)
                    //                    self.dateScheduleTV.reloadData()
                }
                
            } catch{
            }
            
        }
        task.resume()
    }
}


