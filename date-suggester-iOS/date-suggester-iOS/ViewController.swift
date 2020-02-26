//
//  ViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/04.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
     var response: [[String: Any]]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let config: URLSessionConfiguration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: config)
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api-date-suggester-dev.herokuapp.com"
        urlComponents.path = "/v1/areas"
        urlComponents.queryItems = [
        ]
        
        let url: URL = urlComponents.url!
        var req: URLRequest = URLRequest(url: url)
        req.httpMethod = "GET"
        
        print(url)
        
        //APIを呼ぶよ
        let task = session.dataTask(with: req){(data, response, error) in
 
            do {
                let response: [[String: Any]] = try JSONSerialization.jsonObject(with: data!, options: []) as! [[String: Any]]
                
                print(response)
                self.response = response
                for value in response {
                    print("\(value["name"]!)")
                }
                
                
            } catch{
                
            }
            
        }
        task.resume()
        
       
    }

}


