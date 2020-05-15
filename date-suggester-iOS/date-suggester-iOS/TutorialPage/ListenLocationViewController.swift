//
//  TutorialController3.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/06.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit
class ListenLocationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var userArea: UserArea?
    
    var activityIndicatorView = UIActivityIndicatorView()
    var userAreas = [UserArea]()
    var values = [String]()
    var areaId = [Int]()
    
    @IBOutlet weak var areaPickerView: UIPickerView!
    @IBOutlet weak var nextButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        AppNavigationController.shared.navigationSetUp()
    }
    
    private func setupView() {
        activityIndicatorView.center = view.center
        activityIndicatorView.style = .whiteLarge
        activityIndicatorView.color = .gray
        
        view.addSubview(activityIndicatorView)
        activityIndicatorView.startAnimating()
        
        areasList()
        
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
        
        //ユーザーがpickerViewを操作せずに次へボタンを押下した場合、
        //pickerViewがdefaultで選択中の値がsetされるようにしている
        UserDefaults.standard.setSelectedAreaId(id: 13)
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

                self.userAreas.removeAll()
                for responseArea in response {
                    let userArea = UserArea.init(areaData: responseArea)
                    self.userAreas.append(userArea)
                }
               
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
        return userAreas.count
    }
    
    // UIPickerViewに表示する配列
    //せるが順番に呼ばれるたびにでりげーとメソッドが呼ばれる。そのたびにrow
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        debugPrint(row)
        return userAreas[row].name
    }
    
    // UIPickerViewのRowが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
        //コンポーネントごとに現在選択されているデータを取得する。
        let selectedData = self.pickerView(pickerView, titleForRow: pickerView.selectedRow(inComponent: 0), forComponent: 0)
        debugPrint("\(String(describing: selectedData))えらばれたよ")
        
        let selectedAreaId = userAreas[row].id
        debugPrint(selectedAreaId)
        
        //選択されたエリアをユーザーデフォルトに保存
        UserDefaults.standard.setSelectedAreaId(id: selectedAreaId)
    }
    
    @IBAction func gotoSinplePlan(_ sender: Any) {
        
        let TempSignInParams = [
            "birth_year": UserDefaults.standard.getSelectedBirthYear(),
            "area_id": UserDefaults.standard.getSelectedAreaId()
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
