//
//  MovieService.swift
//  JSONAPITutorial
//
//  Created by Scott P. Chow on 2/19/18.
//  Copyright © 2018 scottpchow. All rights reserved.
//

import Foundation

class MovieService {
    static let shared = MovieService()
    
    func getTopMovie(completion: @escaping (Movie?)->()) {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/movies/top-movies/all/25/explicit.json"
        if let url = URL(string: urlString) {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print(error)
                    DispatchQueue.main.async(execute: {
                        completion(nil)
                    })
                } else {
                    guard let data = data,
                        let json = try? JSONSerialization.jsonObject(with: data, options: []) else {
                            DispatchQueue.main.async(execute: {
                                completion(nil)
                            })
                            return
                    }
                    if let movie = Movie(json: json) {
                        DispatchQueue.main.async(execute: {
                            completion(movie)
                        })
                        return
                    }
                    DispatchQueue.main.async(execute: {
                        completion(nil)
                    })
                }
            }
            task.resume()
        }
    }
}
