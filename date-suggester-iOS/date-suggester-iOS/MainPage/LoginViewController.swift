//
//  LoginViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/14.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var myEmail: CustomUnderlineTextField!
    @IBOutlet weak var myPassword: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var backGroundImage: UIImageView!
    @IBOutlet weak var subView: UIView!
    
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
        
        let picture = UIImage(named: "test")
        self.loginButton.setBackgroundImage(picture, for: .normal)
        self.loginButton.layer.masksToBounds = true
        self.loginButton.layer.cornerRadius = 30
        
        self.backGroundImage.layer.cornerRadius = 30
        subView.layer.cornerRadius = 30
        subView.layer.shadowRadius = 3.0
        subView.layer.masksToBounds = false
        subView.layer.shadowColor = UIColor.gray.cgColor
        subView.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        subView.layer.shadowOpacity = 0.3
        
        myEmail.loginunderline.backgroundColor = UIColor.init(red: 254.0/255, green: 84.0/255, blue: 146.0/255, alpha: 1.0)
    }
    
    @IBAction func loginButtonTap(_ sender: Any) {
        func displayMyAlertMessage(userMessage: String){
            let myAlert = UIAlertController(title:"Alert", message: userMessage, preferredStyle:  UIAlertController.Style.alert)
            let okAction = UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler:nil)
            myAlert.addAction(okAction);
            self.present(myAlert,animated:true, completion:nil)
        }
        
        let email = myEmail.text
        let password = myPassword.text
        
        let signInParams = [
            "email": email,
            "password": password
        ]
        
        let parameter = ["user": signInParams]
        
        Api().login(parameter: parameter, completion: {(token, error) in
            
            if error != nil {
                displayMyAlertMessage(userMessage: "ログインをやり直してください")
                return
            }
            
            guard let _token = token else {
                displayMyAlertMessage(userMessage: "このアカウントは登録されていません")
                return
            }
            
            let defaults = UserDefaults.standard
            defaults.set(_token, forKey: "responseToken")
            
            DispatchQueue.main.async {
                let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
                let controller = storyboard.instantiateViewController(identifier: "DatePlanViewController")
                controller.modalPresentationStyle = .fullScreen
                self.present(controller, animated: true, completion: nil)
            }
        })
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}


class CustomUnderlineTextField: UITextField {
    let loginunderline: UIView = UIView()
    override func layoutSubviews() {
        super.layoutSubviews()
        self.frame.size.height = 50
        composeUnderline()
        self.borderStyle = .none
    }
    
    func composeUnderline() {
        self.loginunderline.frame = CGRect(
            x: 0,                    // x, yの位置指定は親要素,
            y: self.frame.height,    // この場合はCustomTextFieldを基準にする
            width: self.frame.width,
            height: 2.5)
        loginunderline.backgroundColor = UIColor.init(red: 254.0/255, green: 84.0/255, blue: 146.0/255, alpha: 0.9)
        self.addSubview(self.loginunderline)
        self.bringSubviewToFront(self.loginunderline)
    }
}
