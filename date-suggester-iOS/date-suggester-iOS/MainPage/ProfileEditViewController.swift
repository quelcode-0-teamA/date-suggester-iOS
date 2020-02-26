//
//  ProfileEditViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/13.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class ProfileEditViewController: UIViewController {

    @IBOutlet weak var muName: UITextField!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var plofileEditButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //入力フォームにj初期値で現在の名前、自己紹介を表示させる
//        let defaults = UserDefaults.standard
//        editName.placeholder = defaults.string(forKey: "responseName")
//        editBio.placeholder = defaults.string(forKey: "responseBio")

        //外枠の色を指定
        self.plofileEditButton.layer.borderColor = UIColor.white.cgColor
        //外枠の太さを指定
        self.plofileEditButton.layer.borderWidth = 1.0
        
    }
    @IBAction func logout(_ sender: Any) {
    }
    
    @IBAction func plofileEditButton(_ sender: Any) {
    }
}

class CustomPlofielTextField: UITextField {

    // 下線用のUIViewを作っておく
    let underline: UIView = UIView()

    override func layoutSubviews() {
        super.layoutSubviews()

        self.frame.size.height = 50 // ここ変える
        

        composeUnderline() // 下線のスタイルセットおよび追加処理
        self.borderStyle = .none
    }

    private func composeUnderline() {
        self.underline.frame = CGRect(
            x: 0,                    // x, yの位置指定は親要素,
            y: self.frame.height,    // この場合はCustomTextFieldを基準にする
            width: self.frame.width,
            height: 2.5)

        self.underline.backgroundColor = UIColor(red:188, green:188, blue:188, alpha:1.0)

        self.addSubview(self.underline)
        self.bringSubviewToFront(self.underline)
    }
    
    
}
