//
//  LoginViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/14.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var myEmail: UITextField!
    @IBOutlet weak var myPassword: UITextField!
    
    //func ifNotnil throw -> {}
    
    
    @IBAction func loginButtonTap(_ sender: Any) {
        let config: URLSessionConfiguration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: config)
        
        //テキストフィールドに入力されたStringと取得して変数にいれる
        let email = myEmail.text
        let password = myPassword.text

        //その変数たちを集めた変数をつくって、それをJSON形式でボディに付与する（1つめの辞書）
        let signInParams = [
            "email": email,
            "password": password
            ] as [String : Any]
        
        //URLオブジェクトの生成
        let url = URL(string: "https://api-date-suggester-dev.herokuapp.com/v1/login")!
        //URLRequestの生成
        var req: URLRequest = URLRequest(url: url)
        req.httpMethod = "POST"
        
        //ヘッダーを付与
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //ボディーを付与（2つめの辞書）
        let parameter = ["user": signInParams]
        
        req.httpBody = try! JSONSerialization.data(withJSONObject: parameter, options: .prettyPrinted)
        
        
        print(String(data: req.httpBody!, encoding: .utf8))
        
        //APIを呼ぶよ
        let task = session.dataTask(with: req){(data, response, error) in
            print(data)
            print(error)
                
            //エラーがはいってたらスルーする
            let responseString: String =  String(data: data!, encoding: .utf8)!
            print(responseString)
            
            do {
                
//                try ifnil(error)
                let response: [String: Any] = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
                
                print(response)
                
                //辞書からtokenを取り出す
                let tokenValue = response["token"]
                print(tokenValue!)
                
                //取り出したtokenをユーザーデフォルトに保存する
                let defaults = UserDefaults.standard
                defaults.set(tokenValue!, forKey: "responseToken")
                
                print("ユーザーデフォルトにtokenを保存したよ")
                print("ログインしました")
                
                DispatchQueue.main.async {
                    let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
                    let controller = storyboard.instantiateViewController(identifier: "DatePlanViewController")
                    controller.modalPresentationStyle = .fullScreen
                    self.present(controller, animated: true, completion: nil)
                }
                
            } catch{
                print("ログインできません")
            }
            
        }
        task.resume()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //キーボードを閉じる
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }

        func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
        
    }
}
