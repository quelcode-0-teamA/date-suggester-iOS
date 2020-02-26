//
//  TutorialViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/04.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class TutorialViewController1: UIViewController {
    

    @IBOutlet weak var ManButton: UIButton!
    @IBOutlet weak var WomanButton: UIButton!
    
    @IBAction func ManButtonPush(_ sender: Any) {
        //API処理
        //選択されたジェンダーをユーザーデフォルトに保存
        let defaults = UserDefaults.standard
        defaults.set(1, forKey: "responsegender")
        
        //画面遷移
        let storyboard = UIStoryboard(name: "TutorialViewController", bundle: nil)
        let TutorialViewController2 = storyboard.instantiateViewController(withIdentifier: "TutorialViewController2")
        TutorialViewController2.modalPresentationStyle = .fullScreen
        self.present(TutorialViewController2, animated: false, completion: nil)
        
    }
    
    //どのボタンが押されたかわかるようにする
    
    @IBAction func WomanButtonPush(_ sender: Any) {
        //API処理
        //選択されたジェンダーをユーザーデフォルトに保存
        let defaults = UserDefaults.standard
        defaults.set(2, forKey: "responsegender")
        
        //画面遷移
        let storyboard = UIStoryboard(name: "TutorialViewController", bundle: nil)
        let TutorialViewController2 = storyboard.instantiateViewController(withIdentifier: "TutorialViewController2")
        TutorialViewController2.modalPresentationStyle = .fullScreen
        self.present(TutorialViewController2, animated: false, completion: nil)
        
    }
    
    
    @IBAction func skipButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "MainPageViewController", bundle: nil)
        let LoginViewController = storyboard.instantiateViewController(identifier: "LoginViewController")
        LoginViewController.modalPresentationStyle = .fullScreen
        present(LoginViewController, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ManButton.layer.cornerRadius = 5
        self.WomanButton.layer.cornerRadius = 5
        print("成功")
        
        // 表示したい画像の名前(拡張子含む)を引数とする。
        self.view.addBackground(name: "Full")
        
//        let rgba = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        
        //外枠の色を指定
        self.ManButton.layer.borderColor = UIColor.white.cgColor
        //外枠の太さを指定
        self.ManButton.layer.borderWidth = 1.0
        
        //外枠の色を指定
        self.WomanButton.layer.borderColor = UIColor.white.cgColor
        //外枠の太さを指定
        self.WomanButton.layer.borderWidth = 1.0

        
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

open class CustomLabel: UILabel {
    @IBInspectable open var spacing:CGFloat = 0 {
        didSet {
            let attributedString = NSMutableAttributedString(string: self.text!)
            attributedString.addAttribute(NSAttributedString.Key.kern, value: self.spacing, range: NSRange(location: 0, length: attributedString.length))
            self.attributedText = attributedString
        }
    }
}
