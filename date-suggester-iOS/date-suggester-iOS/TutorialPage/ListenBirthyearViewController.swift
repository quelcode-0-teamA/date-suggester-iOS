//
//  TutorialViewController2.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/06.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class ListenBirthyearViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
     // UIPickerViewの列の数
           func numberOfComponents(in pickerView: UIPickerView) -> Int {
               return 1
           }
            
           // UIPickerViewの行数、要素の全数
           func pickerView(_ pickerView: UIPickerView,
                           numberOfRowsInComponent component: Int) -> Int {
               return years.count
           }
            
           // UIPickerViewに表示する配列
           func pickerView(_ pickerView: UIPickerView,
                           titleForRow row: Int,
                           forComponent component: Int) -> String? {
               
               return String(years[row])
           }
            
           // UIPickerViewのRowが選択された時の挙動
           func pickerView(_ pickerView: UIPickerView,
                           didSelectRow row: Int,
                           inComponent component: Int) {
               // 処理
            //コンポーネントごとに現在選択されているデータを取得する。
            let data1 = self.pickerView(pickerView, titleForRow: pickerView.selectedRow(inComponent: 0), forComponent: 0)
            print("\(data1)えらばれたよ")
            print("row: \(row)")
            
            //選択された生まれ年をユーザーデフォルトに保存
            let defaults = UserDefaults.standard
            defaults.set(data1, forKey: "responseBirthYear")
           }
    
    

    let years = (1965...2020).map { $0 }

    @IBOutlet weak var yearPickerView: UIPickerView!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBAction func nextPage(_ sender: Any) {
        //画面遷移
        let storyboard = UIStoryboard(name: "TutorialViewController", bundle: nil)
        let listenLocationViewController = storyboard.instantiateViewController(withIdentifier: "ListenLocationViewController")
        listenLocationViewController.modalPresentationStyle = .fullScreen
        self.present(listenLocationViewController, animated: false, completion: nil)
    }
    
    @IBAction func loginButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "MainPageViewController", bundle: nil)
        let LoginViewController = storyboard.instantiateViewController(identifier: "LoginViewController")
        LoginViewController.modalPresentationStyle = .fullScreen
        present(LoginViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addBackground(name: "Full")
        self.nextButton.layer.cornerRadius = 5

        // ピッカー設定
        self.yearPickerView.delegate = self
        self.yearPickerView.dataSource = self
        
        yearPickerView.selectRow(30, inComponent: 0, animated: false)
        yearPickerView.layer.borderColor = UIColor(red: 0.86, green: 0.86, blue: 0.86, alpha: 1.0).cgColor
        
        //外枠の色を指定
        self.nextButton.layer.borderColor = UIColor.white.cgColor
        //外枠の太さを指定
        self.nextButton.layer.borderWidth = 1.0
       
    }
    
    
}




