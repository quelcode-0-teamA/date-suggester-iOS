//
//  DateplanListViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/05.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit
class DateplanListViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate,  UICollectionViewDelegateFlowLayout{


    @IBOutlet weak var CollectionView: UICollectionView!
    
    private let photos = ["1","2","3","4","5"]
    private let titles = ["パンケーキ", "ラーメン", "サンドウィッチ", "人参とポテト", "プレートランチ"]
    
    // レイアウト設定　UIEdgeInsets については下記の参考図を参照。
    //private let sectionInsets = UIEdgeInsets(top: 10.0, left: 2.0, bottom: 2.0, right: 2.0)
    // 1行あたりのアイテム数
    private let itemsPerRow: CGFloat = 2
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("デートプランリストがでる画面だよ〜")
        
        CollectionView.delegate = self
        CollectionView.dataSource = self
        CollectionView.register(UINib(nibName: "DatePlanListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DatePlanListCollectionViewCell")
        
        // 背景画像の設定
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "test"), for: .default)
        // タイトルテキストの装飾設定
        self.navigationController?.navigationBar.titleTextAttributes = [
            // 文字の色
            .foregroundColor: UIColor.white
        ]
        
        CollectionView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // スタンプが押された時の処理を書く
        print("スタンプがおされたよ")
    }
    
    // １つのセクションの中に表示するセル（要素）の数。
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return photos.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            // "Cell" の部分は　Storyboard でつけた cell の identifier。
            let datePlanListCell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DatePlanListCollectionViewCell", for: indexPath) as! DatePlanListCollectionViewCell

            // Tag番号を使ってインスタンスをつくる
            let photoImageView = datePlanListCell.contentView.viewWithTag(1)  as! UIImageView
            let photoImage = UIImage(named: photos[indexPath.row])
            photoImageView.image = photoImage
            
            let titleLabel = datePlanListCell.contentView.viewWithTag(2) as! UILabel
            titleLabel.text = titles[indexPath.row]

            return datePlanListCell
        }
    
 
    
    
    
    
    // Screenサイズに応じたセルサイズを返す
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let numberOfMargin: CGFloat = 3.0
        let titleHeight: CGFloat = 24.0
        let imageRatio: CGFloat = 1.0
        
        let cellWidth = (UIScreen.main.bounds.width - 12.0 * numberOfMargin) / itemsPerRow
        let cellHeight = cellWidth * imageRatio + titleHeight
        return CGSize(width: cellWidth, height: cellHeight)
        
        
//        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
//        let availableWidth = view.frame.width - paddingSpace
//        let widthPerItem = availableWidth / itemsPerRow
//        print("widthPerItem;", widthPerItem)
//        return CGSize(width: widthPerItem, height: widthPerItem + 42)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 12.0, left: 12.0, bottom: 12.0, right: 12.0)
    }
    //水平方向の余白
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12.0
    }

    //垂直方向の余白
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 12.0
    }
}
