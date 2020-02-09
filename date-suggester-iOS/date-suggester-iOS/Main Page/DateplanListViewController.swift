//
//  DateplanListViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/05.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit
class DateplanListViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    var selectedImage : UIImage?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let photos = ["1", "2","3","4","5"]
//    "6","7","8","9","10"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("デートプランリストがでる画面だよ〜")
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    //セルの色
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let datePlanListCell = collectionView.dequeueReusableCell(withReuseIdentifier: "datePlanListCell", for: indexPath)
        
        // Tag番号を使ってImageViewのインスタンス生成
        let imageView = datePlanListCell.contentView.viewWithTag(1) as! UIImageView
        // 画像配列の番号で指定された要素の名前の画像をUIImageとする
        let cellImage = UIImage(named: photos[indexPath.row])
        // UIImageをUIImageViewのimageとして設定
        imageView.image = cellImage
        
        // Tag番号を使ってLabelのインスタンス生成
//        let label = datePlanListCell.contentView.viewWithTag(2) as! UILabel
//        label.text = photos[indexPath.row]
        
//        datePlanListCell.backgroundColor = .systemPink  // セルの色
        return datePlanListCell
    }
    
    // Screenサイズに応じたセルサイズを返す
    // UICollectionViewDelegateFlowLayoutの設定が必要
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 横方向のスペース調整
        let horizontalSpace:CGFloat = 2
        let cellSize:CGFloat = self.view.bounds.width/2 - horizontalSpace
        // 正方形で返すためにwidth,heightを同じにする
        return CGSize(width: cellSize, height: cellSize)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // section数は１つ
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        // 要素数を入れる、要素以上の数字を入れると表示でエラーとなる
        return photos.count;
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let horizontalSpace : CGFloat = 20
//        let cellSize : CGFloat = self.view.bounds.width / 3 - horizontalSpace
//        return CGSize(width: cellSize, height: cellSize)
//    }

    //ここからかく！押したらちゃんとスケジュール詳細画面に遷移するようにする！
    
   // セルが選択されたときの処理
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\([indexPath.row])がtapされたよ")
        
    }
    
    // Cell が選択された場合
//       func collectionView(_ collectionView: UICollectionView,
//                             didSelectItemAt indexPath: IndexPath) {
//
//           // [indexPath.row] から画像名を探し、UImage を設定
//           selectedImage = UIImage(named: photos[indexPath.row])
//           if selectedImage != nil {
//               // SubViewController へ遷移するために Segue を呼び出す
//               performSegue(withIdentifier: "toSubViewController",sender: nil)
//           }
//
//       }
    

//    @IBAction func gotoDateSchedule(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "MainPageViewController", bundle: nil)
//        let DateScheduleViewController = storyboard.instantiateViewController(withIdentifier: "DateScheduleViewController")
//        self.navigationController?.pushViewController(DateScheduleViewController, animated: false)
//    }
    
}

class datePlanListCell: UICollectionViewCell {
    @IBOutlet weak var dateListTitle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
}
