//
//  MypageViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/13.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class MypageViewController: UIViewController {
    @IBOutlet weak var profileEditButton: UIButton!
    @IBAction func profileEditButtonTap(_ sender: Any) {
        let defaults = UserDefaults.standard
        let signUpStatus = defaults.string(forKey: "signUpStatus")
        
        
        if signUpStatus != nil {
            let storyboard = UIStoryboard(name: "MainPageViewController", bundle: nil)
            let ProfileEditViewController = storyboard.instantiateViewController(withIdentifier: "ProfileEditViewController")
            ProfileEditViewController.modalPresentationStyle = .fullScreen
            self.present(ProfileEditViewController, animated: true, completion: nil)
        } else {
            let storyboard = UIStoryboard(name: "MainPageViewController", bundle: nil)
            let SignUpViewController = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
            SignUpViewController.modalPresentationStyle = .fullScreen
            self.present(SignUpViewController, animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景画像の設定
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "test"), for: .default)
        // タイトルテキストの装飾設定
        self.navigationController?.navigationBar.titleTextAttributes = [
            // 文字の色
            .foregroundColor: UIColor.white
        ]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        // 次の画面のBackボタンを「戻る」に変更
         self.navigationItem.backBarButtonItem = UIBarButtonItem(
             title:  "戻る",
             style:  .plain,
             target: nil,
             action: nil
         )
        
        //ボタン装飾
        self.profileEditButton.layer.borderColor = UIColor.init(red: 254.0/255, green: 84.0/255, blue: 146.0/255, alpha: 1.0).cgColor
        self.profileEditButton.layer.borderWidth = 1.0
        self.profileEditButton.layer.cornerRadius = 10
        
        //プロフィール編集ボタンor登録ボタン
        let defaults = UserDefaults.standard
        let signUpStatus = defaults.string(forKey: "signUpStatus")
        
        
        if signUpStatus != nil {
            profileEditButton.setTitle("プロフィールを編集する", for: .normal)
        } else {
            profileEditButton.setTitle("アカウントを作成する", for: .normal)
        }
            
        }
    }
