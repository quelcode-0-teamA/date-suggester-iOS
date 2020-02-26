//
//  DatePlanDecideViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/05.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit
class DatePlanDecideViewController: UIViewController {

    @IBOutlet weak var subView: UIView!
    @IBOutlet weak var heartMark: UIImageView!
    
    @IBAction func simplePlan(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "DatePlanViewController")
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
        
        //ストーリーボード とってくる、そのなかのコントローラーとってくる、プレゼンとかナビゲーション
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.subView.layer.cornerRadius = 30
        
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
     super.viewWillAppear(animated)
        
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.duration = 2.0
        animation.fromValue = 1.15
        animation.toValue = 1.0
        animation.mass = 1.0
        animation.initialVelocity = 30.0
        animation.damping = 2.0
        animation.stiffness = 120.0
        heartMark.layer.add(animation, forKey: nil)
        
    }
    
}
