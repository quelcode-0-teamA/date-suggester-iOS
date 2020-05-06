//
//  UserDefault.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/05/05.
//  Copyright © 2020 saya. All rights reserved.
//

import Foundation

private let keyName1 = "selectAreaId"
private let keyName2 = "selectName"
extension UserDefaults {
    func setSelectedAreaId(id: Int) {
        UserDefaults.standard.set(id, forKey: keyName1)
    }
    func getSelectedAreaId() -> Int {
        return UserDefaults.standard.integer(forKey: keyName1)
    }
    func setSelectedName(id: Int) {
        UserDefaults.standard.set(id, forKey: keyName2)
    }
    func getSelectedName() -> Int {
        return UserDefaults.standard.integer(forKey: keyName2)
    }
}
