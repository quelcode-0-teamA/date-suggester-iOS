//
//  MypageViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/13.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit
import SVGKit

class MypageViewController: UIViewController {
    
    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userIcon.layer.cornerRadius = 70
//        let svgImage = SVGKImage(named: "userIcon")
//        svgImage?.size = userIcon.bounds.size
//        userIcon.image = svgImage?.uiImage
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "NavBarBG"), for: .default)
        self.navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationItem.backBarButtonItem = UIBarButtonItem(
            title:  "戻る",
            style:  .plain,
            target: nil,
            action: nil
        )
        
//        self.profileEditButton.layer.borderColor = UIColor.init(red: 254.0/255, green: 84.0/255, blue: 146.0/255, alpha: 1.0).cgColor
//        profileEditButton.layer.borderWidth = 1.0
//        self.profileEditButton.layer.cornerRadius = 10
        
//        let defaults = UserDefaults.standard
//        let signUpStatus = defaults.string(forKey: "signUpStatus")
//        
//        if signUpStatus != nil {
//            profileEditButton.setTitle("プロフィールを編集する", for: .normal)
//        } else {
//            profileEditButton.setTitle("アカウントを作成する", for: .normal)
//        }
    }
    
    @IBAction func gotoProfileEditButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "MainPageViewController", bundle: nil)
        let profileEditViewController = storyboard.instantiateViewController(withIdentifier: "ProfileEditViewController")
        self.navigationController?.pushViewController(profileEditViewController, animated: true)
    }
//    @IBAction func profileEditButtonTap(_ sender: Any) {
//        let defaults = UserDefaults.standard
//        let signUpStatus = defaults.string(forKey: "signUpStatus")
//
//        if signUpStatus != nil {
//            let storyboard = UIStoryboard(name: "MainPageViewController", bundle: nil)
//            let ProfileEditViewController = storyboard.instantiateViewController(withIdentifier: "ProfileEditViewController")
//            ProfileEditViewController.modalPresentationStyle = .fullScreen
//            self.present(ProfileEditViewController, animated: true, completion: nil)
//        } else {
//            let storyboard = UIStoryboard(name: "MainPageViewController", bundle: nil)
//            let SignUpViewController = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
//            SignUpViewController.modalPresentationStyle = .fullScreen
//            self.present(SignUpViewController, animated: true, completion: nil)
//        }
//    }
}
