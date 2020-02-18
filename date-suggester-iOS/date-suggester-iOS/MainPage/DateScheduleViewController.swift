//
//  DateScheduleViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/06.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit
class DateScheduleViewController: UIViewController {
//    , UITableViewDelegate, UITableViewDataSource
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func segmentChanged(_ sender: Any) {
        //セグメントが変更されたときの処理
//        /選択されているセグメントのインデックス
        let selectedIndex = segmentedControl.selectedSegmentIndex
        print(selectedIndex)
        
        switch selectedIndex {
        case 0:
            print("スケジュールだすよ")
//            dateText.isHidden = false;
//            labelHeightConstraint.constant = 20.5
//            dateText.text = "日付がはいります"
        default:
            print("地図をだすよ")
//            dateText.isHidden = true;
//            labelHeightConstraint.constant = 0
            //ここにテーブルビューつめるコードをかく
            //カスタムセルを新たにつくる、一つにする、地図を表示する
            
//            let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
//            let controller = storyboard.instantiateViewController(identifier: "DatePlanViewController")
//            controller.modalPresentationStyle = .fullScreen
//            present(controller, animated: false, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        dateScheduleTV.delegate = self
//        dateScheduleTV.dataSource = self
        //ここにもすぐスケジュールだす(地図画面から遷移してきたときのために、スイッチにもかくよ）
    }
    
    @IBOutlet weak var dateScheduleTV: UITableView!
//
//    //カスタムセルの作成
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    let cellIdentifier: String = "dateScheduleCustomCell"
//        if let myCell: dateScheduleCustomCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? dateScheduleCustomCell {
//
//            myCell.time.text = (response?[indexPath.row]["spots"] as? [String:Any])?["time"] as? String
//            myCell.destination.text = (response?[indexPath.row]["spots"] as? [String:Any])?["name"] as? String
//            return myCell
//        }
//
//        let myCell = dateScheduleCustomCell(style: .default, reuseIdentifier: "dateScheduleCustomCell")
//        myCell.time.text = (response?[indexPath.row]["spots"] as? [String:Any])?["time"] as? String
//        myCell.destination.text = (response?[indexPath.row]["spots"] as? [String:Any])?["name"] as? String
//            return myCell
//    }
//
//    //生成するセルの個数
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if let response = response {
//            return response.count
//        }
//        return 0
//    }
//
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        //アクション実装
//        print("\(indexPath.row)番目の行が選択されました")
//        print("ここにindexPath.rowばんめの辞書をそのまま出したい")
//        let indexRowDictionary = (response?[indexPath.row])!
//         print(indexRowDictionary)
//        let indexRowDictionaryId = indexRowDictionary["id"]!
//
//        //セルの選択を解除
//         tableView.deselectRow(at: indexPath, animated: true)
//
//    }
    

    
}

    class dateScheduleCustomCell: UITableViewCell {
        @IBOutlet weak var time: UILabel!
        @IBOutlet weak var destination: UILabel!
}
