//
//  UserDefault.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/05/05.
//  Copyright © 2020 saya. All rights reserved.
//

import Foundation

private let responseTokenKey = "responseToken"
private let userId = "userId"
private let selectedBirthYear = "selectedBirthYear"
private let selectedAreaId = "selectedAreaId"
private let signUpStatus = "signUpStatus"
private let userEmail = "userEmail"
private let userName = "userName"

extension UserDefaults {
    func setResponseToken(token: String) {
        self.set(token, forKey: responseTokenKey)
    }
    func getResponseToken() -> String {
        return self.string(forKey: responseTokenKey) ?? ""
    }
    func setUserId(id: Int) {
        self.set(id, forKey: userId)
    }
    func getUserId() -> Int {
        return self.integer(forKey: userId)
    }
    func setSelectedBirthYear(birthYear: String) {
        self.set(birthYear, forKey: selectedBirthYear)
    }
    func getSelectedBirthYear() -> String {
        return self.string(forKey: selectedBirthYear) ?? ""
    }
    func setSelectedAreaId(id: Int) {
        self.set(id, forKey: selectedAreaId)
    }
    func getSelectedAreaId() -> Int {
        return self.integer(forKey: selectedAreaId)
    }
    func setSignUpStatus(status: Bool) {
        self.set(status, forKey: signUpStatus)
    }
    func getSignUpStatus() -> Bool {
        return self.bool(forKey: signUpStatus)
    }
    func setUserEmail(email: String) {
        self.set(email, forKey: userEmail)
    }
    func getUserEmail() -> String {
        return self.string(forKey: userEmail) ?? ""
    }
    func setUserName(userName: String) {
        self.set(userName, forKey: userName)
    }
    func getUserName() -> String {
        return self.string(forKey: userName) ?? ""
    }
    
}
