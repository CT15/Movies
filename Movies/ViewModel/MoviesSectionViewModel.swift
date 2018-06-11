//
//  MoviesSectionViewModel.swift
//  Movies
//
//  Created by Calvin Tantio on 11/6/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

class MoviesSectionViewModel {
    let genre: String
    private var movies: [Movie]? {
        didSet {
            self.setMovieCellViewModels()
        }
    }

    var numberOfMovies: Int {
        return movies?.count ?? 0
    }

    var movieCellViewModels: [MovieCellViewModel] = [MovieCellViewModel]() {
        didSet {
            self.reloadMovieCellViewModel?()
        }
    }

    var reloadMovieCellViewModel: (()->())?

    // init is required because self.movies is declared as private
    init(genre: String, movies: [Movie]?) {
        self.genre = genre
        self.movies = movies
        setMovieCellViewModels()
    }

    private func setMovieCellViewModels() {
        var tempMovieCellViewModels = [MovieCellViewModel]()

        movies?.forEach {
            tempMovieCellViewModels.append(createMovieCellViewModel($0))
        }

        movieCellViewModels = tempMovieCellViewModels
    }

    private func createMovieCellViewModel(_ movie: Movie) -> MovieCellViewModel {
        return MovieCellViewModel(imageLink: movie.imageLink ?? "", title: movie.title)
    }

    func getMovieCellViewModel(at section: Int) -> MovieCellViewModel {
        return movieCellViewModels[section]
    }
}
