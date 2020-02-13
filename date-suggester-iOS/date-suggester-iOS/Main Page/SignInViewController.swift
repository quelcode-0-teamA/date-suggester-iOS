//
//  LoginViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/06.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBAction func signInButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "MainPageViewController", bundle: nil)
        let MainPageViewController = storyboard.instantiateViewController(withIdentifier: "MainPageViewController")
        MainPageViewController.modalPresentationStyle = .fullScreen
        self.present(MainPageViewController, animated: true, completion: nil)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    

}
