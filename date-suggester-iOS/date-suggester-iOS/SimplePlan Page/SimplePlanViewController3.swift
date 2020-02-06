//
//  SimplePlanViewController3.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/06.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class SimplePlanViewController3: UIViewController {
    
    @IBAction func goto4potiPage(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        let SimplePlanViewController4 = storyboard.instantiateViewController(withIdentifier: "SimplePlanViewController4")
        SimplePlanViewController4.modalPresentationStyle = .fullScreen
        self.present(SimplePlanViewController4, animated: true, completion: nil)
        
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}
