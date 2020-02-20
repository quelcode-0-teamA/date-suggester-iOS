//
//  SimplePlanViewController4.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/06.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class DateFeelingViewController: UIViewController {
    
    @IBOutlet weak var RoundProgressBar: UIProgressView!
    @IBOutlet weak var mealButton: UIButton!
    @IBOutlet weak var outDoorButton: UIButton!
    @IBOutlet weak var relaxButton: UIButton!
    
    
    @IBAction func mealButtonTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        let DatePlanSuggestionViewControlller = storyboard.instantiateViewController(withIdentifier: "DatePlanSuggestionViewControlller")
        DatePlanSuggestionViewControlller.modalPresentationStyle = .fullScreen
        present(DatePlanSuggestionViewControlller, animated: true, completion: nil)
    }
    
    @IBAction func outDoorButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        let DatePlanSuggestionViewControlller = storyboard.instantiateViewController(withIdentifier: "DatePlanSuggestionViewControlller")
        DatePlanSuggestionViewControlller.modalPresentationStyle = .fullScreen
        present(DatePlanSuggestionViewControlller, animated: true, completion: nil)
    }
    @IBAction func relaxButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        let DatePlanSuggestionViewControlller = storyboard.instantiateViewController(withIdentifier: "DatePlanSuggestionViewControlller")
        DatePlanSuggestionViewControlller.modalPresentationStyle = .fullScreen
        present(DatePlanSuggestionViewControlller, animated: true, completion: nil)

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.mealButton.layer.cornerRadius = 5
        self.outDoorButton.layer.cornerRadius = 5
        self.relaxButton.layer.cornerRadius = 5
        
        RoundProgressBar.transform = RoundProgressBar.transform.scaledBy(x: 1, y: 2)
        RoundProgressBar.layer.cornerRadius = 4
        RoundProgressBar.clipsToBounds = true
        RoundProgressBar.layer.sublayers![1].cornerRadius = 4
        RoundProgressBar.subviews[1].clipsToBounds = true
        
    }
}
