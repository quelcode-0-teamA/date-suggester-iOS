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
        setupView()
    }
    
    private func setupView() {
        let svgImage = SVGKImage(named: "mainImage")
        svgImage?.size = mainImage.bounds.size
        mainImage.image = svgImage?.uiImage
        
        gotoSimplePlanButtom.layer.masksToBounds = true
        gotoSimplePlanButtom.layer.cornerRadius = 28
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "NavBarBG"), for: .default)
        self.navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        self.navigationItem.title = "Date Suggester"
    }
}
