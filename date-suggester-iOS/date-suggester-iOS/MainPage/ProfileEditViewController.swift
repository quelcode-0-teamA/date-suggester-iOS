//
//  ProfileEditViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/13.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class ProfileEditViewController: UIViewController {

    @IBOutlet weak var myName: CustomPlofielTextField!
    @IBOutlet weak var myEmail: CustomPlofielTextField!
    @IBOutlet weak var logoutButton: UIButton!
    
    @IBOutlet weak var plofileEditButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //入力フォームにj初期値で現在の名前、自己紹介を表示させる
//        let defaults = UserDefaults.standard
//        if defaults.string(forKey: "responseName") !== {
//            myName.placeholder = defaults.string(forKey: "responseName")
//        }
//
//        myEmail.placeholder = defaults.string(forKey: "responseBio")

        //外枠の色を指定
        self.plofileEditButton.layer.borderColor = UIColor.white.cgColor
        //外枠の太さを指定
        self.plofileEditButton.layer.borderWidth = 1.0
        
        /*
         ユーザー情報取得API
         */
        let config: URLSessionConfiguration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: config)
        
        //TODO: user_idをここで呼び出す
        let user_id = ""
        //URLを組み立てている
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api-date-suggester-dev.herokuapp.com"
        urlComponents.path = "/v1/users/\(user_id)"
        
        let url: URL = urlComponents.url!
        var req: URLRequest = URLRequest(url: url)
        req.httpMethod = "GET"
        
        print(url)
        
        //ヘッダーを付与
        let defaults = UserDefaults.standard
        let myToken = defaults.string(forKey: "responseToken")!
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        req.setValue("Bearer " + myToken, forHTTPHeaderField: "Authorization")
        
        
        //APIを呼ぶよ
        let task = session.dataTask(with: req){(data, response, error) in
            
            do {
                let response: [String: Any] = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
                
                print(response)
                
                DispatchQueue.main.async {
//                    if response["name"] != {
//                        self.myName.placeholder = (response["name"]) as? String
//                        } {
//                        self.myName.placeholder = ""
//                    }

                }
                
            } catch{
                
            }
            
        }
        task.resume()
        
    }
    
    
    @IBOutlet weak var womanButton: UIButton!
    @IBAction func WomenButton(_ sender: Any) {
        womanButton.setTitleColor(UIColor.red, for: .highlighted)
    }
    @IBAction func ManButton(_ sender: Any) {
    }
    @IBAction func OtherButton(_ sender: Any) {
    }
    
    
    @IBAction func logout(_ sender: Any) {
    }
    
    @IBAction func plofileEditButton(_ sender: Any) {
    }
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func accountDelete(_ sender: Any) {
        let config: URLSessionConfiguration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: config)
        
        //URLオブジェクトの生成
        let defaults = UserDefaults.standard
        //        let myplan_id = defaults.string(forKey: "responseMyPlanId")!

//        let myplan_id = 66
//        print(myplan_id)
//        let url = URL(string: "https://api-date-suggester-dev.herokuapp.com/v1/users/\(user_id)")!
//        print(url)
//        //URLRequestの生成
//        var req: URLRequest = URLRequest(url: url)
//        req.httpMethod = "DELETE"
//
//        //ヘッダーを付与
//        let myToken = defaults.string(forKey: "responseToken")!
//        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        req.setValue("Bearer " + myToken, forHTTPHeaderField: "Authorization")
//
//        //APIを呼ぶよ
//        let task = session.dataTask(with: req){(data, response, error) in
//            do {
//                //                let response: [String: Any] = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
//                let httpResponse = response as? HTTPURLResponse
//                debugPrint(httpResponse!.statusCode)
//
//                debugPrint("デートプランがリストから削除されたよ")
//                DispatchQueue.main.async {
//                    //                    self.dismiss(animated: true, completion: nil)
//                    self.dateScheduleTV.reloadData()
//                }
//
//            } catch{
//            }
//
//        }
//        task.resume()
    }
}

class CustomPlofielTextField: UITextField {
    // 下線用のUIViewを作っておく
    let underline: UIView = UIView()

    override func layoutSubviews() {
        super.layoutSubviews()
        self.frame.size.height = 50 // ここ変える
        composeUnderline() // 下線のスタイルセットおよび追加処理
        self.borderStyle = .none
    }

    private func composeUnderline() {
        self.underline.frame = CGRect(
            x: 0,                    // x, yの位置指定は親要素,
            y: self.frame.height,    // この場合はCustomTextFieldを基準にする
            width: self.frame.width,
            height: 2.5)

        self.underline.backgroundColor = UIColor(red:188, green:188, blue:188, alpha:1.0)

        self.addSubview(self.underline)
        self.bringSubviewToFront(self.underline)
    }
}
