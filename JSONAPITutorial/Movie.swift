//
//  Movie.swift
//  JSONAPITutorial
//
//  Created by Scott P. Chow on 2/19/18.
//  Copyright © 2018 scottpchow. All rights reserved.
//

import Foundation


class Movie {
    var title: String
    var copyright: String
    var imageURL: String
    
    init() {
        title = ""
        copyright = ""
        imageURL = ""
    }
    
    init?(json: Any) {
        guard let jsonDict = json as? [String : Any],
            let feedJSONArray = jsonDict["feed"] as? [String : Any],
            let resultsJSONArray = feedJSONArray["results"] as? [[String : Any]] else {
                return nil
        }
        let movieJSONDict = resultsJSONArray[0]
        guard let title = movieJSONDict["name"] as? String,
            let copyright = movieJSONDict["copyright"] as? String,
            let imageURL = movieJSONDict["artworkUrl100"] as? String else {
                return nil
        }
        self.title = title
        self.copyright = copyright
        self.imageURL = imageURL
    }
}
