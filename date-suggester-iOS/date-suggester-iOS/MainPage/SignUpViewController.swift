//
//  LoginViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/06.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit
import SVGKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    var activityIndicatorView = UIActivityIndicatorView()
    
    @IBOutlet weak var svgImageView: UIImageView!
    @IBOutlet weak var myEmail: CustomUnderlineTextField!
    @IBOutlet weak var myPassword: SignUpCustomTextField!
    @IBOutlet weak var myPasswordConfirmation: CustomUnderlineTextField!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        myEmail.delegate = self
        myPassword.delegate = self
        myPasswordConfirmation.delegate = self
        
        myEmail.attributedPlaceholder = NSAttributedString(string: "mail", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        myPassword.attributedPlaceholder = NSAttributedString(string: "pass", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        myPasswordConfirmation.attributedPlaceholder = NSAttributedString(string: "reenter pass", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        
        let svgImage = SVGKImage(named: "mainImage")
        svgImage?.size = svgImageView.bounds.size
        svgImageView.image = svgImage?.uiImage
        
        signUpButton.isEnabled = false
        signUpButton.layer.masksToBounds = true
        signUpButton.layer.cornerRadius = 24
        
        myPassword.isSecureTextEntry = true
        myPasswordConfirmation.isSecureTextEntry = true
        
        activityIndicatorView.center = view.center
        activityIndicatorView.style = .whiteLarge
        activityIndicatorView.color = .darkGray
        view.addSubview(activityIndicatorView)
    }

    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        signUpButton.isEnabled = checkInput()
        return true
    }

    func checkInput() -> Bool {
        let textCheck = myEmail.text! == "" || myPassword.text! == "" || myPasswordConfirmation.text! == ""
        return !textCheck
    }
    
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
                UserDefaults.standard.setSignUpStatus(status: true)
                UserDefaults.standard.setUserEmail(email: self.myEmail.text ?? "")
                
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
