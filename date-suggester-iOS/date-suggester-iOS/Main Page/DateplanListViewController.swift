//
//  DateplanListViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/05.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit
class DateplanListViewController: UIViewController {


    @IBAction func gotoDateSchedule(_ sender: Any) {
        let storyboard = UIStoryboard(name: "MainPageViewController", bundle: nil)
        let DateScheduleViewController = storyboard.instantiateViewController(withIdentifier: "DateScheduleViewController")
        self.navigationController?.pushViewController(DateScheduleViewController, animated: false)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}

