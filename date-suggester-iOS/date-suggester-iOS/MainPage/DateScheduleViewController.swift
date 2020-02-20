//
//  DateScheduleViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/06.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit
class DateScheduleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
//    @IBOutlet weak var segmentedControl: UISegmentedControl!
//
//    @IBAction func segmentChanged(_ sender: Any) {
//        //セグメントが変更されたときの処理
////        /選択されているセグメントのインデックス
//        let selectedIndex = segmentedControl.selectedSegmentIndex
//        print(selectedIndex)
//
//        switch selectedIndex {
//        case 0:
//            print("スケジュールだすよ")
////            dateText.isHidden = false;
////            labelHeightConstraint.constant = 20.5
////            dateText.text = "日付がはいります"
//        default:
//            print("地図をだすよ")
////            dateText.isHidden = true;
////            labelHeightConstraint.constant = 0
//            //ここにテーブルビューつめるコードをかく
//            //カスタムセルを新たにつくる、一つにする、地図を表示する
//
////            let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
////            let controller = storyboard.instantiateViewController(identifier: "DatePlanViewController")
////            controller.modalPresentationStyle = .fullScreen
////            present(controller, animated: false, completion: nil)
//        }
//    }
    
    @IBOutlet weak var dateScheduleTV: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateScheduleTV.delegate = self
        dateScheduleTV.dataSource = self
        //ここにもすぐスケジュールだす(地図画面から遷移してきたときのために、スイッチにもかくよ）
        
        DispatchQueue.main.async {
            self.dateScheduleTV.reloadData()
        }
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
