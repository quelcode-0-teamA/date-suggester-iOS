//
//  DateScheduleViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/06.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit
import ActiveLabel

class DateScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var my_plan_id: Any?
    var myPlan: MyPlan?
    var trashBarButtonItem: UIBarButtonItem!
    
    @IBOutlet weak var dateScheduleTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        selectedDatePlan_Get()
    }
    
    private func setupView() {
        dateScheduleTV.delegate = self
        dateScheduleTV.dataSource = self
        dateScheduleTV.rowHeight = 162
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        navigationController?.navigationBar.tintColor = UIColor.white
        trashBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(trashBarButtonTapped(_:)))
        navigationItem.rightBarButtonItems = [trashBarButtonItem]
    }
    
    private func selectedDatePlan_Get() {
        
        /*
         ユーザーが選択したデートリスト取得API
         */
        let config: URLSessionConfiguration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: config)
        let url = URL(string: "https://api.date-suggester.com/v1/my_plans/\(my_plan_id!)")!
        
        var req: URLRequest = URLRequest(url: url)
        req.httpMethod = "GET"
        
        let myToken = UserDefaults.standard.getResponseToken()
        
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        req.setValue("Bearer " + myToken, forHTTPHeaderField: "Authorization")
        
        let task = session.dataTask(with: req){(data, response, error) in
            
            let responseString: String =  String(data: data!, encoding: .utf8)!
            
            do {
                let response: [String: Any] = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
                DispatchQueue.main.async {
                    self.myPlan = MyPlan(myPlanDicitionary: response)
                    self.dateScheduleTV.reloadData()
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
                    
                    self.my_plan_id = self.myPlan?.id
                    
                    let url = URL(string: "https://api.date-suggester.com/v1/my_plans/\(self.my_plan_id!)")!
                    var req: URLRequest = URLRequest(url: url)
                    req.httpMethod = "DELETE"
                    
                    let myToken = UserDefaults.standard.getResponseToken()
                    req.setValue("application/json", forHTTPHeaderField: "Content-Type")
                    req.setValue("Bearer " + myToken, forHTTPHeaderField: "Authorization")
                    
                    let task = session.dataTask(with: req){(data, response, error) in
                        do {
                            let httpResponse = response as? HTTPURLResponse
                            debugPrint(httpResponse!.statusCode)
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier: String = "DateScheduleCustomCell"
        let detailSpotsThumbImage: UIImage = ChangeUrlToImage.shared.getImageByUrl(url:(self.myPlan!.plan?.spots![indexPath.row].thumb)!)
        
        if let myCell: DateScheduleCustomCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? DateScheduleCustomCell {
            myCell.thumbnail?.image = detailSpotsThumbImage
            myCell.location?.text = self.myPlan?.plan?.spots?[indexPath.row].name
            myCell.moneyIcon?.image = UIImage(named: "moneyIcon")!
            myCell.budget?.text = self.myPlan?.plan?.spots?[indexPath.row].budget
            myCell.linkIcon?.image = UIImage(named: "linkIcon")
            myCell.urlLabel.customize { label in
                label.text = self.myPlan?.plan?.spots?[indexPath.row].url as? String
                label.textColor = .blue
                label.handleURLTap{ url in
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
            
            return myCell
        }
        
        let myCell = DateScheduleCustomCell(style: .default, reuseIdentifier: cellIdentifier)
        myCell.thumbnail?.image = detailSpotsThumbImage
        myCell.location?.text = self.myPlan?.plan?.spots?[indexPath.row].name
        myCell.moneyIcon?.image = UIImage(named: "moneyIcon")!
        myCell.budget?.text = self.myPlan?.plan?.spots?[indexPath.row].budget
        myCell.linkIcon?.image = UIImage(named: "linkIcon")
        myCell.urlLabel.customize { label in
            label.text = self.myPlan?.plan?.spots?[indexPath.row].url as? String
            label.textColor = .blue
            label.handleURLTap{ url in
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
        return myCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myPlan?.plan?.spots?.count ?? 0
    }
}

class DateScheduleCustomCell: UITableViewCell {
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var moneyIcon: UIImageView!
    @IBOutlet weak var budget: UILabel!
    @IBOutlet weak var linkIcon: UIImageView!
    @IBOutlet weak var urlLabel: ActiveLabel!
}
