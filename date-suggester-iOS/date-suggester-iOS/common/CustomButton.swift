//
//  CustomButton.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/24.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 30
    }
}

class CustomWhiteBorderButtom: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 5
        
        //外枠の色を指定
        self.layer.borderColor = UIColor.white.cgColor
        //外枠の太さを指定
        self.layer.borderWidth = 1.0
    }
}
