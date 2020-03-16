//
//  SimplePlanViewController3.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/06.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class DateTimeViewController: UIViewController {
    var youserAnswer: AnswerModel = .init()
    
    @IBOutlet weak var RoundProgressBar: UIProgressView!
    @IBOutlet weak var allDayButton: UIButton!
    @IBOutlet weak var lunchButton: UIButton!
    @IBOutlet weak var nightButton: UIButton!
    
    
    @IBAction func allDayButtonTap(_ sender: Any) {
        gotoDateFeelingVC(selectAnserNumber:0)
    }
    
    @IBAction func lunchButtonTap(_ sender: Any) {
        gotoDateFeelingVC(selectAnserNumber:1)
    }
    
    @IBAction func dinnerButtonTap(_ sender: Any) {
        gotoDateFeelingVC(selectAnserNumber:2)
    }
    
    private func gotoDateFeelingVC(selectAnserNumber: Int) {
        youserAnswer.answer3 = selectAnserNumber
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        guard let dateFeelingViewController = storyboard.instantiateViewController(withIdentifier: "DateFeelingViewController") as? DateFeelingViewController else {
            return
        }
        dateFeelingViewController.youserAnswer = youserAnswer
        print(youserAnswer.answer3)
        self.navigationController?.pushViewController(dateFeelingViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint("\(#function), \(#line)")
        print("前の画面から\(youserAnswer.answer1)と\(youserAnswer.answer2)という値が渡されました")
        
        self.allDayButton.layer.cornerRadius = 5
        self.lunchButton.layer.cornerRadius = 5
        self.nightButton.layer.cornerRadius = 5
        
        // 次の画面のBackボタンを「戻る」に変更
        self.navigationItem.backBarButtonItem = UIBarButtonItem(
            title:  "戻る",
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
