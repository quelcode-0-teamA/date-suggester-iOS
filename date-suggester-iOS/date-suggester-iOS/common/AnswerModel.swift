//
//  AnswerModel.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/24.
//  Copyright © 2020 saya. All rights reserved.
//

import Foundation

class AnswerModel {
    var answer1: Int = 0 {
        didSet{
         print(answer1)
       }
    }
    var answer2: Int = 0
    var answer3: Int = 0
    var answer4: Int = 0
}
