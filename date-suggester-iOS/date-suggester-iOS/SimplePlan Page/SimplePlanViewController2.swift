//
//  SimplePlanViewController2.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/06.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class SimplePlanViewController2: UIViewController {
    
    
    @IBAction func goto3potiPage(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        let SimplePlanViewController3 = storyboard.instantiateViewController(withIdentifier: "SimplePlanViewController3")
        SimplePlanViewController3.modalPresentationStyle = .fullScreen
        self.present(SimplePlanViewController3, animated: false, completion: nil)
    }
    override func viewDidLoad() {
           super.viewDidLoad()

           
       }
}
