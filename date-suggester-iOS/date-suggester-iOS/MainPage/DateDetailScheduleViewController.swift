//
//  DateDetailScheduleViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/07.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit
class DateDetailScheduleViewController: UIViewController{
    
//    , UITableViewDelegate, UITableViewDataSource
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        dateSScheduleTV.delegate = self
//        datecheduleTV.dataSource = self
    }
    
    
}

class dateScheguleCustomCell: UITableViewCell {
    
}

class dateTellCustomCell: UITableViewCell {
    
}

class dateURLCustomCell: UITableViewCell {
    
}





/*
         ここからスケジュール詳細一覧を取得するAPIを書く
         */
//        let config: URLSessionConfiguration = URLSessionConfiguration.default
//        let session: URLSession = URLSession(configuration: config)
//
//        //URLオブジェクトの生成
//        let number = indexRowDictionaryId
//        print(number)
//        let url = URL(string: "ここにURLかく")!
//        //URLRequestの生成
//        var req: URLRequest = URLRequest(url: url)
//        req.httpMethod = "GET"
//
//        //ヘッダーを付与
//        let defaults = UserDefaults.standard
//        let myToken = defaults.string(forKey: "responseToken")!
//        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        req.setValue("Bearer " + myToken, forHTTPHeaderField: "Authorization")
//
//
//        //APIを呼ぶよ
//        let task = session.dataTask(with: req){(data, response, error) in
//            //            print(data)
//            //            print(error)
//
//            let responseString: String =  String(data: data!, encoding: .utf8)!
//            print(responseString)
//
//
//            do {
//                let response: [String: Any] = try JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any]
//
//                print(response)
//
//                //取得したチャットIDを保存する
////                let defaults = UserDefaults.standard
////                defaults.set(indexRowDictionaryId, forKey: "chatroomId")
////                print("ユーザーデフォルトにチャットidを保存したよ")
////                print(defaults.string(forKey: "chatroomId")!)
//
//
//                //別の画面に遷移
//                DispatchQueue.main.async {
//                    let storyboard = UIStoryboard(name: "MainPageViewController", bundle: nil)
//                    let DateDetailScheduleViewController = storyboard.instantiateViewController(withIdentifier: "DateDetailScheduleViewController") as? DateDetailScheduleViewController
//                    if let DateDetailScheduleViewController = DateDetailScheduleViewController {
//                        DateDetailScheduleViewController.indexRowDictionaryId = indexRowDictionaryId //値を受け渡す
//                        self.navigationController?.pushViewController(DateDetailScheduleViewController, animated: true)
//                    }
//                    print("デート場所の詳しい情報を出す画面に遷移してるよー")
//
//                }
//
//            } catch{
//
//            }
//
//        }
//        task.resume()
        

