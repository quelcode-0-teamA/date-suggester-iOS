//
//  MyProfileEditViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/04/07.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class MyProfileEditViewController: UIViewController {
    
    @IBOutlet weak var userName: CustomPlofielTextField!
    @IBOutlet weak var profileEditButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        profileEditButton.layer.borderColor = UIColor.white.cgColor
        profileEditButton.layer.borderWidth = 1.0
    }
    
    @IBAction func profileEditButton(_ sender: Any) {
        let config: URLSessionConfiguration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: config)
        
        let defaults = UserDefaults.standard
        let user_id = defaults.string(forKey: "userId")!
        
//        let myplan_id = 66
        print(user_id)
        let url = URL(string: "https://api.date-suggester.com/v1/users/\(user_id)")!
        print(url)
        //URLRequestの生成
        var req: URLRequest = URLRequest(url: url)
        req.httpMethod = "DELETE"
        
        //ヘッダーを付与
        let myToken = defaults.string(forKey: "responseToken")!
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        req.setValue("Bearer " + myToken, forHTTPHeaderField: "Authorization")
        
        //APIを呼ぶよ
        let task = session.dataTask(with: req){(data, response, error) in
            do {
                //                let response: [String: Any] = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
                let httpResponse = response as? HTTPURLResponse
                debugPrint(httpResponse!.statusCode)
                
                debugPrint("ユーザ情報が削除されたよ")
                DispatchQueue.main.async {
                    //                    self.dismiss(animated: true, completion: nil)
//                    self.dateScheduleTV.reloadData()
                }
                
            } catch{
            }
            
        }
        task.resume()
        
    }
}


