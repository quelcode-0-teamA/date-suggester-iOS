//
//  FirstViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/14.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var dateDecideButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addBackground(name: "Full")
        
        self.dateDecideButton.layer.cornerRadius = 40
        
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "responseToken")
    }
    

    @IBAction func dateDecideButton(_ sender: Any) {
//        let defaults = UserDefaults.standard
        
        if UserDefaults.standard.string(forKey: "responseToken") != nil{
            let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
            let controller = storyboard.instantiateViewController(identifier: "DatePlanViewController")
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: true, completion: nil)
            
        } else{
            let storyboard = UIStoryboard(name: "TutorialViewController", bundle: nil)
            let listenBirthyearViewController = storyboard.instantiateViewController(withIdentifier: "ListenBirthyearViewController")
            listenBirthyearViewController.modalPresentationStyle = .fullScreen
            self.present(listenBirthyearViewController, animated: true, completion: nil)
            
        }
        
    }

}
