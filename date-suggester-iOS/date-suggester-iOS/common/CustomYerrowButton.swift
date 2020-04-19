//
//  CustomButton.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/24.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class CustomYerrowButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 30
        self.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        self.layer.shadowColor = UIColor.init(red: 217.0/255, green: 196.0/255, blue: 125.0/255, alpha: 1.0).cgColor
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0
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
