//
//  DateplanListViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/05.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit
class DateplanListViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
//    @IBOutlet weak var CollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("デートプランリストがでる画面だよ〜")
        
//        CollectionView.delegate = self
//        CollectionView.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // スタンプが押された時の処理を書く
        print("スタンプがおされたよ")
    }


    //表示するセルの数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    //セルの色
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let datePlanListCell = collectionView.dequeueReusableCell(withReuseIdentifier: "datePlanListCell", for: indexPath) // 表示するセルを登録(先程命名した"Cell")
        datePlanListCell.backgroundColor = .systemPink  // セルの色
        return datePlanListCell
    }
    

    //ここからかく！押したらちゃんとスケジュール詳細画面に遷移するようにする！

//    @IBAction func gotoDateSchedule(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "MainPageViewController", bundle: nil)
//        let DateScheduleViewController = storyboard.instantiateViewController(withIdentifier: "DateScheduleViewController")
//        self.navigationController?.pushViewController(DateScheduleViewController, animated: false)
//    }
    
}

class datePlanListCell: UICollectionViewCell {
    
    @IBOutlet weak var dateListTitle: UILabel!
    
}
