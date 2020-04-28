//
//  UserArea.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/04/24.
//  Copyright © 2020 saya. All rights reserved.
//

import Foundation

class UserArea {
    let name: String
    let id: Int
    
    init(areaData: [String: Any]) {
        guard let name = areaData["name"] as? String,
            let id = areaData["id"] as? Int else {
                self.name = ""
                self.id = 0
                return
        }
        
        self.name = name
        self.id = id
    }
}

