//
//  DateScheduleViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/06.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit
class DateScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var myplan_id: Any?
    
    @IBOutlet weak var dateScheduleTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateScheduleTV.delegate = self
        dateScheduleTV.dataSource = self
        
        /*
         選択したデートリスト取得API
         */
        let config: URLSessionConfiguration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: config)
        
        //URLオブジェクトの生成
//        let myplan_id = (response?[indexPath.row]["id"])!
        print(myplan_id)
        let url = URL(string: "https://api-date-suggester-dev.herokuapp.com/v1/mypage/my_plans/\(String(describing: myplan_id!))")!
        print(url)
        //URLRequestの生成
        var req: URLRequest = URLRequest(url: url)
        req.httpMethod = "GET"
        
        //ヘッダーを付与
        let defaults = UserDefaults.standard
        let myToken = defaults.string(forKey: "responseToken")!
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        req.setValue("Bearer " + myToken, forHTTPHeaderField: "Authorization")
        
        
        //APIを呼ぶよ
        let task = session.dataTask(with: req){(data, response, error) in
            
            let responseString: String =  String(data: data!, encoding: .utf8)!
            print(responseString)
            
            
            do {
                let response: [String: Any] = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
                
                print(response)
                
                DispatchQueue.main.async {
                    self.dateScheduleTV.reloadData()
                    print("テーブルビューを更新したよ")
                }
                
            } catch{
                
            }
            
        }
        task.resume()
    }
    

    
    //カスタムセルの作成
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier: String = "DateScheduleCustomCell"
        if let myCell: DateScheduleCustomCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? DateScheduleCustomCell {
            
            //            myCell.location?.text = (response?[indexPath.row]["user"] as? [String:Any])?["name"] as? String
            myCell.location?.text = "てまりのおうちあにゃんこにゃんこにゃんこにゃんこにゃんこにゃんこにゃんこにゃんこにゃんこにゃんこにゃんこにゃんこ"
            myCell.timeIcon?.image = UIImage(named: "timeIcon")!
            myCell.mapIcon?.image = UIImage(named: "mapIcon")
            myCell.linkIcon?.image = UIImage(named: "linkIcon")
            myCell.URL?.text = "URL//image/path/.."
            
            //            myCell.time?.text = response?[indexPath.row]["text"] as? String
            //            myCell.area?.text = response?[indexPath.row]["created_at"] as? String
            //            myCell.userIcon.layer.cornerRadius = 35
            //            myCell.postEditButton.addTarget(self, action: #selector(postEditButton(_:)), for: .touchUpInside)
            //            //タグを設定
            //            myCell.postEditButton.tag = indexPath.row
            return myCell
        }
        
        let myCell = DateScheduleCustomCell(style: .default, reuseIdentifier: "DateScheduleCustomCell")
        //        myCell.location?.text = (response?[indexPath.row]["user"] as? [String:Any])?["name"] as? String
        myCell.location?.text = "てまりのおうちあにゃんこにゃんこにゃんこにゃんこにゃんこにゃんこにゃんこにゃんこにゃんこにゃんこにゃんこにゃんこ"
        myCell.timeIcon?.image = UIImage(named: "timeIcon")!
        myCell.mapIcon?.image = UIImage(named: "mapIcon")
        myCell.linkIcon?.image = UIImage(named: "linkIcon")
        myCell.URL?.text = "URL//image/path/.."
        
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
//                return CGFloat(107)
        return UITableView.automaticDimension //自動設定
    }
    

    @IBAction func deleteMyDatePlan(_ sender: Any) {
        let config: URLSessionConfiguration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: config)
        
        //URLオブジェクトの生成
        let defaults = UserDefaults.standard
        //        let myplan_id = defaults.string(forKey: "responseMyPlanId")!
        //TODO:削除はレスポンスが現在返ってこないので、セルリロードにいかない
        //TODO:ここをリストい詳細で取得したmyplanIDに変える
        let myplan_id = 66
        print(myplan_id)
        let url = URL(string: "https://api-date-suggester-dev.herokuapp.com/v1/mypage/my_plans/\(myplan_id)")!
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
                
                debugPrint("デートプランがリストから削除されたよ")
                DispatchQueue.main.async {
//                    self.dismiss(animated: true, completion: nil)
                    self.dateScheduleTV.reloadData()
                }
                
            } catch{
            }
            
        }
        task.resume()
    }
    
}

    class DateScheduleCustomCell: UITableViewCell {
        @IBOutlet weak var location: UILabel!
        @IBOutlet weak var timeIcon: UIImageView!
        @IBOutlet weak var time: UILabel!
        @IBOutlet weak var mapIcon: UIImageView!
        @IBOutlet weak var area: UILabel!
        @IBOutlet weak var linkIcon: UIImageView!
        @IBOutlet weak var URL: UILabel!
}
