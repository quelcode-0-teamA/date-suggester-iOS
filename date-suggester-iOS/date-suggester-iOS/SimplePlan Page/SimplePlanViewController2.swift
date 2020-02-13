//
//  SimplePlanViewController2.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/06.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class SimplePlanViewController2: UIViewController {
    var NumberOfButtons: Int = 3  //ボタンの数
    var CheckedButtonTag = 0  //チェックされているボタンのタグ
    

    @IBOutlet weak var savingButton: UIButton!
    @IBOutlet weak var normalButton: UIButton!
    @IBOutlet weak var richButton: UIButton!
    
//    @IBAction func normalButtonTauch(_ sender: Any) {
//        print("ボタンが押されています")
//        checkMark.isHidden = false
//    }
    
    @IBAction func normalButtonTap(_ sender: Any) {
        print("ふつうボタンがおされました")
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        let SimplePlanViewController3 = storyboard.instantiateViewController(withIdentifier: "SimplePlanViewController3")
//        SimplePlanViewController3.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(SimplePlanViewController3, animated: true)
//        self.present(SimplePlanViewController3, animated: false, completion: nil)
    }
    
    
    @IBAction func savingButtonTap(_ sender: Any) {
        //        checkMark.isHidden = !checkMark.isHidden
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        let SimplePlanViewController3 = storyboard.instantiateViewController(withIdentifier: "SimplePlanViewController3")
//        SimplePlanViewController3.modalPresentationStyle = .fullScreen
         self.navigationController?.pushViewController(SimplePlanViewController3, animated: true)
//        self.present(SimplePlanViewController3, animated: false, completion: nil)
        print("せつやくボタンがおされました")
    }
    
    @IBAction func richButtonTap(_ sender: Any) {
        //        checkMark.isHidden = !checkMark.isHidden
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        let SimplePlanViewController3 = storyboard.instantiateViewController(withIdentifier: "SimplePlanViewController3")
        SimplePlanViewController3.modalPresentationStyle = .fullScreen
        self.present(SimplePlanViewController3, animated: false, completion: nil)
        print("りっちボタンがおされました")
    }
    
    override func viewDidLoad() {
           super.viewDidLoad()
        self.savingButton.layer.cornerRadius = 30
        self.normalButton.layer.cornerRadius = 30
        self.richButton.layer.cornerRadius = 30
        
        // 次の画面のBackボタンを「戻る」に変更
        self.navigationItem.backBarButtonItem = UIBarButtonItem(
            title:  "Back",
            style:  .plain,
            target: nil,
            action: nil
        )
       }

}
