//
//  DateScheduleViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/06.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit
class DateScheduleViewController: UIViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var labelHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var dateText: UILabel!
    @IBAction func segmentChanged(_ sender: Any) {
        //セグメントが変更されたときの処理
//        /選択されているセグメントのインデックス
        let selectedIndex = segmentedControl.selectedSegmentIndex
        print(selectedIndex)
        
        switch selectedIndex {
        case 0:
            print("スケジュールだすよ")
            dateText.isHidden = false;
            labelHeightConstraint.constant = 20.5
            dateText.text = "日付がはいります"
        default:
            print("地図をだすよ")
            dateText.isHidden = true;
            labelHeightConstraint.constant = 0
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
        //ここにもすぐスケジュールだす(地図画面から遷移してきたときのために、スイッチにもかくよ）
    }
    
}
