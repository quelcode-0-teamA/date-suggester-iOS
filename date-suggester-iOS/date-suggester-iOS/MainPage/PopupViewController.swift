//
//  PopupViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/20.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.7)
        
        popUpView.layer.masksToBounds = false
        popUpView.layer.cornerRadius = 30
    }
    

    @IBAction func popupCloseButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var popUpView: UIView!
    
    
}
