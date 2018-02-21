//
//  UIImageView+SetURLImage.swift
//  JSONAPITutorial
//
//  Created by Scott P. Chow on 2/19/18.
//  Copyright © 2018 scottpchow. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func setImageWithURL(urlString: String) {
        if let url = URL(string:urlString) {
            let imageTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    if let data = data {
                        if let image = UIImage(data: data) {
                            DispatchQueue.main.async(execute: {
                                self.image = image
                            })
                        } else {
                            print("no image from data")
                        }
                    }
                }
            }
            imageTask.resume()
        }
    }
}
