//
//  FirstViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/14.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit
import SVGKit
import ActiveLabel

class FirstViewController: UIViewController {
    
    @IBOutlet weak var dateDecideButton: UIButton!
    @IBOutlet weak var svgImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        #if DEBUG
        print("デバッグもーどだお")
        #else
        print("🍑")
        #endif
    }
    
    private func setupView() {
        let svgImage = SVGKImage(named: "mainImage")
        svgImage?.size = svgImageView.bounds.size
        svgImageView.image = svgImage?.uiImage
        
        self.view.addBackground(name: "Full")
        dateDecideButton.layer.cornerRadius = 29
        self.dateDecideButton.layer.borderColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0).cgColor
        self.dateDecideButton.layer.borderWidth = 1.0
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        //トークンの可否によって最初に表示させる画面を確認するため、暫定的に書いている
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "responseToken")
        //        defaults.set(true, forKey: "signUpStatus")
        defaults.removeObject(forKey: "signUpStatus")
    }
    
    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    @IBAction func dateDecideButton(_ sender: Any) {
        if UserDefaults.standard.string(forKey: "responseToken") != nil{
            let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
            let controller = storyboard.instantiateViewController(identifier: "DatePlanViewController")
            self.navigationController?.pushViewController(controller, animated: true)

        } else{
            let storyboard = UIStoryboard(name: "TutorialViewController", bundle: nil)
            let listenBirthyearViewController = storyboard.instantiateViewController(withIdentifier: "ListenBirthyearViewController")
            self.navigationController?.pushViewController(listenBirthyearViewController, animated: true)
        }
    }
    
    @IBAction func loginButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "TutorialViewController", bundle: nil)
        let loginViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        self.navigationController?.pushViewController(loginViewController, animated: true)
    }
}
