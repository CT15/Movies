//
//  MovieSection.swift
//  Movies
//
//  Created by Calvin Tantio on 6/6/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

struct MovieSection {

    let genre: MovieGenre
    var movies: [Movie]
    var moviesSet: Set<Movie> // to check for duplicates

    init(genre: MovieGenre, movies: [Movie]? = nil) {
        self.genre = genre

        self.movies = []
        self.moviesSet = Set()

        if let movies = movies {
            self.add(movies: movies)
        }
    }

    mutating func add(movies: Movie...) {
        add(movies: movies)
    }

    mutating func add(movies: [Movie]) {
        let toAdd = movies.filter {
            $0.genres.contains(genre)
        }

        toAdd.forEach {
            guard !moviesSet.contains($0) else {
                return
            }
            self.movies.append($0)
            self.moviesSet.insert($0)
        }
    }

}
