//
//  DateScheduleViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/06.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit
class DateScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var my_plan_id: Any?
    var myPlan: MyPlan?
    var trashBarButtonItem: UIBarButtonItem!
    
    @IBOutlet weak var dateScheduleTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateScheduleTV.delegate = self
        dateScheduleTV.dataSource = self
        
        // タイトルテキストの装飾設定
        self.navigationController?.navigationBar.titleTextAttributes = [
            // 文字の色
            .foregroundColor: UIColor.white
        ]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        
        trashBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(trashBarButtonTapped(_:)))
        self.navigationItem.rightBarButtonItems = [trashBarButtonItem]
        
        /*
         選択したデートリスト取得API
         */
        let config: URLSessionConfiguration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: config)
        
        let url = URL(string: "https://api-date-suggester-dev.herokuapp.com/v1/my_plans/\(my_plan_id!)")!
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
            
            do {
                let response: [String: Any] = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
                                
                DispatchQueue.main.async {
                    self.myPlan = MyPlan(myPlanDicitionary: response)

                    self.dateScheduleTV.reloadData()

                    print("responseはいまこういう型だよ：\(response)")
                    
                }
                
            } catch{
                
            }
            
        }
        task.resume()
    }
    
    @objc func trashBarButtonTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        alert.title = "デートプランをリストから削除します"
        alert.message = "削除してもいいですか？"
        alert.addAction(
            UIAlertAction(
                title: "削除",
                style: .default,
                handler: {(action) -> Void in
                    let config: URLSessionConfiguration = URLSessionConfiguration.default
                    let session: URLSession = URLSession(configuration: config)
                    
                    //URLオブジェクトの生成
                    let defaults = UserDefaults.standard
                    
                    self.my_plan_id = self.myPlan?.id
                    
                    let url = URL(string: "https://api-date-suggester-dev.herokuapp.com/v1/my_plans/\(self.my_plan_id!)")!
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
                            let httpResponse = response as? HTTPURLResponse
                            debugPrint(httpResponse!.statusCode)
                            
                            debugPrint("デートプランがリストから削除されたよ")
                            DispatchQueue.main.async {
                                self.dateScheduleTV.reloadData()
                            }
                            
                        } catch{
                        }
                        
                    }
                    task.resume()
            })
        )
        
        alert.addAction(
            UIAlertAction(
                title: "キャンセル",
                style: .cancel,
                handler: nil)
        )
        
        self.present(
            alert,
            animated: true,
            completion: {
        })
        
    }
    
    
    func getImageByUrl(url: String) -> UIImage{
        let url = URL(string: url)
        do {
            let data = try Data(contentsOf: url!)
            return UIImage(data: data)!
        } catch let err {
            print("Error : \(err.localizedDescription)")
        }
        return UIImage()
    }

    
    //カスタムセルの作成
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier: String = "DateScheduleCustomCell"
        let detailSpotsThumbImage:UIImage = getImageByUrl(url:self.myPlan!.plan.spots[indexPath.row].thumb)
        
        if let myCell: DateScheduleCustomCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? DateScheduleCustomCell {
            
            myCell.thumbnail?.image = detailSpotsThumbImage
            myCell.location?.text = self.myPlan?.plan.spots[indexPath.row].name
            myCell.moneyIcon?.image = UIImage(named: "moneyIcon")!
            myCell.budget?.text = self.myPlan?.plan.spots[indexPath.row].budget
            myCell.linkIcon?.image = UIImage(named: "linkIcon")
            myCell.URL?.text = "URL//image/path/.."

            return myCell
        }
        
        let myCell = DateScheduleCustomCell(style: .default, reuseIdentifier: "DateScheduleCustomCell")
        
        myCell.thumbnail?.image = detailSpotsThumbImage
        myCell.location?.text = self.myPlan?.plan.spots[indexPath.row].name
        myCell.moneyIcon?.image = UIImage(named: "moneyIcon")!
        myCell.budget?.text = self.myPlan?.plan.spots[indexPath.row].budget
        myCell.linkIcon?.image = UIImage(named: "linkIcon")
        myCell.URL?.text = "URL//image/path/.."
        
        return myCell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myPlan?.plan.spots.count ?? 0
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

    class DateScheduleCustomCell: UITableViewCell {
        @IBOutlet weak var thumbnail: UIImageView!
        @IBOutlet weak var location: UILabel!
        @IBOutlet weak var planDescription: UILabel!
        @IBOutlet weak var moneyIcon: UIImageView!
        @IBOutlet weak var budget: UILabel!
        @IBOutlet weak var linkIcon: UIImageView!
        @IBOutlet weak var URL: UILabel!
}
