//
//  DatePlanSuggestionViewControlller.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/05.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class DatePlanSuggestionViewControlller: UIViewController, UITableViewDelegate, UITableViewDataSource {
    //受け取る値を格納するもの
    var response: [String: Any] = [:]
    
    @IBOutlet weak var gotoMypage: UIButton!
    @IBOutlet weak var againButton: UIButton!
    
    @IBOutlet var gotoDatailPage: UIView!
    
    @IBAction func gotoMypage(_ sender: Any) {
//        let config: URLSessionConfiguration = URLSessionConfiguration.default
//
//        let session: URLSession = URLSession(configuration: config)
//        //その変数たちを集めた変数をつくって、それをJSON形式でボディに付与する（1つめの辞書）
//       let planId = response["id"]!
//        debugPrint(planId)
//
//        let planFixParams = [
//             "plan_id": planId
//            ] as [String : Any]
//
//        //URLオブジェクトの生成
//
//        let url = URL(string: "https://api-date-suggester-dev.herokuapp.com/v1/mypage/my_plans")!
//        //URLRequestの生成
//        var req: URLRequest = URLRequest(url: url)
//        req.httpMethod = "POST"
//
//        //ヘッダーを付与
//        let defaults = UserDefaults.standard
//        let myToken = defaults.string(forKey: "responseToken")!
//        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        req.setValue("Bearer " + myToken, forHTTPHeaderField: "Authorization")
//
//        //ボディーを付与（2つめの辞書）
//        let parameter = ["plan": planFixParams]
//
//        req.httpBody = try! JSONSerialization.data(withJSONObject: parameter, options: .prettyPrinted)
//
//        print(String(data: req.httpBody!, encoding: .utf8))
//
//        //APIを呼ぶよ
//        let task = session.dataTask(with: req){(data, response, error) in
//            print(data)
//            print(error)
//
//            let responseString: String =  String(data: data!, encoding: .utf8)!
//            print(responseString)
//
//
//            do {
//                let response: [String: Any] = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
//
//                print(response)
//
//                DispatchQueue.main.async {
//                    let storyboard = UIStoryboard(name: "MainPageViewController", bundle: nil)
//                    let MainPageViewController = storyboard.instantiateViewController(withIdentifier: "MainPageViewController")
//                    MainPageViewController.modalPresentationStyle = .fullScreen
//                    self.present(MainPageViewController, animated: true, completion: nil)
//                }
//
//            } catch{
//
//            }
//
//        }
//        task.resume()
        
        
        //デートプランをリストに加えるAPI

    
        

        let planId = response["id"]!
        debugPrint(planId)

        let planFixParams = [
             "plan_id": planId
            ] as [String : Any]
//
        let parameter = ["plan": planFixParams]

        Api().datePlanFix(parameter: parameter, completion: {(token, error) in

            if let _error = error {
                // アラートを出す
                return
            }

//            guard let _token = token else {
//                // アラートを出す
//                return
//            }
               
            
            
//
            DispatchQueue.main.async {
                print("デートプランを決定したよー")
                let storyboard = UIStoryboard(name: "MainPageViewController", bundle: nil)
                let MainPageViewController = storyboard.instantiateViewController(withIdentifier: "MainPageViewController")
                MainPageViewController.modalPresentationStyle = .fullScreen
                self.present(MainPageViewController, animated: true, completion: nil)
            }
        })
        
       
    }
    
    @IBAction func againButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "DatePlanViewController")
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
    }
    
    
        @IBOutlet weak var datePlanSuggestTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        debugPrint("前の画面から渡されたレスポンス：\(response)")
        
        datePlanSuggestTV.delegate = self
        datePlanSuggestTV.dataSource = self
        
        self.gotoMypage.layer.cornerRadius = 5
        self.gotoMypage.layer.borderColor = UIColor.white.cgColor
        self.gotoMypage.layer.borderWidth = 1.0
        
        self.againButton.layer.cornerRadius = 5
        self.againButton.layer.borderColor = UIColor.white.cgColor
        self.againButton.layer.borderWidth = 1.0
        
        DispatchQueue.main.async {
            self.datePlanSuggestTV.reloadData()
        }
    }
    

    //カスタムセルの作成
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier: String = "DateListCustomCell"
        if let myCell: DateListCustomCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? DateListCustomCell {
            
//            myCell.location?.text = (response?[indexPath.row]["user"] as? [String:Any])?["name"] as? String
            
            
            
            myCell.location?.text = (response["spots"] as? [[String: Any]])?[indexPath.row]["name"] as? String
            myCell.timeIcon?.image = UIImage(named: "timeIcon")!
            myCell.mapIcon?.image = UIImage(named: "mapIcon")
            
//            myCell.time?.text = response?[indexPath.row]["text"] as? String
//            myCell.area?.text = response?[indexPath.row]["created_at"] as? String
//            myCell.userIcon.layer.cornerRadius = 35
//            myCell.postEditButton.addTarget(self, action: #selector(postEditButton(_:)), for: .touchUpInside)
//            //タグを設定
//            myCell.postEditButton.tag = indexPath.row
            return myCell
        }
        
        let myCell = DateListCustomCell(style: .default, reuseIdentifier: "DateListCustomCell")
//        myCell.location?.text = (response?[indexPath.row]["user"] as? [String:Any])?["name"] as? String
        myCell.location?.text = (response["spots"] as? [[String: Any]])?[indexPath.row]["name"] as? String
        myCell.timeIcon?.image = UIImage(named: "timeIcon")!
        myCell.mapIcon?.image = UIImage(named: "mapIcon")
        
//        myCell.time?.text = response?[indexPath.row]["text"] as? String
//        myCell.area?.text = response?[indexPath.row]["created_at"] as? String
        return myCell
    }
    
    //生成するセルの個数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if let response = response {
//            return response.count
//        }
        return 1
    }
    
    //1つ1つのセルの高さ
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return CGFloat(107)
        return UITableView.automaticDimension //自動設定
    }
    
}



class DateListCustomCell: UITableViewCell {
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var timeIcon: UIImageView!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var area: UILabel!
    @IBOutlet weak var mapIcon: UIImageView!
}

class DatePlanSuggestionCustom: UIButton {
        override func layoutSubviews() {
            super.layoutSubviews()

            self.layer.masksToBounds = false
            self.layer.shadowRadius = 3.0
            self.layer.cornerRadius = 5.0
            self.layer.shadowColor = UIColor.gray.cgColor
            self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
            self.layer.shadowOpacity = 0.5
        }
}
