//
//  SimplePlanViewController4.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/02/06.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class DateFeelingViewController: UIViewController {
    var youserAnswer: AnswerModel = .init()
    
    @IBOutlet weak var RoundProgressBar: UIProgressView!
    @IBOutlet weak var mealButton: UIButton!
    @IBOutlet weak var outDoorButton: UIButton!
    @IBOutlet weak var relaxButton: UIButton!
    
//    api.request(parameters:answers)
    
    
    @IBAction func mealButtonTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        let DatePlanSuggestionViewControlller = storyboard.instantiateViewController(withIdentifier: "DatePlanSuggestionViewControlller")
        DatePlanSuggestionViewControlller.modalPresentationStyle = .fullScreen
        present(DatePlanSuggestionViewControlller, animated: true, completion: nil)
    }
    
    @IBAction func outDoorButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
        let DatePlanSuggestionViewControlller = storyboard.instantiateViewController(withIdentifier: "DatePlanSuggestionViewControlller")
        DatePlanSuggestionViewControlller.modalPresentationStyle = .fullScreen
        present(DatePlanSuggestionViewControlller, animated: true, completion: nil)
    }
    @IBAction func relaxButton(_ sender: Any) {
        gotoDatePlanSuggestionVC(selectAnserNumber:0)
    }
    
    private func gotoDatePlanSuggestionVC(selectAnserNumber: Int) {
        youserAnswer.answer4 = selectAnserNumber
        
        /* デートプラン提案API */
               let config: URLSessionConfiguration = URLSessionConfiguration.default
               let session: URLSession = URLSession(configuration: config)

               //URLを組み立てている
               var urlComponents = URLComponents()
               urlComponents.scheme = "https"
               urlComponents.host = "api-date-suggester-dev.herokuapp.com"
               urlComponents.path = "/v1/date-suggest"
               urlComponents.queryItems = [
//                URLQueryItem(name: "user_area", value: String(1)),
                URLQueryItem(name: "date_area", value: String(youserAnswer.answer1)),
                URLQueryItem(name: "date_budget", value: String(youserAnswer.answer2)),
                URLQueryItem(name: "date_time", value: String(youserAnswer.answer3)),
                URLQueryItem(name: "date_type", value: String(youserAnswer.answer4))
               ]
               
               let url: URL = urlComponents.url!
               var req: URLRequest = URLRequest(url: url)
               req.httpMethod = "GET"
               
               
               print(url)
               
               //ヘッダーを付与
               let defaults = UserDefaults.standard
               let myToken = defaults.string(forKey: "responseToken")!
               req.setValue("application/json", forHTTPHeaderField: "Content-Type")
               req.setValue("Bearer " + myToken, forHTTPHeaderField: "Authorization")
               
               
               //APIを呼ぶよ
               let task = session.dataTask(with: req){(data, response, error) in
                   
                   do {
                    let response: [String: Any] = try (JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any])
                       
                       print(response)
                    DispatchQueue.main.async {
                        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
                        guard let datePlanSuggestionViewControlller = storyboard.instantiateViewController(withIdentifier: "DatePlanSuggestionViewControlller") as? DatePlanSuggestionViewControlller else {
                            return
                        }
                        datePlanSuggestionViewControlller.response = response
                        self.present(datePlanSuggestionViewControlller, animated: true, completion: nil)
                        
                        
//                        let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
//                        let DatePlanSuggestionViewControlller = storyboard.instantiateViewController(withIdentifier: "DatePlanSuggestionViewControlller")
//                        DatePlanSuggestionViewControlller.modalPresentationStyle = .fullScreen
//                        self.present(DatePlanSuggestionViewControlller, animated: true, completion: nil)
                    
   
                    }

                   } catch{
                       
                   }
                   
               }
               task.resume()
        print("デートプラン提案成功してるよ")
        
//        datePlanSuggestionViewControlller.youserAnswer = youserAnswer
//        print(youserAnswer.answer3)
//        self.navigationController?.pushViewController(datePlanSuggestionViewControlller, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.mealButton.layer.cornerRadius = 5
        self.outDoorButton.layer.cornerRadius = 5
        self.relaxButton.layer.cornerRadius = 5
        
        RoundProgressBar.transform = RoundProgressBar.transform.scaledBy(x: 1, y: 2)
        RoundProgressBar.layer.cornerRadius = 4
        RoundProgressBar.clipsToBounds = true
        RoundProgressBar.layer.sublayers![1].cornerRadius = 4
        RoundProgressBar.subviews[1].clipsToBounds = true
        
    }
}
