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
    let url: String

    init(spotsDicitionary: [String: Any]) {
        
        guard let id = spotsDicitionary["id"] as? Int,
            let name = spotsDicitionary["name"] as? String,
            let budget = spotsDicitionary["budget"] as? String,
            let thumb = spotsDicitionary["thumb"] as? String,
            let url = spotsDicitionary["url"] as? String else{
                self.id = 0
                self.name = ""
                self.budget = ""
                self.thumb = ""
                self.url = ""
                return
        }
        
        self.id = id
        self.name = name
        self.budget = budget
        self.thumb = thumb
        self.url = url
    }
}
