//
//  CustomUnderlineTextField.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/03/02.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class CustomUnderlineTextField: UITextField {
    let loginunderline: UIView = UIView()
    override func layoutSubviews() {
        super.layoutSubviews()
        self.frame.size.height = 50
        composeUnderline()
        self.borderStyle = .none
    }
    
    func composeUnderline() {
        self.loginunderline.frame = CGRect(
            x: 0,                    // x, yの位置指定は親要素,
            y: self.frame.height,    // この場合はCustomTextFieldを基準にする
            width: self.frame.width,
            height: 2.5)
        loginunderline.backgroundColor = UIColor.init(red: 254.0/255, green: 84.0/255, blue: 146.0/255, alpha: 0.9)
        self.addSubview(self.loginunderline)
        self.bringSubviewToFront(self.loginunderline)
    }
}
