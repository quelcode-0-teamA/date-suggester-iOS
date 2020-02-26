//
//  AppNavigationController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/06.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class AppNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        //ナビゲーションバー のスタイルを設定、ストーリーボード でクラスを変えちゃう
//        navigationBar.barTintColor = UIColor.blue
        
//        let controller = SimplePlanViewController()
//        controller.text = "aaaaa"
//        present(controller, animated: true, completion: nil)
        
//        SimplePlanViewControllerで変えたいところに値を代入する
//        使い回したい画面があるコントローラー
//        まず宣言する　var text: String?
//        let label = UILabel()
//                label.text = text
        
        // 背景画像の設定
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "test"), for: .default)
        // タイトルテキストの装飾設定
        self.navigationController?.navigationBar.titleTextAttributes = [
            // 文字の色
            .foregroundColor: UIColor.white
        ]
        
    }
}
