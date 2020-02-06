//
//  DatePlanSuggestionViewControlller.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/05.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class DatePlanSuggestionViewControlller: UIViewController {
    
    @IBAction func gotoMypage(_ sender: Any) {
        let storyboard = UIStoryboard(name: "MainPageViewController", bundle: nil)
        let MainPageViewController = storyboard.instantiateViewController(withIdentifier: "MainPageViewController")
        MainPageViewController.modalPresentationStyle = .fullScreen
        self.present(MainPageViewController, animated: true, completion: nil)
    }
    
    @IBAction func gotoDatailPage(_ sender: Any) {
        let storyboard = UIStoryboard(name: "DatailPlanViewController", bundle: nil)
               let DatailPlanViewController = storyboard.instantiateViewController(identifier: "DatailPlanViewController")
               DatailPlanViewController.modalPresentationStyle = .fullScreen
               present(DatailPlanViewController, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}
