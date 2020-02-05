//
//  TutorialViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/04.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {
    
    
    
    @IBOutlet weak var ManButton: UIButton!
    @IBOutlet weak var WomanButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("成功")
        ManButton.frame = CGRect(x: 100, y: 100, width: 200, height: 200)  // 1
        ManButton.center = self.view.center  // 2
        
        ManButton.backgroundColor = .red  // 3
        ManButton.layer.cornerRadius = 10
        
    }
    
}
