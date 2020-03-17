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
    
    @IBOutlet weak var roundProgressBar: UIProgressView!
    @IBOutlet weak var mealButton: UIButton!
    @IBOutlet weak var outDoorButton: UIButton!
    @IBOutlet weak var relaxButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mealButton.layer.cornerRadius = 5
        outDoorButton.layer.cornerRadius = 5
        relaxButton.layer.cornerRadius = 5
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title:  "戻る",
            style:  .plain,
            target: nil,
            action: nil
        )
        
        roundProgressBar.transform = roundProgressBar.transform.scaledBy(x: 1, y: 2)
        roundProgressBar.layer.cornerRadius = 4
        roundProgressBar.clipsToBounds = true
        roundProgressBar.layer.sublayers![1].cornerRadius = 4
        roundProgressBar.subviews[1].clipsToBounds = true
    }
    
    @IBAction func mealButtonTap(_ sender: Any) {
        gotoDatePlanSuggestionVC(selectAnserNumber:0)
    }
    
    @IBAction func outDoorButton(_ sender: Any) {
        gotoDatePlanSuggestionVC(selectAnserNumber:1)
    }
    
    @IBAction func relaxButton(_ sender: Any) {
        gotoDatePlanSuggestionVC(selectAnserNumber:2)
    }
    
    private func gotoDatePlanSuggestionVC(selectAnserNumber: Int) {
        youserAnswer.answer4 = selectAnserNumber
        
        /*
         デートプラン提案API
         */
        let config: URLSessionConfiguration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: config)
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api-date-suggester-dev.herokuapp.com"
        urlComponents.path = "/v1/plans/suggest"
        urlComponents.queryItems = [
            URLQueryItem(name: "date_area", value: String(youserAnswer.answer1)),
            URLQueryItem(name: "date_budget", value: String(youserAnswer.answer2)),
            URLQueryItem(name: "date_time", value: String(youserAnswer.answer3)),
            URLQueryItem(name: "date_type", value: String(youserAnswer.answer4))
        ]
        
        let url: URL = urlComponents.url!
        var req: URLRequest = URLRequest(url: url)
        req.httpMethod = "GET"
        
        let defaults = UserDefaults.standard
        let myToken = defaults.string(forKey: "responseToken")!
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        req.setValue("Bearer " + myToken, forHTTPHeaderField: "Authorization")
        
        let task = session.dataTask(with: req){(data, response, error) in
            
            do {
                let response: [String: Any] = try (JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any])
                
                print(response)
                DispatchQueue.main.async {
                    let storyboard = UIStoryboard(name: "SimplePlanViewController", bundle: nil)
                    guard let datePlanSuggestionViewControlller = storyboard.instantiateViewController(withIdentifier: "DatePlanSuggestionViewControlller") as? DatePlanSuggestionViewControlller else {
                        return
                    }
                    datePlanSuggestionViewControlller.suggetsPlan = Plan(planDicitionary: response)
                    self.present(datePlanSuggestionViewControlller, animated: true, completion: nil)
                }
            } catch{
            }
        }
        task.resume()
        print("デートプラン提案成功してるよ")
        /* デートプラン提案API省略形 */
    }
}
