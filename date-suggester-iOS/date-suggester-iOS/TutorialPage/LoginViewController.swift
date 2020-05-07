//
//  LoginViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/14.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit
import SVGKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
     var activityIndicatorView = UIActivityIndicatorView()
    
    @IBOutlet weak var myEmail: CustomUnderlineTextField!
    @IBOutlet weak var myPassword: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var svgImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()

    }
    
    private func setupView() {
        myEmail.attributedPlaceholder = NSAttributedString(string: "mail", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        myPassword.attributedPlaceholder = NSAttributedString(string: "pass", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        
        let svgImage = SVGKImage(named: "mainImage")
        svgImage?.size = svgImageView.bounds.size
        svgImageView.image = svgImage?.uiImage
        
        myEmail.delegate = self
        myPassword.delegate = self
        loginButton.isEnabled = false
        
        activityIndicatorView.center = view.center
        activityIndicatorView.style = .whiteLarge
        activityIndicatorView.color = .darkGray
        view.addSubview(activityIndicatorView)
        
        loginButton.layer.cornerRadius = 24
        myPassword.isSecureTextEntry = true
        
        myEmail.loginunderline.backgroundColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        loginButton.isEnabled = checkInput()
        return true
    }
    
    func checkInput() -> Bool {
        let textCheck = myEmail.text! == "" || myPassword.text! == ""
        return !textCheck
      }
    
    
    @IBAction func loginButtonTap(_ sender: Any) {
        
        func displayMyAlertMessage(userMessage: String){
            let myAlert = UIAlertController(title:"Alert", message: userMessage, preferredStyle:  UIAlertController.Style.alert)
            let okAction = UIAlertAction(title:"OK", style: UIAlertAction.Style.default, handler:nil)
            myAlert.view.tintColor = UIColor.init(red: 254.0/255, green: 84.0/255, blue: 146.0/255, alpha: 1.0)
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
        
        activityIndicatorView.startAnimating()
        self.view.isUserInteractionEnabled = false
        Api().login(parameter: parameter, completion: {(token, error) in
            
            if error != nil {
                DispatchQueue.main.async {
                    self.view.isUserInteractionEnabled = true
                    self.activityIndicatorView.stopAnimating()
                    let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
                    alert.view.tintColor = UIColor.init(red: 254.0/255, green: 84.0/255, blue: 146.0/255, alpha: 1.0)
                    alert.title = "そのEmailはすでに登録されています"
                    alert.message = "ログインをやり直してください"
                    alert.addAction(
                        UIAlertAction(title: "悲しいです", style: .cancel, handler: nil)
                    )
                    self.present(alert,animated: true,completion: nil)
                }

                return
            }
            
            guard let _token = token else {
                displayMyAlertMessage(userMessage: "このアカウントは登録されていません")
                return
            }
            UserDefaults.standard.setResponseToken(token: _token)

            DispatchQueue.main.async {
                let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
                let controller = storyboard.instantiateViewController(identifier: "DatePlanViewController")
                controller.modalPresentationStyle = .fullScreen
                self.present(controller, animated: true, completion: nil)
            }
        })
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
