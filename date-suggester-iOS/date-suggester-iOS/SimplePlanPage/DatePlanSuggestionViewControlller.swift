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
    
    //ボタンOutlet
    @IBOutlet weak var gotoMypage: UIButton!
    @IBOutlet weak var againButton: UIButton!
    @IBOutlet weak var gotoMyPage: UIButton!
    
    //デートプランタイトルOutlet
    @IBOutlet weak var datePlanTitle: UILabel!
    @IBOutlet weak var datePlanDescription: UILabel!
    @IBOutlet weak var datePlanImage: UIImageView!
    @IBOutlet weak var moneyIconTotal: UIImageView!
    @IBOutlet weak var totalBudget: UILabel!
    @IBOutlet weak var mapIconWhite: UIImageView!
    @IBOutlet weak var datePlanArea: UILabel!
    
    
    
    @IBAction func gotoMypage(_ sender: Any) {
        //デートプランをリストに加えるAPI
        let planId = response["id"]
        
        let planFixParams = [
             "plan_id": planId
            ] as [String : Any]
        
        let parameter = ["plan": planFixParams]

        Api().datePlanFix(parameter: parameter, completion: {(token, error) in

            if let _error = error {
                // アラートを出す
                return
            }
            DispatchQueue.main.async {
                print("デートプランを決定したよー")
                let defaults = UserDefaults.standard
                defaults.set(true, forKey: "popUp")
                let storyboard = UIStoryboard(name: "MainPageViewController", bundle: nil)
                let MainPageViewController = storyboard.instantiateViewController(withIdentifier: "MainPageViewController")
                MainPageViewController.modalPresentationStyle = .fullScreen
                self.present(MainPageViewController, animated: true, completion: nil)
            }
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
    
    @IBAction func gotoMyPage(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: "popUp")
        let storyboard = UIStoryboard(name: "MainPageViewController", bundle: nil)
        let mainPageViewController = storyboard.instantiateViewController(withIdentifier: "MainPageViewController")
        mainPageViewController.modalPresentationStyle = .fullScreen
        self.present(mainPageViewController, animated: true, completion: nil)
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
        let thumbImage:UIImage = getImageByUrl(url:self.response["thumb"] as! String)
        debugPrint("前の画面から渡されたレスポンス：\(response)")
        
        datePlanSuggestTV.delegate = self
        datePlanSuggestTV.dataSource = self
        
        //ボタン装飾
        self.gotoMypage.layer.cornerRadius = 30
        self.gotoMypage.layer.borderColor = UIColor.white.cgColor
        self.gotoMypage.layer.borderWidth = 1.0

        self.againButton.layer.borderColor = UIColor.init(red: 254.0/255, green: 84.0/255, blue: 146.0/255, alpha: 1.0).cgColor
        self.againButton.layer.borderWidth = 1.0
        self.againButton.layer.cornerRadius = 30
        
        DispatchQueue.main.async {
            self.datePlanSuggestTV.reloadData()
            self.datePlanTitle.text = (self.response["title"] as! String)
            self.datePlanDescription.text = (self.response["description"] as! String)
            self.totalBudget.text = (self.response["total_budget"] as! String)
            self.datePlanArea.text = (self.response["area"] as! String)
            self.datePlanImage.image = thumbImage
        }
        
    }

    //カスタムセルの作成
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier: String = "DateListCustomCell"
        let spotsThumbImage:UIImage = getImageByUrl(url:((self.response["spots"] as? [[String: Any]])?[indexPath.row]["thumb"] as? String)!)
        if let myCell: DateListCustomCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? DateListCustomCell {

            myCell.thumbnail?.image = spotsThumbImage
            myCell.location?.text = (response["spots"] as? [[String: Any]])?[indexPath.row]["name"] as? String
            myCell.dateDescription?.text = (response["spots"] as? [[String: Any]])?[indexPath.row]["description"] as? String
            myCell.moneyIcon?.image = UIImage(named: "moneyIcon")!
            myCell.budget?.text = (response["spots"] as? [[String: Any]])?[indexPath.row]["budget"] as? String
            myCell.linkIcon?.image = UIImage(named: "linkIcon")
            myCell.url?.text = "URL//image/path/.."

            return myCell
        }
        
        let myCell = DateListCustomCell(style: .default, reuseIdentifier: "DateListCustomCell")

        myCell.thumbnail?.image = spotsThumbImage
        myCell.location?.text = (response["spots"] as? [[String: Any]])?[indexPath.row]["name"] as? String
        myCell.dateDescription?.text = (response["spots"] as? [[String: Any]])?[indexPath.row]["description"] as? String
        myCell.moneyIcon?.image = UIImage(named: "moneyIcon")!
        myCell.budget?.text = (response["spots"] as? [[String: Any]])?[indexPath.row]["budget"] as? String
        myCell.linkIcon?.image = UIImage(named: "linkIcon")
        myCell.url?.text = "URL//image/path/.."
        
        return myCell
    }
    
    //生成するセルの個数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        guard let response = response else {
//          return 0
//        }
        return 2
    }

    
    //1つ1つのセルの高さ
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension //自動設定
    }
}

class DateListCustomCell: UITableViewCell {
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var dateDescription: UILabel!
    @IBOutlet weak var moneyIcon: UIImageView!
    @IBOutlet weak var budget: UILabel!
    @IBOutlet weak var linkIcon: UIImageView!
    @IBOutlet weak var url: UILabel!
}
