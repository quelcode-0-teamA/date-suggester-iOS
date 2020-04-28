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
        
        // ピッカー設定
        yearPickerView.delegate = self
        yearPickerView.dataSource = self
        
        yearPickerView.selectRow(30, inComponent: 0, animated: false)
        yearPickerView.layer.borderColor = UIColor(red: 0.86, green: 0.86, blue: 0.86, alpha: 1.0).cgColor
        
        navigationItem.hidesBackButton = true
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "NavBarBG"), for: .default)
        navigationItem.title = "Date Suggester"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.backBarButtonItem = UIBarButtonItem(title:  "", style:  .plain, target: nil, action: nil)
        
        let defaults = UserDefaults.standard
        defaults.set(1995, forKey: "responseBirthYear")
    }

    @IBAction func nextPage(_ sender: Any) {
        let storyboard = UIStoryboard(name: "TutorialViewController", bundle: nil)
        let listenLocationViewController = storyboard.instantiateViewController(withIdentifier: "ListenLocationViewController")
        self.navigationController?.pushViewController(listenLocationViewController, animated: true)
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
        debugPrint("\(data1)えらばれたよ")
        debugPrint("row: \(row)")
        
        let defaults = UserDefaults.standard
        defaults.set(data1, forKey: "responseBirthYear")
    }
}
