//
//  MyPlan.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/03/16.
//  Copyright © 2020 saya. All rights reserved.
//

import Foundation

class MyPlan {
    
    let id: Int
    let plan: Plan
    
    init(myPlanDicitionary: [String: Any]) {
//        guard let id = myPlanDicitionary["id"] as? Int,
//        let plan = Plan(planDicitionary: myPlanDicitionary["plan"] as? [String: Any]) else{
//                self.id = 0
////                self.plan = nil
//                return
//        }
//
//        self.id = id
//        self.plan = plan
        self.id = myPlanDicitionary["id"] as! Int
        self.plan = Plan(planDicitionary: myPlanDicitionary["plan"] as! [String: Any])
    }
    
}
