//
//  ViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/04.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit
import ActiveLabel

class ViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = ActiveLabel()
        label.numberOfLines = 0
        label.enabledTypes = [.mention, .hashtag, .url]
        label.text = "This is a post with #hashtags and a @userhandle."
        label.textColor = .black
        label.handleHashtagTap { hashtag in
            print("Success. You just tapped the \(hashtag) hashtag")
        }
        
        
    }
    
}


