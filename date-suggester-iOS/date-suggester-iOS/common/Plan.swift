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
    let des: String
    let area: String
    let totalBudget: String
    let thumb: String
    let spots: [Spot]
    
    init(planDicitionary: [String: Any]) {
        self.id = planDicitionary["id"] as! Int
        self.title = planDicitionary["title"] as! String
        self.des = planDicitionary["description"] as! String
        self.area = planDicitionary["area"] as! String
        self.totalBudget = planDicitionary["total_budget"] as! String
        self.thumb = planDicitionary["thumb"] as! String
        
        var _spots = [Spot]()
        for i in planDicitionary["spots"] as! [[String: Any]] {
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
    }
}
