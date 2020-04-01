//
//  DatePlanDecideViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/05.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit
import SVGKit

class DatePlanDecideViewController: UIViewController {

    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var gotoSimplePlanButtom: UIButton!
    
    @IBAction func simplePlan(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "DatePlanViewController")
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let svgImage = SVGKImage(named: "mainImage")
        svgImage?.size = mainImage.bounds.size
        mainImage.image = svgImage?.uiImage
        
        self.gotoSimplePlanButtom.layer.masksToBounds = true
        self.gotoSimplePlanButtom.layer.cornerRadius = 28
    }
}
