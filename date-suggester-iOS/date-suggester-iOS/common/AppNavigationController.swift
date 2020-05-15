//
//  AppNavigationController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/06.
//  Copyright © 2020 saya. All rights reserved.
//

//import UIKit
//
//class AppNavigationController: UINavigationController {
//
//    override func viewDidLoad() {
//        // 背景画像の設定
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "NavBarBG"), for: .default)
//        // タイトルテキストの装飾設定
//        self.navigationController?.navigationBar.titleTextAttributes = [
//            // 文字の色
//            .foregroundColor: UIColor.white
//        ]
//    }
//}

import UIKit

class AppNavigationController: UINavigationController {
    
    static let shared = AppNavigationController()
    
    func navigationSetUp() {
        navigationItem.hidesBackButton = true
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "NavBarBG"), for: .default)
        navigationItem.title = "Date Suggester"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.backBarButtonItem = UIBarButtonItem(title:  "", style:  .plain, target: nil, action: nil)
    }
}
