//
//  TutorialViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/04.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class TutorialViewController1: UIViewController {
    

    @IBOutlet weak var ManButton: UIButton!
    @IBOutlet weak var WomanButton: UIButton!
    
    @IBAction func ManButtonPushR(_ sender: Any) {
        //API処理
        
        //画面遷移
        let storyboard = UIStoryboard(name: "TutorialViewController", bundle: nil)
        let TutorialViewController2 = storyboard.instantiateViewController(withIdentifier: "TutorialViewController2")
        TutorialViewController2.modalPresentationStyle = .fullScreen
        self.present(TutorialViewController2, animated: false, completion: nil)
        
    }
    
    @IBAction func WomanButtonPush(_ sender: Any) {
        //API処理
        
        //画面遷移
        let storyboard = UIStoryboard(name: "TutorialViewController", bundle: nil)
        let TutorialViewController2 = storyboard.instantiateViewController(withIdentifier: "TutorialViewController2")
        TutorialViewController2.modalPresentationStyle = .fullScreen
        self.present(TutorialViewController2, animated: true, completion: nil)
        
    }
    
    
    @IBAction func skipButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "DatePlanViewController")
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        print("成功")
//        ManButton.frame = CGRect(x: 100, y: 100, width: 200, height: 200)  // 1
//        ManButton.center = self.view.center  // 2
//
//        ManButton.backgroundColor = .red  // 3
//        ManButton.layer.cornerRadius = 10
        
    }
    
}
