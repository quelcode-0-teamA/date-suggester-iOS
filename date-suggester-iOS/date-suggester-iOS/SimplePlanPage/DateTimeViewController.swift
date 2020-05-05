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
    
    @IBOutlet weak var roundProgressBar: UIProgressView!
    @IBOutlet weak var allDayButton: UIButton!
    @IBOutlet weak var lunchButton: UIButton!
    @IBOutlet weak var nightButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("前の画面から\(youserAnswer.answer1)と\(youserAnswer.answer2)という値が渡されました")
        
        setupView()

    }
    
    private func setupView() {
        allDayButton.layer.cornerRadius = 5
        lunchButton.layer.cornerRadius = 5
        nightButton.layer.cornerRadius = 5
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title:  "戻る",
            style:  .plain,
            target: nil,
            action: nil
        )
        
        roundProgressBar.transform = roundProgressBar.transform.scaledBy(x: 1, y: 2)
        roundProgressBar.layer.cornerRadius = 4
        roundProgressBar.clipsToBounds = true
        roundProgressBar.layer.sublayers![1].cornerRadius = 4
        roundProgressBar.subviews[1].clipsToBounds = true
    }
    
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
        self.navigationController?.pushViewController(dateFeelingViewController, animated: true)
    }
}
