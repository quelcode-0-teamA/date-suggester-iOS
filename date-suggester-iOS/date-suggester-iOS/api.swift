//
//  api.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/15.
//  Copyright © 2020 saya. All rights reserved.
//

import Foundation

class Api {
    private let postMethod = "POST"
    private let getMethod = "GET"
    private let host = "https://api.date-suggester.com"
    private let config: URLSessionConfiguration = URLSessionConfiguration.default
    private lazy var session: URLSession = URLSession(configuration: config)
    private let myToken = UserDefaults.standard.getResponseToken()
    
    private func createRequest(url:URL, method:String, parameter: [String: Any], token:String ) -> URLRequest {
        //URLRequestの生成
        var req: URLRequest = URLRequest(url: url)
        req.httpMethod = method
        //ヘッダーを付与
        if token != "" {
            req.setValue("Bearer " + token, forHTTPHeaderField: "Authorization")
        }
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        req.httpBody = try! JSONSerialization.data(withJSONObject: parameter, options: .prettyPrinted)
        return req
    }
    
    func fomalSignUp(parameter:[String : Any], completion:((Any?, Error?)->Void)?=nil){
        let endpoint = "/v1/formal_user/sign_up"

        let url = URL(string: host + endpoint)!
        
        let req = createRequest(url: url, method: postMethod, parameter: parameter, token: myToken)

        let task = session.dataTask(with: req){(data, response, error) in
            guard let _data = data else {
                completion?(nil, NSError.init(domain: "error", code: 0, userInfo: nil))
                return
            }
            
            let httpResponse = response as? HTTPURLResponse
            if httpResponse!.statusCode != 200 {
                completion?(nil, NSError.init(domain: "error", code: 0, userInfo: nil))
                return
            }
            debugPrint(httpResponse!.statusCode)
            
            do {
                if error != nil {
                    completion?(response, error)
                    return
                }
                
                guard let response: [String: Any] = try JSONSerialization.jsonObject(with: _data, options: []) as? [String: Any] else {
                    completion?(nil, NSError.init(domain: "error", code: 0, userInfo: nil))
                    return
                }
                print(response)
                completion?(response, nil)
            }
            catch{
                completion?(nil, NSError.init(domain: "error", code: 0, userInfo: nil))
            }
        }
        task.resume()
    }
    
    
    
    func login(parameter:[String : Any], completion:((String?, Error?)->Void)?=nil){
        let endpoint = "/v1/sign_in"
        let url = URL(string: host + endpoint)!
        
        let req = createRequest(url: url, method: postMethod, parameter: parameter, token:"")

        let task = session.dataTask(with: req){(data, response, error) in

            guard let _data = data else {
                completion?(nil, NSError.init(domain: "error", code: 0, userInfo: nil))
                return
            }
            
            let httpResponse = response as? HTTPURLResponse
            if httpResponse!.statusCode != 200 {
                completion?(nil, NSError.init(domain: "error", code: 0, userInfo: nil))
                return
            }
            debugPrint(httpResponse!.statusCode)
            
            do {
                if error != nil {
                    completion?(nil, error)
                    return
                }
                guard let response: [String: Any] = try JSONSerialization.jsonObject(with: _data, options: []) as? [String: Any] else {
                    completion?(nil, NSError.init(domain: "error", code: 0, userInfo: nil))
                    return
                }
                guard let tokenValue = response["token"] as? String else {
                    completion?(nil, NSError.init(domain: "error", code: 0, userInfo: nil))
                    return
                }
                completion?(tokenValue, nil)
            }
            catch{
                completion?(nil, NSError.init(domain: "error", code: 0, userInfo: nil))
            }
        }
        task.resume()
    }
    
    func tempSignUp(parameter:[String : Any], completion:((String?, Int?, Error?)->Void)?=nil){
        let endpoint = "/v1/temp_user/sign_up"
        
        let url = URL(string: host + endpoint)!
        
        let req = createRequest(url: url, method: postMethod, parameter: parameter, token:"")

        let task = session.dataTask(with: req){(data, response, error) in
            guard let _data = data else {
                completion?(nil, nil, NSError.init(domain: "error", code: 0, userInfo: nil))
                return
            }

            do {
                guard let response: [String: Any] = try JSONSerialization.jsonObject(with: _data, options: []) as? [String: Any] else {
                    completion?(nil, nil, NSError.init(domain: "error", code: 0, userInfo: nil))
                    return
                }
                
                //辞書からtokenを取り出す
                guard let tokenValue = response["token"] as? String else {
                    completion?(nil, nil, NSError.init(domain: "error", code: 0, userInfo: nil))
                    return
                }
                debugPrint("トークン：\(tokenValue)")
                guard let userId = response["id"] as? Int else {
                    completion?(nil, nil, NSError.init(domain: "error", code: 0, userInfo: nil))
                    return
                }
                
                debugPrint("userId:\(userId)")
                UserDefaults.standard.setResponseToken(token: tokenValue)
                UserDefaults.standard.setUserId(id: userId)
                
                debugPrint("仮ログインのレスポンス:\(response)")
                completion?(tokenValue, userId, nil)
            }
            catch{
                completion?(nil, nil, NSError.init(domain: "error", code: 0, userInfo: nil))
            }
        }
        task.resume()
    }
    
    func datePlanFix(parameter:[String : Any], completion:((Any?, Error?)->Void)?=nil){
        let endpoint = "/v1/my_plans"
        
        let url = URL(string: host + endpoint)!
        
        let req = createRequest(url: url, method: postMethod, parameter: parameter, token: myToken)

        let task = session.dataTask(with: req){(data, response, error) in
            guard let _data = data else {
                completion?(nil, NSError.init(domain: "error", code: 0, userInfo: nil))
                return
            }
            do {
                guard let response: [String: Any] = try JSONSerialization.jsonObject(with: _data, options: []) as? [String: Any] else {
                    completion?(nil, NSError.init(domain: "error", code: 0, userInfo: nil))
                    return
                }
                completion?(response, nil)
            }
            catch{
                completion?(nil, NSError.init(domain: "error", code: 0, userInfo: nil))
            }
        }
        task.resume()
    }
    
    
    func area(parameter:[String : Any], completion:((String?, Error?)->Void)?=nil){
        let endpoint = "/v1/areas"

        //URLオブジェクトの生成
        let url = URL(string: host + endpoint)!
        
        let req = createRequest(url: url, method: getMethod, parameter: parameter, token: myToken)

        let task = session.dataTask(with: req){(data, response, error) in
            guard let _data = data else {
                completion?(nil, NSError.init(domain: "error", code: 0, userInfo: nil))
                return
            }
            
            do {
                guard let response: [String: Any] = try JSONSerialization.jsonObject(with: _data, options: []) as? [String: Any] else {
                    completion?(nil, NSError.init(domain: "error", code: 0, userInfo: nil))
                    return
                }
                
                print(response)
                
                guard let tokenValue = response["token"] as? String else {
                    completion?(nil, NSError.init(domain: "error", code: 0, userInfo: nil))
                    return
                }
                
                completion?(tokenValue, nil)
            }
            catch{
                completion?(nil, NSError.init(domain: "error", code: 0, userInfo: nil))
            }
        }
        task.resume()
    }
    
    func plansSuggest(parameter:[String : Any], completion:((Any?, Error?)->Void)?=nil){
        let endpoint = "/v1/plans/suggest"

        let url = URL(string: host + endpoint)!
        
        let req = createRequest(url: url, method: getMethod, parameter: parameter, token: myToken)

        let task = session.dataTask(with: req){(data, response, error) in
            guard let _data = data else {
                completion?(nil, NSError.init(domain: "error", code: 0, userInfo: nil))
                return
            }
            
            do {
                guard let response: [String: Any] = try JSONSerialization.jsonObject(with: _data, options: []) as? [String: Any] else {
                    completion?(nil, NSError.init(domain: "error", code: 0, userInfo: nil))
                    return
                }
                
                print(response)
                
                completion?(response, nil)
            }
            catch{
                completion?(nil, NSError.init(domain: "error", code: 0, userInfo: nil))
            }
        }
        task.resume()
    }
}
