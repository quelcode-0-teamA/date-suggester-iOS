//
//  LoginViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/06.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    var activityIndicatorView = UIActivityIndicatorView()
    
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var myEmail: SignUpCustomTextField!
    @IBOutlet weak var myPassword: SignUpCustomTextField!
    @IBOutlet weak var myPasswordConfirmation: SignUpCustomTextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myEmail.delegate = self
        myPassword.delegate = self
        myPasswordConfirmation.delegate = self
        
        signUpButton.isEnabled = false
        
        activityIndicatorView.center = view.center
        activityIndicatorView.style = .whiteLarge
        activityIndicatorView.color = .darkGray
        view.addSubview(activityIndicatorView)
        
        signUpButton.layer.masksToBounds = true
        signUpButton.layer.cornerRadius = 30
        
        subView.layer.cornerRadius = 30
        subView.layer.shadowRadius = 3.0
        subView.layer.masksToBounds = false
        subView.layer.shadowColor = UIColor.gray.cgColor
        subView.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        subView.layer.shadowOpacity = 0.3
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        signUpButton.isEnabled = checkInput()
        return true
    }

    func checkInput() -> Bool {
        let textCheck = myEmail.text! == "" || myPassword.text! == "" || myPasswordConfirmation.text! == ""
        return !textCheck
    }
    
    //キーボードを閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        
        func displayMyAlertMessage(userMessage: String){
            let myAlert = UIAlertController(title:"Alert", message: userMessage, preferredStyle:  UIAlertController.Style.alert)
            let okAction = UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler:nil)
            myAlert.addAction(okAction);
            myAlert.view.tintColor = UIColor.init(red: 254.0/255, green: 84.0/255, blue: 146.0/255, alpha: 1.0)
            self.present(myAlert,animated:true, completion:nil)
        }
        
        let email = myEmail.text
        let password = myPassword.text
        let passwordConfirmation = myPasswordConfirmation.text
        let signUpParams = [
            "email": email!,
            "password": password!,
            "password_confirmation": passwordConfirmation!
            ] as [String : Any]
        
        let parameter = ["formal_user": signUpParams]

        if(password != passwordConfirmation){
            displayMyAlertMessage(userMessage: "パスワードが一致していません。")
            return
        }
        
        // くるくるをだす SVProgressHUD.show()
        activityIndicatorView.startAnimating()
        
        //isUserInteractionEnabledはタッチ可能かどうかをコントロールする
        self.view.isUserInteractionEnabled = false
        
        Api().fomalSignUp(parameter: parameter, completion: {(token, error) in
            
            if error != nil {
                // アラートを出す
                DispatchQueue.main.async {
                    self.view.isUserInteractionEnabled = true
                    self.activityIndicatorView.stopAnimating()
                    let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
                    alert.view.tintColor = UIColor.init(red: 254.0/255, green: 84.0/255, blue: 146.0/255, alpha: 1.0)
                    alert.title = "エラーが発生しました"
                    alert.message = "SignUpをやり直してください"
                    alert.addAction(
                        UIAlertAction(title: "悲しいです", style: .cancel, handler: nil)
                    )
                    self.present(alert,animated: true,completion: nil)
                }
                return
            }
            
            DispatchQueue.main.async {
                let defaults = UserDefaults.standard
                defaults.set(true, forKey: "signUpStatus")
                
                self.view.isUserInteractionEnabled = true
                self.activityIndicatorView.stopAnimating()
                
                let storyboard = UIStoryboard(name: "MainPageViewController", bundle: nil)
                let mainPageViewController = storyboard.instantiateViewController(withIdentifier: "MainPageViewController")
                mainPageViewController.modalPresentationStyle = .fullScreen
                self.present(mainPageViewController, animated: true, completion: nil)
                debugPrint("サインアップ完了")
            }
        })
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
