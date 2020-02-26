//
//  SimplePlanViewController2.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/06.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit


class DateBudgetViewController: UIViewController {
    var youserAnswer: AnswerModel = .init()
    var NumberOfButtons: Int = 3  //ボタンの数
    var CheckedButtonTag = 0  //チェックされているボタンのタグ
    

    @IBOutlet weak var RoundProgressBar: UIProgressView!
    @IBOutlet weak var savingButton: UIButton!
    @IBOutlet weak var normalButton: UIButton!
    @IBOutlet weak var richButton: UIButton!
    

    
    
    @IBAction func savingButtonTap(_ sender: Any) {
        gotoDateTimeVC(selectAnserNumber:0)
    }
    @IBAction func normalButtonTap(_ sender: Any) {
        gotoDateTimeVC(selectAnserNumber:1)
    }
    
    @IBAction func richButtonTap(_ sender: Any) {
        gotoDateTimeVC(selectAnserNumber:2)
    }
    
    private func gotoDateTimeVC(selectAnserNumber: Int) {
        youserAnswer.answer2 = selectAnserNumber
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        guard let dateTimeViewController = storyboard.instantiateViewController(withIdentifier: "DateTimeViewController") as? DateTimeViewController else {
            return
        }
        dateTimeViewController.youserAnswer = youserAnswer
        print(youserAnswer.answer2)
        self.navigationController?.pushViewController(dateTimeViewController, animated: true)
       }
    
    override func viewDidLoad() {
           super.viewDidLoad()
        debugPrint("\(#function), \(#line)")
        print("前の画面から\(youserAnswer.answer1)という値が渡されました")
        
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
