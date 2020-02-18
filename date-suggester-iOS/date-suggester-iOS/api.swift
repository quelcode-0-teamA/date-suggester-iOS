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
    private let host = "https://api-date-suggester-dev.herokuapp.com"
    private let config: URLSessionConfiguration = URLSessionConfiguration.default
    private lazy var session: URLSession = URLSession(configuration: config)
    
    private func createRequest(url:URL, method:String, parameter: [String: Any]) -> URLRequest {
        //URLRequestの生成
        var req: URLRequest = URLRequest(url: url)
        req.httpMethod = method
        //ヘッダーを付与
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        req.httpBody = try! JSONSerialization.data(withJSONObject: parameter, options: .prettyPrinted)
        return req
    }
    
    func aaa(parameter:[String : Any], completion:((String?, Error?)->Void)?=nil){
        let endpoint = "/v1/aaa"
        
        //URLオブジェクトの生成
        let url = URL(string: host + endpoint)!

        let req = createRequest(url: url, method: postMethod, parameter: parameter)
        //APIを呼ぶよ
        let task = session.dataTask(with: req){(data, response, error) in
        }
    }
    
    func signUp(parameter:[String : Any], completion:((String?, Error?)->Void)?=nil){
        let endpoint = "/v1/sign_up"
        
        //URLオブジェクトの生成
        let url = URL(string: host + endpoint)!
        
        let req = createRequest(url: url, method: postMethod, parameter: parameter)
        //APIを呼ぶよ
        let task = session.dataTask(with: req){(data, response, error) in
            //例外処理
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
                
                //辞書からtokenを取り出す
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
    
    

    func login(parameter:[String : Any], completion:((String?, Error?)->Void)?=nil){
        let endpoint = "/v1/login"
        
        //URLオブジェクトの生成
        let url = URL(string: host + endpoint)!

        let req = createRequest(url: url, method: postMethod, parameter: parameter)
        //APIを呼ぶよ
        let task = session.dataTask(with: req){(data, response, error) in
            //例外処理
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
                
                //辞書からtokenを取り出す
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
    
}
