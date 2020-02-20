//
//  SimplePlanViewController2.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/06.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class DateBudgetViewController: UIViewController {
    var NumberOfButtons: Int = 3  //ボタンの数
    var CheckedButtonTag = 0  //チェックされているボタンのタグ
    

    @IBOutlet weak var RoundProgressBar: UIProgressView!
    @IBOutlet weak var savingButton: UIButton!
    @IBOutlet weak var normalButton: UIButton!
    @IBOutlet weak var richButton: UIButton!
    
    @IBAction func normalButtonTap(_ sender: Any) {
        print("ふつうボタンがおされました")
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        let DateTimeViewController = storyboard.instantiateViewController(withIdentifier: "DateTimeViewController")
        self.navigationController?.pushViewController(DateTimeViewController, animated: true)
    }
    
    
    @IBAction func savingButtonTap(_ sender: Any) {
        //        checkMark.isHidden = !checkMark.isHidden
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        let DateTimeViewController = storyboard.instantiateViewController(withIdentifier: "DateTimeViewController")
         self.navigationController?.pushViewController(DateTimeViewController, animated: true)
        print("せつやくボタンがおされました")
    }
    
    @IBAction func richButtonTap(_ sender: Any) {
        //        checkMark.isHidden = !checkMark.isHidden
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        let DateTimeViewController = storyboard.instantiateViewController(withIdentifier: "DateTimeViewController")
        self.navigationController?.pushViewController(DateTimeViewController, animated: true)
        print("りっちボタンがおされました")
    }
    
    override func viewDidLoad() {
           super.viewDidLoad()
        self.savingButton.layer.cornerRadius = 5
        self.normalButton.layer.cornerRadius = 5
        self.richButton.layer.cornerRadius = 5
        
        // 次の画面のBackボタンを「戻る」に変更
        self.navigationItem.backBarButtonItem = UIBarButtonItem(
            title:  "Back",
            style:  .plain,
            target: nil,
            action: nil
        )
        
        RoundProgressBar.transform = RoundProgressBar.transform.scaledBy(x: 1, y: 2)
        RoundProgressBar.layer.cornerRadius = 4
        RoundProgressBar.clipsToBounds = true
        RoundProgressBar.layer.sublayers![1].cornerRadius = 4
        RoundProgressBar.subviews[1].clipsToBounds = true
        
       }

}
