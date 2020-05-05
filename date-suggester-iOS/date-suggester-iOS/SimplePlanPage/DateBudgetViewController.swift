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
    var NumberOfButtons: Int = 3
    var CheckedButtonTag = 0
    
    @IBOutlet weak var roundProgressBar: UIProgressView!
    @IBOutlet weak var savingButton: UIButton!
    @IBOutlet weak var normalButton: UIButton!
    @IBOutlet weak var richButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("前の画面から\(youserAnswer.answer1)という値が渡されました")
        
        setupView()
        
    }
    
    private func setupView() {
        savingButton.layer.cornerRadius = 5
        normalButton.layer.cornerRadius = 5
        richButton.layer.cornerRadius = 5
        
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
        self.navigationController?.pushViewController(dateTimeViewController, animated: true)
    }
}
