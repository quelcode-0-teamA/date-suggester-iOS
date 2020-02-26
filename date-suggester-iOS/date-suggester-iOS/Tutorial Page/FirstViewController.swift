//
//  FirstViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/14.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let defaults = UserDefaults.standard
        defaults.set(nil, forKey: "tutorialStatus")
        
        if UserDefaults.standard.string(forKey: "tutorialStatus") == nil{
            let storyboard = UIStoryboard(name: "TutorialViewController", bundle: nil)
            let TutorialViewController1 = storyboard.instantiateViewController(withIdentifier: "TutorialViewController1")
            TutorialViewController1.modalPresentationStyle = .fullScreen
            self.present(TutorialViewController1, animated: false, completion: nil)
            
        } else{
            let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
            let controller = storyboard.instantiateViewController(identifier: "DatePlanViewController")
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: false, completion: nil)
        }
    }
}
