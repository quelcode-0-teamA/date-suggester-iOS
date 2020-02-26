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

    
    @IBAction func barRightButtonTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "MainPageViewController", bundle: nil)
        let SignInViewController = storyboard.instantiateViewController(withIdentifier: "SignInViewController")
        SignInViewController.modalPresentationStyle = .fullScreen
        self.present(SignInViewController, animated: true, completion: nil)
    }
    
    @IBAction func profileEditButtonTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "MainPageViewController", bundle: nil)
        let ProfileEditViewController = storyboard.instantiateViewController(withIdentifier: "ProfileEditViewController")
        self.navigationController?.pushViewController(ProfileEditViewController, animated: true)
        
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
        self.profileEditButton.layer.borderColor = UIColor.lightGray.cgColor
        self.profileEditButton.layer.borderWidth = 1.0
        self.profileEditButton.layer.cornerRadius = 10
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登録", style: .plain, target: self, action: #selector(self.move))
    }
    
//    @objc func move(){
//        let storyboard = UIStoryboard(name: "MainPageViewController", bundle: nil)
//        let SignInViewController = storyboard.instantiateViewController(withIdentifier: "SignInViewController")
//        SignInViewController.modalPresentationStyle = .fullScreen
//        self.present(SignInViewController, animated: true, completion: nil)
//    }
    

}

