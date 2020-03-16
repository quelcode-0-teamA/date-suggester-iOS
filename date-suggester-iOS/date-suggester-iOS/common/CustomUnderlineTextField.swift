//
//  CustomUnderlineTextField.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/03/02.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

//class CustomUnderlineTextField: UITextField {
//
//    // 下線用のUIViewを作っておく
//    let underline: UIView = UIView()
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        self.frame.size.height = 50 // ここ変える
//
//
//        composeUnderline() // 下線のスタイルセットおよび追加処理
//        self.borderStyle = .none
//    }
//
//     func composeUnderline() {
//        self.underline.frame = CGRect(
//            x: 0,                    // x, yの位置指定は親要素,
//            y: self.frame.height,    // この場合はCustomTextFieldを基準にする
//            width: self.frame.width,
//            height: 2.5)
//
//        self.underline.backgroundColor = UIColor(red:254, green:84, blue:146, alpha:1.0)
//
//        self.addSubview(self.underline)
//        self.bringSubviewToFront(self.underline)
//    }
//
//
//}
