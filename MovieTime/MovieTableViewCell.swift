//
//  MovieTableViewCell.swift
//  MovieTime
//
//  Created by Bobba Kadush on 5/17/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    var movies: Movie? {
        didSet{
            updateView()
        }
    }
    
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    
    func updateView(){
        guard let movies = movies else {return}
        titleLabel.text = movies.title
        summaryLabel.text = movies.summary
        ratingLabel.text = "\(movies.rating)"
        
    }
    
}
