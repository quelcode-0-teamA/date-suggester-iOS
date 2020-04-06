//
//  Plan.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/03/16.
//  Copyright © 2020 saya. All rights reserved.
//

import Foundation

class Plan {
    let id: Int
    let title: String
    let des: String?
    let area: String
    let totalBudget: String
    let thumb: String
    let spots: [Spot]?
    
    init(planDicitionary: [String: Any]) {
        guard let id = planDicitionary["id"] as? Int,
            let title = planDicitionary["title"] as? String,
            let des = planDicitionary["description"] as? String,
            let area = planDicitionary["area"] as? String,
            let totalBudget = planDicitionary["total_budget"] as? String,
            let thumb = planDicitionary["thumb"] as? String else{
                self.id = 0
                self.title = ""
                self.des = nil
                self.area = ""
                self.totalBudget = ""
                self.thumb = ""
                self.spots = nil
                return
        }
        
        self.id = id
        self.title = title
        self.des = des
        self.area = area
        self.totalBudget = totalBudget
        self.thumb = thumb
        
        if let spotsDicArray = planDicitionary["spots"] as? [[String: Any]] {
            var _spots = [Spot]()
            for i in spotsDicArray {
                /* / i =  {
                 budget = "0\U5186";
                 id = 3;
                 name = "\U4ee3\U3005\U6728\U516c\U5712";
                 thumb = "https://date-suggester.s3-ap-northeast-1.amazonaws.com/spot/yoyogipark.jpg";
                 } */
                let spot = Spot(spotsDicitionary: i)
                _spots.append(spot)
            }
            self.spots = _spots
        } else {
            self.spots = nil
        }
    }
}
