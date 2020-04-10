//
//  MyProfileEditViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/04/07.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class MyProfileEditViewController: UIViewController {
    
    @IBOutlet weak var userName: CustomPlofielTextField!
    @IBOutlet weak var profileEditButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileEditButton.layer.borderColor = UIColor.white.cgColor
        profileEditButton.layer.borderWidth = 1.0
    }
    
    @IBAction func profileEditButton(_ sender: Any) {
//        /v1/users/{user_id}
        
        let config: URLSessionConfiguration = URLSessionConfiguration.default
        
        let session: URLSession = URLSession(configuration: config)
        
        //テキストフィールドに入力されたStringと取得して変数にいれる
        let name = editName.text
        let bio = editBio.text
        
        //その変数たちを集めた変数をつくって、それをJSON形式でボディに付与する（1つめの辞書）
        let userEditParams = [
            "name": name,
            "bio": bio
        ]
        
        //URLオブジェクトの生成
        let defaults = UserDefaults.standard
        let myId = defaults.string(forKey: "responseId")!
        print(myId)
        let url = URL(string: "https://teachapi.herokuapp.com/users/\(myId)")!
        //URLRequestの生成atal error: Unexpectedly f
        var req: URLRequest = URLRequest(url: url)
        req.httpMethod = "PUT"
        
        //ヘッダーを付与
        let myToken = defaults.string(forKey: "responseToken")!
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        req.setValue("Bearer " + myToken, forHTTPHeaderField: "Authorization")
        
        //ボディーを付与（2つめの辞書）
        let parameter = ["user_params": userEditParams]
        
        req.httpBody = try! JSONSerialization.data(withJSONObject: parameter, options: .prettyPrinted)
        
        print(String(data: req.httpBody!, encoding: .utf8))
        
        //APIを呼ぶよ
        let task = session.dataTask(with: req){(data, response, error) in
            print(data)
            print(response)
            print(error)
            
            let responseString: String =  String(data: data!, encoding: .utf8)!
            print(responseString)
            
            
            do {
                let response: [String: Any] = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
                
                print(response)
                
                let nameValue = response["name"]
                let bioValue = response["bio"]
                print("\(nameValue!)\(bioValue!)に変更されたよ")
                
                
                DispatchQueue.main.async {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let MyPageController = storyboard.instantiateViewController(withIdentifier: "MyPageController")
                    //                    self.navigationController?.pushViewController(MyPageController, animated: true)
                    //                    self.present(MyPageController, animated: true, completion: nil)
                    print("ここで前のハーフモーグルっぽい感じを解除して下に消えるようにしてマイページに戻りたい")
                    self.dismiss(animated: true, completion: nil)
                    print("マイページへの画面遷移成功だよ")
                }
                
            } catch{
                
            }
            
        }
        task.resume()

        
    }
    
    @IBAction func userDelete(_ sender: Any) {
        let config: URLSessionConfiguration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: config)
        
        let defaults = UserDefaults.standard
        let user_id = defaults.string(forKey: "userId")!
        
        //        let myplan_id = 66
        print(user_id)
        let url = URL(string: "https://api.date-suggester.com/v1/users/\(user_id)")!
        print(url)
        //URLRequestの生成
        var req: URLRequest = URLRequest(url: url)
        req.httpMethod = "DELETE"
        
        //ヘッダーを付与
        let myToken = defaults.string(forKey: "responseToken")!
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


