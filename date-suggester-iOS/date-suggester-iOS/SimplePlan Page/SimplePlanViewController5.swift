//
//  SimplePlanViewController5.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/06.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class SimplePlanViewController5: UIViewController {
    
    @IBAction func gotoSuggestPage(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        let DatePlanSuggestionViewControlller = storyboard.instantiateViewController(withIdentifier: "DatePlanSuggestionViewControlller")
        DatePlanSuggestionViewControlller.modalPresentationStyle = .fullScreen
        self.present(DatePlanSuggestionViewControlller, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}
