//
//  SimplePlanViewController3.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/06.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class DateTimeViewController: UIViewController {
    
    
    @IBOutlet weak var RoundProgressBar: UIProgressView!
    @IBOutlet weak var allDayButton: UIButton!
    @IBOutlet weak var lunchButton: UIButton!
    @IBOutlet weak var nightButton: UIButton!
    
    
    @IBAction func allDayButtonTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        let DateFeelingViewController = storyboard.instantiateViewController(withIdentifier: "DateFeelingViewController")
        self.navigationController?.pushViewController(DateFeelingViewController, animated: true)
    }
    
    @IBAction func lunchButtonTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        let DateFeelingViewController = storyboard.instantiateViewController(withIdentifier: "DateFeelingViewController")
        self.navigationController?.pushViewController(DateFeelingViewController, animated: true)
    }
    
    @IBAction func dinnerButtonTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        let DateFeelingViewController = storyboard.instantiateViewController(withIdentifier: "DateFeelingViewController")
        self.navigationController?.pushViewController(DateFeelingViewController, animated: true)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.allDayButton.layer.cornerRadius = 5
        self.lunchButton.layer.cornerRadius = 5
        self.nightButton.layer.cornerRadius = 5
        
        RoundProgressBar.transform = RoundProgressBar.transform.scaledBy(x: 1, y: 2)
        RoundProgressBar.layer.cornerRadius = 4
        RoundProgressBar.clipsToBounds = true
        RoundProgressBar.layer.sublayers![1].cornerRadius = 4
        RoundProgressBar.subviews[1].clipsToBounds = true
        
    }
}
