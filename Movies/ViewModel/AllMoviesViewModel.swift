//
//  MovieListingViewModel.swift
//  Movies
//
//  Created by Calvin Tantio on 6/6/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit

struct AllMoviesViewModel {
    let movieSection: [MovieSection]
    var movies: [[(title: String, image: UIImage?)]]

    var numberOfSections: Int {
        return movieSection.count
    }

    init(movieSection: MovieSection...) {
        self.init(movieSection: movieSection)
    }

    init(movieSection: [MovieSection]) {
        self.movieSection = movieSection
        movies = []

        movieSection.forEach {
            var value = [(title: String, image: UIImage?)]()

            $0.movies.forEach {
                value.append((title: $0.title,
                              image: UIImage(named: $0.imageLink ?? "")))
            }

            movies.append(value)
        }
    }

    func getNumberOfMoviesIn(section: Int) -> Int {
        return movieSection[section].movies.count
    }

    func getGenreforSection(section: Int) -> String {
        return movieSection[section].genre.rawValue.capitalized
    }

    func getMovieTitle(section: Int, row: Int) -> String {
        return movies[section][row].title
    }

    func getMovieImage(section: Int, row: Int) -> UIImage {
        return movies[section][row].image ?? UIImage() // TODO: give default picture
    }
}
