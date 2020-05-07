//
//  MypageViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/13.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit
import SVGKit

class MypageViewController: UIViewController {
    
    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        userIcon.layer.cornerRadius = 70
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "NavBarBG"), for: .default)
        self.navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationItem.backBarButtonItem = UIBarButtonItem(
            title:  "戻る",
            style:  .plain,
            target: nil,
            action: nil
        )
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        containerView.alpha = 0
        
        if UserDefaults.standard.getSignUpStatus() == true{
            self.view.alpha = 1
            
        }else{
            containerView.alpha = 1
            navigationController?.setNavigationBarHidden(true, animated: false)
            
        }
        
        /*
         ユーザー情報取得API
         */
        let config: URLSessionConfiguration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: config)
        let user_id = UserDefaults.standard.getUserId()
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.date-suggester.com"
        urlComponents.path = "/v1/users/\(user_id)"
        
        let url: URL = urlComponents.url!
        var req: URLRequest = URLRequest(url: url)
        req.httpMethod = "GET"
        
        let myToken = UserDefaults.standard.getResponseToken()
        
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        req.setValue("Bearer " + myToken, forHTTPHeaderField: "Authorization")
        
        let task = session.dataTask(with: req){(data, response, error) in
            
            do {
                let response: [String: Any] = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
                print(response)
                DispatchQueue.main.async {
                    debugPrint("ユーザー情報取得成功")
                    debugPrint(response)
                    
                    guard let responseUserName = response["name"] as? String else{
                        self.userName.text = "名もなき恋の達人"
                        return
                    }
                    
                    if responseUserName != nil {
                        debugPrint("trueきてるよ")
                        self.userName.text = responseUserName as? String
                        
                    }else{
                        debugPrint("elseきてるよ")
                        self.userName.text = "名もなき恋の達人"
                    }
                    
                    debugPrint("resuponseUserName:\(responseUserName)")
                    
                }
            } catch{
            }
        }
        task.resume()
        
    }
    
    @IBAction func gotoProfileEditButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "MainPageViewController", bundle: nil)
        let myProfileEditViewController = storyboard.instantiateViewController(withIdentifier: "MyProfileEditViewController")
        self.navigationController?.pushViewController(myProfileEditViewController, animated: true)
    }
}
