//
//  ViewController.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/04.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pickerView: UIPickerView!
    let yearList: [String] = ["1990","1991","1992","1993","1994"]
    let monthList: [String] = ["1","2","3"]
//    let monthList: [Int] = [1...12]
    let dayList: [String] = ["1","2","3"]
    //ここの配列を繰り返し処理とかにできますか？
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        UIDatePicker 
        // Delegate設定
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    // UIPickerViewの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    // UIPickerViewの行数、リストの数
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return yearList.count
        case 1:
            return monthList.count
        case 2:
            return dayList.count
        default:
            return 0
        }
    }
    
    // ドラムロールの各タイトル
      func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
          switch component {
          case 0:
              return yearList[row]
          case 1:
            return monthList[row]
//              return monthList[""] as? String
          case 2:
            return dayList[row]
          default:
              return "error"
          }
      }
    


}

