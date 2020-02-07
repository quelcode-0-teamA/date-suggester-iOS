//
//  DatePlanDecideViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/05.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit
class DatePlanDecideViewController: UIViewController {


    @IBAction func simplePlan(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "DatePlanViewController")
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
        
        //ストーリーボード とってくる、そのなかのコントローラーとってくる、プレゼンとかナビゲーション
        
    }
    
    @IBAction func gotoDatailPlan(_ sender: Any) {
        let storyboard = UIStoryboard(name: "DetailPlanViewController", bundle: nil)

        
        let modalViewController = DetailPlanViewController()
        let DetailNavigationController = UINavigationController(rootViewController: modalViewController)
        present(DetailNavigationController, animated: true , completion: nil)
        
//        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
