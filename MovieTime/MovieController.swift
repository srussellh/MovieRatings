//
//  MovieController.swift
//  MovieTime
//
//  Created by Bobba Kadush on 5/17/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

import UIKit

class MovieController{
    
    static let shared = MovieController()
    let baseURL = "https://api.themoviedb.org/3/"
    
    func fetchMovie(searchTerm: String, completion: @escaping(([Movie]?) -> Void)){
        var urlComponents = URLComponents(string: baseURL)
        let apiKeyQuery = URLQueryItem(name: "api_key", value: "a2b8ae96b72994a4bdf8d09329899396")
        let searchQuery = URLQueryItem(name: "query", value: searchTerm)
        urlComponents?.queryItems = [apiKeyQuery, searchQuery]
        guard let finalURL = urlComponents?.url?.appendingPathComponent("search").appendingPathComponent("movie") else {return}
        print(finalURL)
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("🚷🚷🚷🚷🚷🚷🚷🚷🚷🚷🚷🚷There was an error with the URLSession: \(error.localizedDescription)")
                return
            }
            guard let data = data else {
                print("Check that data SON!!🚷🚷🚷🚷🚷🚷🚷🚷")
                return
            }
            do{
                let topLevel = try JSONDecoder().decode(MovieTopLevel.self, from: data)
                let movie = topLevel.results
                completion(movie)
            }catch{
                print("🚷🚷🚷🚷🚷🚷🚷I've seen better hands on a clock: \(error.localizedDescription)")
                return
            }
            }.resume()
    }
    
    func fetchMoviePoster(movie: Movie, completion: @escaping(UIImage?) -> Void){
        let baseURL = URL(string: "https://image.tmdb.org/t/p/")
        let url = baseURL?.appendingPathComponent("w500").appendingPathComponent(movie.poster)
        guard let finalURL = url else {return}
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("You Best Check the mirror for that image: \(error.localizedDescription)")
                return
            }
            guard let data = data else {return}
            let image = UIImage(data: data)
            completion(image)
            }.resume()
    }
}
