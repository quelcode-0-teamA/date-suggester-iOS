//
//  SimplePlanViewController3.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/06.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class SimplePlanViewController3: UIViewController {
    
    
    @IBOutlet weak var RoundProgressBar: UIProgressView!
    @IBOutlet weak var allDayButton: UIButton!
    @IBOutlet weak var lunchButton: UIButton!
    @IBOutlet weak var nightButton: UIButton!
    
    
    @IBAction func allDayButtonTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        let SimplePlanViewController4 = storyboard.instantiateViewController(withIdentifier: "SimplePlanViewController4")
        self.navigationController?.pushViewController(SimplePlanViewController4, animated: true)
    }
    
    @IBAction func lunchButtonTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        let SimplePlanViewController4 = storyboard.instantiateViewController(withIdentifier: "SimplePlanViewController4")
        self.navigationController?.pushViewController(SimplePlanViewController4, animated: true)
    }
    
    @IBAction func dinnerButtonTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        let SimplePlanViewController4 = storyboard.instantiateViewController(withIdentifier: "SimplePlanViewController4")
        self.navigationController?.pushViewController(SimplePlanViewController4, animated: true)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.allDayButton.layer.cornerRadius = 30
        self.lunchButton.layer.cornerRadius = 30
        self.nightButton.layer.cornerRadius = 30
        
        RoundProgressBar.transform = RoundProgressBar.transform.scaledBy(x: 1, y: 8)
        RoundProgressBar.layer.cornerRadius = 16
        RoundProgressBar.clipsToBounds = true
        RoundProgressBar.layer.sublayers![1].cornerRadius = 16
        RoundProgressBar.subviews[1].clipsToBounds = true
        
    }
}
