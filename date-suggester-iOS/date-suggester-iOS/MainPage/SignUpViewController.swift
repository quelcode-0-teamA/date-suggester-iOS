//
//  LoginViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/06.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    var activityIndicatorView = UIActivityIndicatorView()
    
    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var myEmail: SignUpCustomTextField!
    @IBOutlet weak var myPassword: SignUpCustomTextField!
    @IBOutlet weak var myPasswordConfirmation: SignUpCustomTextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicatorView.center = view.center
        activityIndicatorView.style = .whiteLarge
        activityIndicatorView.color = .darkGray

        
        
        signUpButton.layer.masksToBounds = true
        signUpButton.layer.cornerRadius = 30
        
        subView.layer.cornerRadius = 30
        subView.layer.shadowRadius = 3.0
        subView.layer.masksToBounds = false
        subView.layer.shadowColor = UIColor.gray.cgColor
        subView.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        subView.layer.shadowOpacity = 0.3
        
        //キーボードを閉じる
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
        
        func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true)
        }
    }
    
    @IBAction func signUpButton(_ sender: Any) {
        let email = myEmail.text
        let password = myPassword.text
        let passwordConfirmation = myPasswordConfirmation.text
        let signUpParams = [
            "email": email!,
            "password": password!,
            "password_confirmation": passwordConfirmation!
            ] as [String : Any]
        
        let parameter = ["formal_user": signUpParams]
        
        // くるくるをだす SVProgressHUD.show()
        view.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
        // 非同期処理などが終了したらメインスレッドでアニメーション終了
        
        
        //isUserInteractionEnabledはタッチ可能かどうかをコントロールする
        self.view.isUserInteractionEnabled = false
        
        Api().fomalSignUp(parameter: parameter, completion: {(token, error) in
            
            //くるくる消す
            
            
            if let _error = error {
                // アラートを出す
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
