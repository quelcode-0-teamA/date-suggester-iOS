//
//  SimplePlanViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/05.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class DateLocationViewController: UIViewController {
    var youserAnswer: AnswerModel = .init()
    
    @IBOutlet weak var roundProgressBar: UIProgressView!
    @IBOutlet weak var near: UIButton!
    @IBOutlet weak var far: UIButton!
    @IBOutlet weak var imageIcon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()

    }
    
    private func setupView() {
        far.layer.cornerRadius = 10
        near.layer.cornerRadius = 10
        
        // navigationの設定
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "NavBarBG"), for: .default)
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        navigationController?.navigationBar.tintColor = UIColor.white
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
    
    @IBAction func nearButton(_ sender: Any) {
        gotoDateBudgetVC(selectAnserNumber:0)
    }
    
    @IBAction func farButton(_ sender: Any) {
        gotoDateBudgetVC(selectAnserNumber:1)
    }
    //共通化(private書いてなければ他のクラスで呼んでるんだなと思われる、改修するときは他のクラスに影響がないか調べないといけない)
    private func gotoDateBudgetVC(selectAnserNumber: Int) {
        youserAnswer.answer1 = selectAnserNumber
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        guard let dateBudgetViewController = storyboard.instantiateViewController(withIdentifier: "DateBudgetViewController") as? DateBudgetViewController else {
            return
        }
        dateBudgetViewController.youserAnswer = youserAnswer
        self.navigationController?.pushViewController(dateBudgetViewController, animated: true)
    }
}
