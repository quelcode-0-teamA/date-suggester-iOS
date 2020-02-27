//
//  DateplanListViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/05.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit
class DateplanListViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate,  UICollectionViewDelegateFlowLayout{

    var response: [[String: Any]]?
    
    @IBOutlet weak var popUp: UIButton!
    @IBAction func popUpClose(_ sender: Any) {
         self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    private let photos = ["1","2","3","4","5"]
//    private let titles = ["恵比寿ガーデンプレイス", "カフェめぐり", "話題の表参道カフェ", "浅草", "上野動物園"]
    
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
        
         

        /*
         デートリスト取得API
         */
        let config: URLSessionConfiguration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: config)
        
        //URLを組み立てている
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api-date-suggester-dev.herokuapp.com"
        urlComponents.path = "/v1/mypage/my_plans"

        let url: URL = urlComponents.url!
        var req: URLRequest = URLRequest(url: url)
        req.httpMethod = "GET"
        
        print(url)
        
        //ヘッダーを付与
        let defaults = UserDefaults.standard
        let myToken = defaults.string(forKey: "responseToken")!
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        req.setValue("Bearer " + myToken, forHTTPHeaderField: "Authorization")
        
        
        //APIを呼ぶよ
        let task = session.dataTask(with: req){(data, response, error) in
            
            do {
                let response: [[String: Any]] = try JSONSerialization.jsonObject(with: data!, options: []) as! [[String: Any]]
                
                print(response)
                self.response = response
                
                DispatchQueue.main.async {
                    self.CollectionView.reloadData()
                }
                
            } catch{
                
            }
            
        }
        task.resume()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        let storyboard = UIStoryboard(name: "MainPageViewController", bundle: nil)
//        let controller = storyboard.instantiateViewController(identifier: "PopupViewController")
//        controller.modalPresentationStyle = .fullScreen
//        present(controller, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // スタンプが押された時の処理を書く
        print("スタンプがおされたよ")
//        let storyboard = UIStoryboard(name: "MainPageViewController", bundle: nil)
//        let DateScheduleViewController = storyboard.instantiateViewController(withIdentifier: "DateScheduleViewController")
//        self.navigationController?.pushViewController(DateScheduleViewController, animated: true)
        
        //APIアクション実装
//        print("\(indexPath.row)番目の行が選択されました")
//        print("\(response?[indexPath.row]["id"]!)番目のリストが選択されました")
//        print("ここにindexPath.rowばんめの辞書をそのまま出したい")
//        let indexRowDictionary = (response?[indexPath.row])!
//        print(indexRowDictionary)
//        let indexRowDictionaryId = indexRowDictionary["id"]!
//        print(indexRowDictionaryId)
        
        //セルの選択を解除
        CollectionView.deselectItem(at: indexPath, animated: true)
        
        let myplan_id = (response?[indexPath.row]["id"])! // ここで代入してる
        print(myplan_id)
        let storyboard = UIStoryboard(name: "MainPageViewController", bundle: nil)
        guard let dateScheduleViewController = storyboard.instantiateViewController(withIdentifier: "DateScheduleViewController") as? DateScheduleViewController else {
            return
        }//これが保証されたら71行めにいく
        dateScheduleViewController.myplan_id = myplan_id
//        print(myplan_id)
        self.navigationController?.pushViewController(dateScheduleViewController, animated: true)
        
        
        
    }
    
    // １つのセクションの中に表示するセル（要素）の数。
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            guard let response = response else {
                return 0
            }
            return response.count
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let datePlanListCell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DatePlanListCollectionViewCell", for: indexPath) as! DatePlanListCollectionViewCell

            // Tag番号を使ってインスタンスをつくる
            let photoImageView = datePlanListCell.contentView.viewWithTag(1)  as! UIImageView
            let photoImage = UIImage(named: photos[indexPath.row])
            photoImageView.image = photoImage
            
            let titleLabel = datePlanListCell.contentView.viewWithTag(2) as! UILabel
            titleLabel.text = (response?[indexPath.row]["plan"] as? [String:Any])?["title"] as? String

            return datePlanListCell
        }
    
    // Screenサイズに応じたセルサイズを返す
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfMargin: CGFloat = 3.0
        let cellWidth = (UIScreen.main.bounds.width - 12.0 * numberOfMargin) / itemsPerRow
        return CGSize(width: cellWidth, height: cellWidth)
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


