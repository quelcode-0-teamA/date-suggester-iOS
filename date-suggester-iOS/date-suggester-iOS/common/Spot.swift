//
//  Spots.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/03/16.
//  Copyright © 2020 saya. All rights reserved.
//

import Foundation

class Spot {
    let id: Int
    let name: String
    let budget: String
    let thumb: String
    
    init(spotsDicitionary: [String: Any]) {
        self.id = spotsDicitionary["id"] as! Int
        self.name = spotsDicitionary["name"] as! String
        self.budget = spotsDicitionary["budget"] as! String
        self.thumb = spotsDicitionary["thumb"] as! String
    }
}
