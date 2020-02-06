//
//  TutorialViewController2.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/06.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class TutorialViewController2: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    @IBAction func nextPage(_ sender: Any) {
        //画面遷移
        let storyboard = UIStoryboard(name: "TutorialViewController", bundle: nil)
        let TutorialViewController3 = storyboard.instantiateViewController(withIdentifier: "TutorialViewController3")
        TutorialViewController3.modalPresentationStyle = .fullScreen
        self.present(TutorialViewController3, animated: false, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("★★★")
        
        // ピッカー設定
//        datePicker.datePickerMode = UIDatePickerMode.date
//        datePicker.timeZone = NSTimeZone.local
//        datePicker.locale = Locale.current
//        datePicker.inputView = datePicker
    }
    
}
