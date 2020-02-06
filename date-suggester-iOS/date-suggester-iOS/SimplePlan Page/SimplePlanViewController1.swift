//
//  SimplePlanViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/05.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class SimplePlanViewController1: UIViewController {
    
    
    
    @IBAction func goto2potiPage(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        let SimplePlanViewController2 = storyboard.instantiateViewController(withIdentifier: "SimplePlanViewController2")
        SimplePlanViewController2.modalPresentationStyle = .fullScreen
        self.present(SimplePlanViewController2, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
}

