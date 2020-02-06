//
//  SimplePlanViewController4.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/06.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class SimplePlanViewController4: UIViewController {
    
    @IBAction func goto5potiPage(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        let SimplePlanViewController5 = storyboard.instantiateViewController(withIdentifier: "SimplePlanViewController5")
        SimplePlanViewController5.modalPresentationStyle = .fullScreen
        self.present(SimplePlanViewController5, animated: false, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


        
    }
}
