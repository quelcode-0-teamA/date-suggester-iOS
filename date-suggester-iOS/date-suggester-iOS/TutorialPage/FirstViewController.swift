//
//  FirstViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/14.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var dateDecideButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addBackground(name: "Full")
        dateDecideButton.layer.cornerRadius = 40
        
        //トークンがなかった場合に最初に表示させる画面を確認するため、暫定的に書いている
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "responseToken")
        defaults.removeObject(forKey: "signUpStatus")
    }
    
    @IBAction func dateDecideButton(_ sender: Any) {
        if UserDefaults.standard.string(forKey: "responseToken") != nil{
            let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
            let controller = storyboard.instantiateViewController(identifier: "DatePlanViewController")
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: true, completion: nil)
            
        } else{
            let storyboard = UIStoryboard(name: "TutorialViewController", bundle: nil)
            let listenBirthyearViewController = storyboard.instantiateViewController(withIdentifier: "ListenBirthyearViewController")
            listenBirthyearViewController.modalPresentationStyle = .fullScreen
            self.present(listenBirthyearViewController, animated: true, completion: nil)
        }
    }
}

extension UIView {
    func addBackground(name: String) {
        // スクリーンサイズの取得
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        // スクリーンサイズにあわせてimageViewの配置
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        //imageViewに背景画像を表示
        imageViewBackground.image = UIImage(named: name)
        
        // 画像の表示モードを変更。
        imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill
        
        // subviewをメインビューに追加
        self.addSubview(imageViewBackground)
        // 加えたsubviewを、最背面に設置する
        self.sendSubviewToBack(imageViewBackground)
    }
}
