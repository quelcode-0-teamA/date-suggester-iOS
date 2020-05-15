//
//  GetImageByUrl.swift
//  date-suggester-iOS
//
//  Created by saya on 2020/05/07.
//  Copyright © 2020 saya. All rights reserved.
//

import UIKit

class ChangeUrlToImage {
    static func getImageByUrl(url: String) -> UIImage{
        guard let url = URL(string: url) else {
        return UIImage()
        }
        do {
            let data = try Data(contentsOf: url)
            return UIImage(data: data)!
        } catch let err {
            print("Error : \(err.localizedDescription)")
        }
        return UIImage()
    }
}
