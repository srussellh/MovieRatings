//
//  MovieTableViewController.swift
//  MovieTime
//
//  Created by Bobba Kadush on 5/17/19.
//  Copyright © 2019 Bobba Kadush. All rights reserved.
//

import UIKit

class MovieTableViewController: UITableViewController {
    
    var movies: [Movie] = []
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieTableViewCell
        
        let movie = movies[indexPath.row]
        cell?.movies = movie
        
        MovieController.shared.fetchMoviePoster(movie: movie) { (image) in
            DispatchQueue.main.async {
                cell?.posterImage.image = image
            }
        }
        return cell ?? UITableViewCell()
    }
}

extension MovieTableViewController: UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else {return}
        MovieController.shared.fetchMovie(searchTerm: searchText) { (movie) in
            guard let movie = movie else {return}
            self.movies = movie
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
