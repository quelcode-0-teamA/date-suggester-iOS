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
//        containerView.alpha = 1
        userIcon.layer.cornerRadius = 70
//        let svgImage = SVGKImage(named: "userIcon")
//        svgImage?.size = userIcon.bounds.size
//        userIcon.image = svgImage?.uiImage
        
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
        
        let defaults = UserDefaults.standard
        let signUpStatus = defaults.bool(forKey: "signUpStatus")
        debugPrint(signUpStatus)
        
        if signUpStatus == true{
            self.view.alpha = 1
            
        }else{
            containerView.alpha = 1
        }
        
        /*
         ユーザー情報取得API
         */
        //        let config: URLSessionConfiguration = URLSessionConfiguration.default
        //        let session: URLSession = URLSession(configuration: config)
        //        let defaults = UserDefaults.standard
        //        let user_id = defaults.string(forKey: "userId")!
        //
        //        var urlComponents = URLComponents()
        //        urlComponents.scheme = "https"
        //        urlComponents.host = "api-date-suggester-dev.herokuapp.com"
        //        urlComponents.path = "/v1/users/\(user_id)"
        //
        //        let url: URL = urlComponents.url!
        //        var req: URLRequest = URLRequest(url: url)
        //        req.httpMethod = "GET"
        //
        //        let myToken = defaults.string(forKey: "responseToken")!
        //
        //        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        //        req.setValue("Bearer " + myToken, forHTTPHeaderField: "Authorization")
        //
        //        let task = session.dataTask(with: req){(data, response, error) in
        //
        //            do {
        //                let response: [[String: Any]] = try JSONSerialization.jsonObject(with: data!, options: []) as! [[String: Any]]
        //                print(response)
        //                DispatchQueue.main.async {
        //                    print("🍑")
        ////                    print(response[id])
        ////                    let id = response["id"]
        ////                    self.userName.text = id
        //                }
        //            } catch{
        //            }
        //        }
        //        task.resume()

    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//
//    }
    
    @IBAction func gotoProfileEditButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "MainPageViewController", bundle: nil)
        let profileEditViewController = storyboard.instantiateViewController(withIdentifier: "ProfileEditViewController")
        self.navigationController?.pushViewController(profileEditViewController, animated: true)
    }
//    @IBAction func profileEditButtonTap(_ sender: Any) {
//        let defaults = UserDefaults.standard
//        let signUpStatus = defaults.string(forKey: "signUpStatus")
//
//        if signUpStatus != nil {
//            let storyboard = UIStoryboard(name: "MainPageViewController", bundle: nil)
//            let ProfileEditViewController = storyboard.instantiateViewController(withIdentifier: "ProfileEditViewController")
//            ProfileEditViewController.modalPresentationStyle = .fullScreen
//            self.present(ProfileEditViewController, animated: true, completion: nil)
//        } else {
//            let storyboard = UIStoryboard(name: "MainPageViewController", bundle: nil)
//            let SignUpViewController = storyboard.instantiateViewController(withIdentifier: "SignUpViewController")
//            SignUpViewController.modalPresentationStyle = .fullScreen
//            self.present(SignUpViewController, animated: true, completion: nil)
//        }
//    }
}
