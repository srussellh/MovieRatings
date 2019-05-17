//
//  Movie.swift
//  MovieTime
//
//  Created by Bobba Kadush on 5/17/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

import Foundation

struct MovieTopLevel: Decodable {
    let results: [Movie]
}
struct Movie: Decodable{
    let title: String
   let rating: Double
    let summary: String
    let poster: String
    
    enum CodingKeys: String, CodingKey{
        case title = "original_title"
        case summary = "overview"
        case poster = "poster_path"
        case rating = "vote_average"
    }
}
