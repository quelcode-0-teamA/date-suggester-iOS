//
//  TermsOfServiceViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/14.
//  Copyright © 2020 saya. All rights reserved.
//
import UIKit

class TermsOfServiceViewController: UIViewController {
    
    @IBAction func agreeButtonTap(_ sender: Any) {
        //画面遷移
        let storyboard = UIStoryboard(name: "TutorialViewController", bundle: nil)
        let TutorialViewController1 = storyboard.instantiateViewController(withIdentifier: "TutorialViewController1")
        TutorialViewController1.modalPresentationStyle = .fullScreen
        self.present(TutorialViewController1, animated: false, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
