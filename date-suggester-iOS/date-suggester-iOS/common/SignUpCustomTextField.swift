//
//  SignUpCustomTextField.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/03/03.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class SignUpCustomTextField: UITextField {
        override func layoutSubviews() {
            super.layoutSubviews()

            self.frame.size.height = 50
            self.borderStyle = .none
            self.layer.masksToBounds = false
            self.layer.shadowColor = UIColor.gray.cgColor
            self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
            self.layer.shadowOpacity = 0.5
        }
    
    let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 5)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
