//
//  FirstViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/14.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit
import SVGKit
import ActiveLabel

class FirstViewController: UIViewController {
    
    @IBOutlet weak var dateDecideButton: UIButton!
    @IBOutlet weak var svgImageView: UIImageView!

    @IBOutlet weak var sumpleLabel: ActiveLabel!
    let label = ActiveLabel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let customType3 = ActiveType.custom(pattern: "\\ssupports\\b") //Looks for "supports"
        label.enabledTypes.append(customType3)
        label.urlMaximumLength = 31
        
        label.customize { label in
            label.text = "Let's trim a long link: \nhttps://twitter.com/pocoochan"
            label.numberOfLines = 0
            label.lineSpacing = 4
            
            label.textColor = UIColor(red: 102.0/255, green: 117.0/255, blue: 127.0/255, alpha: 1)
            label.URLColor = UIColor(red: 85.0/255, green: 238.0/255, blue: 151.0/255, alpha: 1)
            label.URLSelectedColor = UIColor(red: 82.0/255, green: 190.0/255, blue: 41.0/255, alpha: 1)

//            let url = URL(string:"https://twitter.com/pocoochan")
            label.handleURLTap { self.sumpleURL(url: $0) }

            label.configureLinkAttribute = { (type, attributes, isSelected) in
                var atts = attributes
                switch type {
                case customType3:
                    atts[NSAttributedString.Key.font] = isSelected ? UIFont.boldSystemFont(ofSize: 16) : UIFont.boldSystemFont(ofSize: 14)
                default: ()
                }
                return atts
            }
        }

        label.frame = CGRect(x: 20, y: 40, width: view.frame.width - 40, height: 40)
        view.addSubview(label)
        
//        let label = ActiveLabel()
//        sumpleLabel.numberOfLines = 0
//        sumpleLabel.enabledTypes = [.url]
//        sumpleLabel.text = "This is a post"
//        sumpleLabel.textColor = .red
//        sumpleLabel.handleHashtagTap { hashtag in
//            print("Success. You just tapped the \(hashtag) hashtag")
//        }
        
        let svgImage = SVGKImage(named: "mainImage")
        svgImage?.size = svgImageView.bounds.size
        svgImageView.image = svgImage?.uiImage
        
        self.view.addBackground(name: "Full")
        dateDecideButton.layer.cornerRadius = 29
        self.dateDecideButton.layer.borderColor = UIColor.init(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0).cgColor
        self.dateDecideButton.layer.borderWidth = 1.0
        
        //トークンがなかった場合に最初に表示させる画面を確認するため、暫定的に書いている
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "responseToken")
//        defaults.set(true, forKey: "signUpStatus")
        defaults.removeObject(forKey: "signUpStatus")
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func sumpleURL(url: URL) {
        if( UIApplication.shared.canOpenURL(url) ) {
          UIApplication.shared.open(url)
        }
    }
    
    func alert(_ title: String, message: String) {
        let vc = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        vc.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func safari(_ sender: Any) {
        print("🍒")
        let url = URL(string:"https://github.com/pocoochan")
        if( UIApplication.shared.canOpenURL(url!) ) {
            UIApplication.shared.open(url!)
        }
    }
    
    @IBAction func dateDecideButton(_ sender: Any) {
        if UserDefaults.standard.string(forKey: "responseToken") != nil{
            let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
            let controller = storyboard.instantiateViewController(identifier: "DatePlanViewController")
            self.navigationController?.pushViewController(controller, animated: true)

        } else{
            let storyboard = UIStoryboard(name: "TutorialViewController", bundle: nil)
            let listenBirthyearViewController = storyboard.instantiateViewController(withIdentifier: "ListenBirthyearViewController")
            self.navigationController?.pushViewController(listenBirthyearViewController, animated: true)
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
