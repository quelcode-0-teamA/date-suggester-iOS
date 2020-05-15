//
//  DateplanListViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/05.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class DateplanListViewController: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate,  UICollectionViewDelegateFlowLayout{
    
    var resPlanList: [MyPlan]?
    private let itemsPerRow: CGFloat = 2
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        datePlanList_Get()
    }
    
    private func setupView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "DatePlanListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DatePlanListCollectionViewCell")
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "NavBarBG"), for: .default)
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        navigationItem.title = "Date Suggester"
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title:  "戻る",
            style:  .plain,
            target: nil,
            action: nil
        )
        
        collectionView.reloadData()
    }
    
    private func datePlanList_Get() {
        /*
         デートリスト取得API
         */
        let config: URLSessionConfiguration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: config)
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.date-suggester.com"
        urlComponents.path = "/v1/my_plans"
        
        let url: URL = urlComponents.url!
        var req: URLRequest = URLRequest(url: url)
        req.httpMethod = "GET"
        
        let myToken = UserDefaults.standard.getResponseToken()
        
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        req.setValue("Bearer " + myToken, forHTTPHeaderField: "Authorization")
        
        let task = session.dataTask(with: req){(data, response, error) in
            
            do {
                let response: [[String: Any]] = try JSONSerialization.jsonObject(with: data!, options: []) as! [[String: Any]]
                var _myplans = [MyPlan]()
                for i in response {
                    let myplan = MyPlan(myPlanDicitionary: i)
                    _myplans.append(myplan)
                }
                print("_myplans:\(_myplans)")
                self.resPlanList = _myplans
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                    debugPrint("リストのレスポンス：\(self.resPlanList)")
                }
            } catch{
            }
        }
        task.resume()
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //セルの選択を解除
        collectionView.deselectItem(at: indexPath, animated: true)
        
        let my_plan_id = resPlanList?[indexPath.row].id
        let storyboard = UIStoryboard(name: "MainPageViewController", bundle: nil)
        guard let dateScheduleViewController = storyboard.instantiateViewController(withIdentifier: "DateScheduleViewController") as? DateScheduleViewController else {
            return
        }
        dateScheduleViewController.my_plan_id = my_plan_id
        self.navigationController?.pushViewController(dateScheduleViewController, animated: true)
    }
    
    // １つのセクションの中に表示するセル（要素）の数。
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.resPlanList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let datePlanListCell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "DatePlanListCollectionViewCell", for: indexPath) as! DatePlanListCollectionViewCell
        // Tag番号を使ってインスタンスをつくる
        let photoImageView = datePlanListCell.contentView.viewWithTag(1)  as! UIImageView
        photoImageView.image =  ChangeUrlToImage.getImageByUrl(url: resPlanList?[indexPath.row].plan?.thumb ?? "")
        
        let titleLabel = datePlanListCell.contentView.viewWithTag(2) as! UILabel
        titleLabel.text = resPlanList?[indexPath.row].plan?.title
        
        return datePlanListCell
    }
    
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
