//
//  TutorialController3.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/06.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit
class ListenLocationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var activityIndicatorView = UIActivityIndicatorView()
    var values = [String]()
    var areaId = [Int]()
    var response: [[String: Any]]?
    
    @IBOutlet weak var areaPickerView: UIPickerView!
    @IBOutlet weak var nextButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicatorView.center = view.center
        activityIndicatorView.style = .whiteLarge
        activityIndicatorView.color = .gray

        view.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
        
        areasList()
                
        // ピッカー設定
        areaPickerView.delegate = self
        areaPickerView.dataSource = self
        areaPickerView.selectRow(30, inComponent: 0, animated: false)
        areaPickerView.layer.borderColor = UIColor(red: 0.86, green: 0.86, blue: 0.86, alpha: 1.0).cgColor
        
        navigationItem.hidesBackButton = true
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "NavBarBG"), for: .default)
        navigationItem.title = "Date Suggester"
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white
        ]
        
    }
    
    func areasList(){
        let config: URLSessionConfiguration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: config)

        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.date-suggester.com"
        urlComponents.path = "/v1/areas"
        urlComponents.queryItems = [
        ]
        
        let url: URL = urlComponents.url!
        var req: URLRequest = URLRequest(url: url)
        req.httpMethod = "GET"
        
        let task = session.dataTask(with: req){(data, response, error) in
            
            do {
                let response: [[String: Any]] = try JSONSerialization.jsonObject(with: data!, options: []) as! [[String: Any]]
                
                debugPrint(response)
                self.response = response
                var responseArea = self.response?[0]["id"] as? Int
                debugPrint("🍒\(responseArea)")
                self.values.removeAll()
                for value in response {
                    if let name = value["name"] as? String {
                        self.values.append(name)
                       debugPrint(name)
                    }
                }
                
                //デバッグ用
                self.areaId.removeAll()
                for areaid in response {
                    if let id = areaid["id"] as? Int{
                        self.areaId.append(id)
                        debugPrint(id)
                    }
                }
                
                debugPrint(self.values)
                debugPrint(self.areaId)
                
                DispatchQueue.main.async {
                    self.areaPickerView.reloadAllComponents()
                    // 非同期処理などが終了したらメインスレッドでアニメーション終了
                    self.activityIndicatorView.stopAnimating()
                }
            } catch{
            }
        }
        task.resume()
    }
    
    // UIPickerViewの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // UIPickerViewの行数、要素の全数
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return values.count
    }
    
    // UIPickerViewに表示する配列
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        return String(values[row])
    }
    
    // UIPickerViewのRowが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        //コンポーネントごとに現在選択されているデータを取得する。
        let data1 = self.pickerView(pickerView, titleForRow: pickerView.selectedRow(inComponent: 0), forComponent: 0)
        debugPrint("\(String(describing: data1))えらばれたよ")
        debugPrint("key: \(row)")
        debugPrint("row: \(row)")
        //選択されたエリアをユーザーデフォルトに保存
        let defaults = UserDefaults.standard
        defaults.set(row, forKey: "responseUserArea")
    }
    
    @IBAction func gotoSinplePlan(_ sender: Any) {
        let defaults = UserDefaults.standard
        guard let responseBirthYear = defaults.string(forKey: "responseBirthYear"),
            let responseUserArea = defaults.string(forKey: "responseUserArea")
            else{
                return
        }
        
        let TempSignInParams = [
            "birth_year": responseBirthYear,
            "area_id": responseUserArea
            ] as [String : Any]
        
        let parameter = ["temp_user": TempSignInParams]
        
        Api().tempSignUp(parameter: parameter, completion: {(token, id, error) in
            
            if error != nil {
                debugPrint("エラーがおこったよ")
                debugPrint(error)
                return
            }
            DispatchQueue.main.async {
                let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
                let controller = storyboard.instantiateViewController(identifier: "DatePlanViewController")
                controller.modalPresentationStyle = .fullScreen
                self.present(controller, animated: true, completion: nil)
            }
            
        })
    }
}
