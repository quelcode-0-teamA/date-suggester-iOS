//
//  TutorialViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/04.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class InformationViewController: UIViewController {

    @IBOutlet weak var gotoSimplePlanButton: UIButton!
    
    @IBAction func gotoSimplePlanButton(_ sender: Any) {
        _ = UserDefaults.standard
        if UserDefaults.standard.string(forKey: "tutorialStatus") == nil{
            let storyboard = UIStoryboard(name: "TutorialViewController", bundle: nil)
            let listenBirthyearViewController = storyboard.instantiateViewController(withIdentifier: "ListenBirthyearViewController")
            listenBirthyearViewController.modalPresentationStyle = .fullScreen
            self.present(listenBirthyearViewController, animated: false, completion: nil)
            
        } else{
            let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
            let controller = storyboard.instantiateViewController(identifier: "DatePlanViewController")
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: false, completion: nil)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.gotoSimplePlanButton.layer.cornerRadius = 40
        self.view.addBackground(name: "Full")
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
