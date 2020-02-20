//
//  TutorialController3.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/06.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit
class ListenLocationViewController: UIViewController, UITextFieldDelegate {
    let underline: UIView = UIView()
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var nickName: CustomTextField!
    
    @IBAction func gotoSinplePlan(_ sender: Any) {
        
        //チュートリアル終了状況をユーザーデフォルトに保存
        // let defaults = UserDefaults.standard
        // defaults.set(true, forKey: "tutorialStatus")
        
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: "DatePlanViewController")
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addBackground(
            name: "Full")
        self.nextButton.layer.cornerRadius = 5
        
        nickName.delegate = self
        
        //外枠の色を指定
        self.nextButton.layer.borderColor = UIColor.white.cgColor
        //外枠の太さを指定
        self.nextButton.layer.borderWidth = 1.0
    }
    
    //キーボードを閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

class CustomTextField: UITextField {

    // 下線用のUIViewを作っておく
    let underline: UIView = UIView()

    override func layoutSubviews() {
        super.layoutSubviews()

        self.frame.size.height = 50 // ここ変える
        

        composeUnderline() // 下線のスタイルセットおよび追加処理
        self.borderStyle = .none
    }

    private func composeUnderline() {
        self.underline.frame = CGRect(
            x: 0,                    // x, yの位置指定は親要素,
            y: self.frame.height,    // この場合はCustomTextFieldを基準にする
            width: self.frame.width,
            height: 2.5)

        self.underline.backgroundColor = UIColor(red:188, green:188, blue:188, alpha:1.0)

        self.addSubview(self.underline)
        self.bringSubviewToFront(self.underline)
    }
}
