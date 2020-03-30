//
//  TutorialViewController2.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/06.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class ListenBirthyearViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var yearPickerView: UIPickerView!
    @IBOutlet weak var nextButton: UIButton!
    
    let years = (1965...2005).map { $0 }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addBackground(name: "Full")
        nextButton.layer.cornerRadius = 30
        nextButton.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
        nextButton.layer.shadowColor = UIColor.init(red: 217.0/255, green: 196.0/255, blue: 125.0/255, alpha: 1.0).cgColor
        nextButton.layer.shadowOpacity = 1.0
        nextButton.layer.shadowRadius = 0
        
        // ピッカー設定
        yearPickerView.delegate = self
        yearPickerView.dataSource = self
        
        yearPickerView.selectRow(30, inComponent: 0, animated: false)
        yearPickerView.layer.borderColor = UIColor(red: 0.86, green: 0.86, blue: 0.86, alpha: 1.0).cgColor
        
//        nextButton.layer.borderColor = UIColor.white.cgColor
//        nextButton.layer.borderWidth = 1.0
    }

    @IBAction func nextPage(_ sender: Any) {
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
        let data1 = self.pickerView(pickerView, titleForRow: pickerView.selectedRow(inComponent: 0), forComponent: 0)
        print("\(data1)えらばれたよ")
        print("row: \(row)")
        
        let defaults = UserDefaults.standard
        defaults.set(data1, forKey: "responseBirthYear")
    }
}
