//
//  LoginViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/06.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var myName: UITextField!
    @IBOutlet weak var myEmail: UITextField!
    @IBOutlet weak var myPassword: UITextField!
    @IBOutlet weak var myPasswordConfirmation: UITextField!
    
    
    
    @IBAction func signUpButton(_ sender: Any) {
        let config: URLSessionConfiguration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: config)
        
        //テキストフィールドに入力されたStringと取得して変数にいれる
        let name = myName.text
        let email = myEmail.text
        let password = myPassword.text
        let passwordConfirmation = myPasswordConfirmation.text
        
        let defaults = UserDefaults.standard
        let responsegender = defaults.string(forKey: "responsegender")!
        let responseBirthYear = defaults.string(forKey: "responseBirthYear")!
        
        //その変数たちを集めた変数をつくって、それをJSON形式でボディに付与する（1つめの辞書）
        let signUpParams = [
            "name": name,
            "birth_year": responseBirthYear,
            "gender": responsegender,
            "area_id": 1,
            "email": email,
            "password": password,
            "password_confirmation": passwordConfirmation
            ] as [String : Any]
        
        //URLオブジェクトの生成
        let url = URL(string: "https://api-date-suggester-dev.herokuapp.com/v1/sign_up")!
        //URLRequestの生成
        var req: URLRequest = URLRequest(url: url)
        req.httpMethod = "POST"
        
        //ヘッダーを付与
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //ボディーを付与（2つめの辞書）
        let parameter = ["user": signUpParams]
        
        req.httpBody = try! JSONSerialization.data(withJSONObject: parameter, options: .prettyPrinted)
        
        
        print(String(data: req.httpBody!, encoding: .utf8))
        
        //APIを呼ぶよ
        let task = session.dataTask(with: req){(data, response, error) in
            print(data)
            print(error)
            
            let responseString: String =  String(data: data!, encoding: .utf8)!
            print(responseString)
            
            do {
                let response: [String: Any] = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
                
                print(response)
                
                //辞書からtokenを取り出す
                let tokenValue = response["token"]
                let idValue = response["id"]
                let nameValue = response["name"]
                print(tokenValue!)
                
                //取り出したtokenをユーザーデフォルトに保存する
                let defaults = UserDefaults.standard
                defaults.set(tokenValue!, forKey: "responseToken")
                defaults.set(idValue!, forKey: "responseId")
                defaults.set(nameValue!, forKey: "responseName")

                print("ユーザーデフォルトにtokenとidを保存したよ")
                print(defaults.string(forKey: "responseName"))
                
                DispatchQueue.main.async {
                    let storyboard = UIStoryboard(name: "MainPageViewController", bundle: nil)
                    let MainPageViewController = storyboard.instantiateViewController(withIdentifier: "MainPageViewController")
                    MainPageViewController.modalPresentationStyle = .fullScreen
                    self.present(MainPageViewController, animated: true, completion: nil)
                }
                
            } catch{
                
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
