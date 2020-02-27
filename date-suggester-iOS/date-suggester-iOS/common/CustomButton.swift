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
        self.layer.shadowRadius = 3.0
        //            self.layer.masksToBounds = true
        self.layer.cornerRadius = 5.0
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 0.5
    }
}