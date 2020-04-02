//
//  MypageNavigation.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/04/01.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class MypageNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("🍑🍑🍑")
//        self.view.alpha = 0
//        let defaults = UserDefaults.standard
//        let signUpStatus = defaults.bool(forKey: "signUpStatus")
//        debugPrint(signUpStatus)
//        
//        if signUpStatus == true{
//            let storyboard = UIStoryboard(name: "MainPageViewController", bundle: nil)
//            let mypageViewController = storyboard.instantiateViewController(withIdentifier: "MypageViewController")
//            self.pushViewController(mypageViewController, animated: true)
            //            self.navigationController?.pushViewController(mypageViewController, animated: true)
//        }
    }
    

          
}

//        defaults.removeObject(forKey: "signUpStatus")
//        else {
//            let storyboard = UIStoryboard(name: "MainPageViewController", bundle: nil)
//            let signUpViewController = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
//            self.navigationController?.pushViewController(signUpViewController, animated: true)
//        }
