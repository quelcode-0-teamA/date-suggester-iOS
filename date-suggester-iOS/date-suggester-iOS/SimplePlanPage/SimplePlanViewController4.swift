//
//  SimplePlanViewController4.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/06.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class SimplePlanViewController4: UIViewController {
    
    @IBOutlet weak var RoundProgressBar: UIProgressView!
    @IBOutlet weak var mealButton: UIButton!
    @IBOutlet weak var outDoorButton: UIButton!
    @IBOutlet weak var relaxButton: UIButton!
    
    
    @IBAction func mealButtonTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        let DatePlanSuggestionViewControlller = storyboard.instantiateViewController(withIdentifier: "DatePlanSuggestionViewControlller")
        self.navigationController?.pushViewController(DatePlanSuggestionViewControlller, animated: true)
    }
    
    @IBAction func outDoorButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        let DatePlanSuggestionViewControlller = storyboard.instantiateViewController(withIdentifier: "DatePlanSuggestionViewControlller")
        self.navigationController?.pushViewController(DatePlanSuggestionViewControlller, animated: true)
    }
    @IBAction func relaxButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        let DatePlanSuggestionViewControlller = storyboard.instantiateViewController(withIdentifier: "DatePlanSuggestionViewControlller")
        DatePlanSuggestionViewControlller.modalPresentationStyle = .fullScreen
        present(DatePlanSuggestionViewControlller, animated: true, completion: nil)
//        self.navigationController?.pushViewController(DatePlanSuggestionViewControlller, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.mealButton.layer.cornerRadius = 30
        self.outDoorButton.layer.cornerRadius = 30
        self.relaxButton.layer.cornerRadius = 30
        
        RoundProgressBar.transform = RoundProgressBar.transform.scaledBy(x: 1, y: 8)
        RoundProgressBar.layer.cornerRadius = 16
        RoundProgressBar.clipsToBounds = true
        RoundProgressBar.layer.sublayers![1].cornerRadius = 16
        RoundProgressBar.subviews[1].clipsToBounds = true
        
    }
}
