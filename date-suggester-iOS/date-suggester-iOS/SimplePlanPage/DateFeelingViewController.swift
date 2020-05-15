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
    var activityIndicatorView = UIActivityIndicatorView()
    
    @IBOutlet weak var roundProgressBar: UIProgressView!
    @IBOutlet weak var unusualButton: CustomYerrowButton!
    @IBOutlet weak var relaxButton: CustomYerrowButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()

    }
    
    private func setupView() {
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
        
        activityIndicatorView.center = view.center
        activityIndicatorView.style = .whiteLarge
        activityIndicatorView.color = .darkGray
        view.addSubview(activityIndicatorView)
    }
    
    @IBAction func unusualButtonTap(_ sender: Any) {
        gotoDatePlanSuggestionVC(selectAnserNumber:0)
    }
    @IBAction func relaxButton(_ sender: Any) {
        gotoDatePlanSuggestionVC(selectAnserNumber:1)
    }
    
    private func gotoDatePlanSuggestionVC(selectAnserNumber: Int) {
        youserAnswer.answer4 = selectAnserNumber
        
        activityIndicatorView.startAnimating()
        
        /*
         デートプラン提案API
         */
        let config: URLSessionConfiguration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: config)

        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.date-suggester.com"
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
        
        let myToken = UserDefaults.standard.getResponseToken()
        
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        req.setValue("Bearer " + myToken, forHTTPHeaderField: "Authorization")

        let task = session.dataTask(with: req){(data, response, error) in
            
            if let _error = error {
                debugPrint(_error)
                // アラートを出す
                DispatchQueue.main.async {
                    self.view.isUserInteractionEnabled = true
                    self.activityIndicatorView.stopAnimating()
                    let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
                    alert.view.tintColor = UIColor.init(red: 254.0/255, green: 84.0/255, blue: 146.0/255, alpha: 1.0)
                    alert.title = "予期せぬエラーが発生しました"
                    alert.message = "もういちどやり直してみてください"
                    alert.addAction(
                        UIAlertAction(title: "悲しいです", style: .cancel, handler: nil)
                    )
                    self.present(alert,animated: true,completion: nil)
                }
                return
            }

            do {
                let response: [String: Any] = try (JSONSerialization.jsonObject(with: data!, options: []) as! [String: Any])
                if let errors = response["errors"] as? String {
                    DispatchQueue.main.async {
                        self.view.isUserInteractionEnabled = true
                        self.activityIndicatorView.stopAnimating()
                        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
                        alert.view.tintColor = UIColor.init(red: 254.0/255, green: 84.0/255, blue: 146.0/255, alpha: 1.0)
                        alert.title = errors
                        alert.message = "もういちどやり直してみてください"
                        alert.addAction(
                            UIAlertAction(title: "悲しいです", style: .cancel, handler: nil)
                        )
                        self.present(alert,animated: true,completion: nil)
                    }
                    return
                }

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
        debugPrint("デートプラン提案成功してるよ")
    }
}
