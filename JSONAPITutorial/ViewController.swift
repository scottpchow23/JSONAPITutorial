//
//  ViewController.swift
//  JSONAPITutorial
//
//  Created by Scott P. Chow on 2/19/18.
//  Copyright © 2018 scottpchow. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieCopyrightTextView: UITextView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        MovieService.shared.getTopMovie { (movie) in
            if let movie = movie {
                self.movieTitleLabel.text = movie.title
                self.movieCopyrightTextView.text = movie.copyright
                self.movieImageView.setImageWithURL(urlString: movie.imageURL)
            } else {
                print("something went wrong")
            }
        }
    }
}

