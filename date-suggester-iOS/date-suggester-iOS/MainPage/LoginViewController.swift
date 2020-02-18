//
//  LoginViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/14.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var myEmail: SignInCustomTextField!
    @IBOutlet weak var myPassword: SignInCustomTextField!
    
    //func ifNotnil throw -> {}
    
    
    @IBAction func loginButtonTap(_ sender: Any) {
        //テキストフィールドに入力されたStringと取得して変数にいれる
        let email = myEmail.text
        let password = myPassword.text

    //その変数たちを集めた変数をつくって、それをJSON形式でボディに付与する（1つめの辞書）
        let signInParams = [
            "email": email,
            "password": password
            ]
        
        let parameter = ["user": signInParams]
        
        Api().login(parameter: parameter, completion: {(token, error) in
            
            if let _error = error {
                // アラートを出す
                return
            }
            
            guard let _token = token else {
                // アラートを出す
                return
            }
            
            //取り出したtokenをユーザーデフォルトに保存する
            let defaults = UserDefaults.standard
            defaults.set(_token, forKey: "responseToken")

            DispatchQueue.main.async {
                let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
                let controller = storyboard.instantiateViewController(identifier: "DatePlanViewController")
                controller.modalPresentationStyle = .fullScreen
                self.present(controller, animated: true, completion: nil)
            }
        })
        
//        //URLオブジェクトの生成
//        let url = URL(string: "https://api-date-suggester-dev.herokuapp.com/v1/login")!
//        //URLRequestの生成
//        var req: URLRequest = URLRequest(url: url)
//        req.httpMethod = "POST"
//
//        //ヘッダーを付与
//        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        //ボディーを付与（2つめの辞書）
//        let parameter = ["user": signInParams]
//
//        req.httpBody = try! JSONSerialization.data(withJSONObject: parameter, options: .prettyPrinted)
//
//
//        print(String(data: req.httpBody!, encoding: .utf8))
//
//        //APIを呼ぶよ
//        let task = session.dataTask(with: req){(data, response, error) in
//            debugPrint("a  \(data)")
//            print("b  \(error)")
//
//            //例外処理
//            guard let _data = data else {
//                debugPrint("era-dayo")
//                return
//            }
//
//            do {
//                guard let response: [String: Any] = try JSONSerialization.jsonObject(with: _data, options: []) as? [String: Any] else {
//                    debugPrint("serial error")
//                    return
//                }
//
//                print(response)
//
//                //辞書からtokenを取り出す
//                guard let tokenValue = response["token"] else {
//                    debugPrint("token error")
//                    return
//                }
//
//                print(tokenValue)
//
//                //取り出したtokenをユーザーデフォルトに保存する
//                let defaults = UserDefaults.standard
//                defaults.set(tokenValue, forKey: "responseToken")
//
//                print("ユーザーデフォルトにtokenを保存したよ")
//                print("ログインしました")
//
//                DispatchQueue.main.async {
//                    let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
//                    let controller = storyboard.instantiateViewController(identifier: "DatePlanViewController")
//                    controller.modalPresentationStyle = .fullScreen
//                    self.present(controller, animated: true, completion: nil)
//                }
//
//            } catch{
//            }
//
//        }
//        task.resume()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.frame.size.height = 50 // ここ変える
        
        //キーボードを閉じる
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }

        func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}


class SignInCustomTextField: UITextField {
        override func layoutSubviews() {
            super.layoutSubviews()

            self.frame.size.height = 50 // ここ変える
            self.borderStyle = .none
            
//            self.layer.borderWidth = 1
//            self.layer.borderColor = UIColor.white.cgColor
//            self.layer.cornerRadius = 3

            self.layer.masksToBounds = false
//            self.layer.shadowRadius = 3.0
            self.layer.shadowColor = UIColor.gray.cgColor
            self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
            self.layer.shadowOpacity = 0.5
        }
    
    let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 5)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
