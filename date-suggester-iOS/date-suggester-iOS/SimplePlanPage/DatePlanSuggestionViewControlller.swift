//
//  DatePlanSuggestionViewControlller.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/05.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class DatePlanSuggestionViewControlller: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var gotoMypage: UIButton!
    @IBOutlet weak var againButton: UIButton!
    
    @IBOutlet var gotoDatailPage: UIView!
    
    @IBAction func gotoMypage(_ sender: Any) {
        
        //デートプランをリストに加えるAPI
        
        //画面遷移
        let storyboard = UIStoryboard(name: "MainPageViewController", bundle: nil)
        let MainPageViewController = storyboard.instantiateViewController(withIdentifier: "MainPageViewController")
        MainPageViewController.modalPresentationStyle = .fullScreen
        self.present(MainPageViewController, animated: true, completion: nil)
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
        
        datePlanSuggestTV.delegate = self
        datePlanSuggestTV.dataSource = self
        
//        gotoMypage.layer.cornerRadius = 10
//        self.gotoDatailPage.layer.cornerRadius = 10
        
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
            myCell.location?.text = "てまりのおうちあにゃんこにゃんこにゃんこにゃんこにゃんこにゃんこにゃんこにゃんこにゃんこにゃんこにゃんこにゃんこ"
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
        myCell.location?.text = "てまりのおうちあにゃんこにゃんこにゃんこにゃんこにゃんこにゃんこにゃんこにゃんこにゃんこにゃんこにゃんこにゃんこ"
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
