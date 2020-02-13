//
//  SimplePlanViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/05.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class SimplePlanViewController1: UIViewController {
     
    @IBOutlet weak var near: UIButton!
    @IBOutlet weak var far: UIButton!
    
    @IBAction func nearButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        let SimplePlanViewController2 = storyboard.instantiateViewController(withIdentifier: "SimplePlanViewController2")
        self.navigationController?.pushViewController(SimplePlanViewController2, animated: true)
    }
    
    @IBAction func farButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        let SimplePlanViewController2 = storyboard.instantiateViewController(withIdentifier: "SimplePlanViewController2")
        self.navigationController?.pushViewController(SimplePlanViewController2, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.far.layer.cornerRadius = 30
        self.near.layer.cornerRadius = 30
        
        // 背景画像の設定
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "test"), for: .default)
        // タイトルテキストの装飾設定
        self.navigationController?.navigationBar.titleTextAttributes = [
            // 文字の色
            .foregroundColor: UIColor.white
        ]
        // アイテム色設定
           self.navigationController?.navigationBar.tintColor = UIColor.white
        
        // 次の画面のBackボタンを「戻る」に変更
        self.navigationItem.backBarButtonItem = UIBarButtonItem(
            title:  "戻る",
            style:  .plain,
            target: nil,
            action: nil
        )
        
    }
    
//    @IBAction func tapAction(_ sender: Any) {
//        print("画像がタップされたおー")
//        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
//        let SimplePlanViewController2 = storyboard.instantiateViewController(withIdentifier: "SimplePlanViewController2")
//        self.navigationController?.pushViewController(SimplePlanViewController2, animated: true)
//        SimplePlanViewController2.modalPresentationStyle = .fullScreen
//        self.present(SimplePlanViewController2, animated: true, completion: nil)
   
    
}




