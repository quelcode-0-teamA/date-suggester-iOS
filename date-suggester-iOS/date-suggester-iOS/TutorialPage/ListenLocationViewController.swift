//
//  TutorialController3.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/06.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit
class ListenLocationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var values = [String]()
    var response: [[String: Any]]?
    let area:[String] = ["新宿", "渋谷", "東京駅", "代官山", "中目黒"]
    
//    let underline: UIView = UIView()
//    let years = (1965...2020).map { $0 }
    @IBOutlet weak var areaPickerView: UIPickerView!
    @IBOutlet weak var nextButton: UIButton!

    
          // UIPickerViewの列の数
          func numberOfComponents(in pickerView: UIPickerView) -> Int {
                 return 1
            }
//          // UIPickerViewの行数、要素の全数
          func pickerView(_ pickerView: UIPickerView,
                          numberOfRowsInComponent component: Int) -> Int {
                 return values.count
            }
//
//          // UIPickerViewに表示する配列
          func pickerView(_ pickerView: UIPickerView,
                          titleForRow row: Int,
                          forComponent component: Int) -> String? {
            return String(values[row])
        }
//
//
          // UIPickerViewのRowが選択された時の挙動
          func pickerView(_ pickerView: UIPickerView,
                          didSelectRow row: Int,
                          inComponent component: Int) {
              // 処理
           //コンポーネントごとに現在選択されているデータを取得する。
           let data1 = self.pickerView(pickerView, titleForRow: pickerView.selectedRow(inComponent: 0), forComponent: 0)
           print("\(data1)えらばれたよ")
           print("row: \(row)")
            

          }


    
    
    @IBAction func gotoSinplePlan(_ sender: Any) {
        let defaults = UserDefaults.standard
        let responseBirthYear = defaults.string(forKey: "responseBirthYear")!
//        var userArea = row
        
        //その変数たちを集めた変数をつくって、それをJSON形式でボディに付与する（1つめの辞書）
        let TempSignInParams = [
            "birth_year": responseBirthYear,
            "area_id": 1
            ] as [String : Any]
        
        let parameter = ["temp_user": TempSignInParams]
        
        Api().tempLogin(parameter: parameter, completion: {(token, error) in
            
            if let _error = error {
                // アラートを出す
                return
            }
            
//            guard let _token = token else {
//                // アラートを出す
//                return
//            }
//

            
            DispatchQueue.main.async {
                
                // チュートリアル終了状況をユーザーデフォルトに保存
                let defaults = UserDefaults.standard
                defaults.set(true, forKey: "tutorialStatus")
                
                let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
                let controller = storyboard.instantiateViewController(identifier: "DatePlanViewController")
                controller.modalPresentationStyle = .fullScreen
                self.present(controller, animated: true, completion: nil)
                //                let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
                //                let controller = storyboard.instantiateViewController(identifier: "DatePlanViewController")
                //                controller.modalPresentationStyle = .fullScreen
                //                self.present(controller, animated: true, completion: nil)
            }
            
            
            
        })
        
        
        
        
        //キーボードを閉じる
//        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//            textField.resignFirstResponder()
//            return true
//        }
//
//        func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//            self.view.endEditing(true)
//        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        a()
                
        // ピッカー設定
        
        self.areaPickerView.delegate = self
        self.areaPickerView.dataSource = self
        areaPickerView.selectRow(30, inComponent: 0, animated: false)
        areaPickerView.layer.borderColor = UIColor(red: 0.86, green: 0.86, blue: 0.86, alpha: 1.0).cgColor
        
        self.view.addBackground(
            name: "Full")
        self.nextButton.layer.cornerRadius = 5
        
        //外枠の色を指定
        self.nextButton.layer.borderColor = UIColor.white.cgColor
        //外枠の太さを指定
        self.nextButton.layer.borderWidth = 1.0
    }
    
    func a(){
    let config: URLSessionConfiguration = URLSessionConfiguration.default
    let session: URLSession = URLSession(configuration: config)

    var urlComponents = URLComponents()
    urlComponents.scheme = "https"
    urlComponents.host = "api-date-suggester-dev.herokuapp.com"
    urlComponents.path = "/v1/areas"
    urlComponents.queryItems = [
    ]

    let url: URL = urlComponents.url!
    var req: URLRequest = URLRequest(url: url)
    req.httpMethod = "GET"

    print(url)

    //APIを呼ぶよ
    let task = session.dataTask(with: req){(data, response, error) in

        do {
            let response: [[String: Any]] = try JSONSerialization.jsonObject(with: data!, options: []) as! [[String: Any]]

            print(response)
            self.response = response
            self.values.removeAll()
            for value in response {
                if let name = value["name"] as? String {
                 self.values.append(name)
                    print(name)
                }
            }
            print(self.values)
            
            DispatchQueue.main.async {
                self.areaPickerView.reloadAllComponents()
            }
            





        } catch{

        }

    }

    task.resume()
    }
}
    
    
//    class CustomTextField: UITextField {
//
//        // 下線用のUIViewを作っておく
//        let underline: UIView = UIView()
//
//        override func layoutSubviews() {
//            super.layoutSubviews()
//
//            self.frame.size.height = 50 // ここ変える
//
//
//            composeUnderline() // 下線のスタイルセットおよび追加処理
//            self.borderStyle = .none
//        }
//
//        private func composeUnderline() {
//            self.underline.frame = CGRect(
//                x: 0,                    // x, yの位置指定は親要素,
//                y: self.frame.height,    // この場合はCustomTextFieldを基準にする
//                width: self.frame.width,
//                height: 2.5)
//
//            self.underline.backgroundColor = UIColor(red:188, green:188, blue:188, alpha:1.0)
//
//            self.addSubview(self.underline)
//            self.bringSubviewToFront(self.underline)
//        }
//}

