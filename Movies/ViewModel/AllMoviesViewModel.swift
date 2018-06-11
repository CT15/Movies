//
//  MovieListingViewModel.swift
//  Movies
//
//  Created by Calvin Tantio on 6/6/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit

class AllMoviesViewModel {
    let apiService: APIServiceProtocol

    private var sections: [MovieSection] = [MovieSection]() {
        didSet {
            self.setMoviesSectionViewModels()
        }
    }

    var numberOfSections: Int {
        return sections.count
    }

    var moviesSectionViewModels: [MoviesSectionViewModel] = [MoviesSectionViewModel]() {
        didSet {
            self.reloadTableViewClosure?()
        }
    }

    var isLoading: Bool = false {
        didSet {
            self.updateLoadingStatus?()
        }
    }

    var alertMessage: String? {
        didSet {
            self.showAlertClosure?()
        }
    }

    var reloadTableViewClosure: (()->())?
    var updateLoadingStatus: (()->())?
    var showAlertClosure: (()->())?

    init(apiService: APIServiceProtocol = APIService()) {
        self.apiService = apiService
        initFetch()
    }

    func getMoviesSectionViewModel(at section: Int) -> MoviesSectionViewModel {
        return moviesSectionViewModels[section]
    }

    func initFetch() {
        self.isLoading = true
        apiService.fetchAllMovies { [weak self] (success, movies, error) in
            self?.isLoading = false
            if let error = error {
                self?.alertMessage = error.rawValue
            } else {
                self?.processFetchedMovies(movies: movies)
            }
        }
    }

    private func processFetchedMovies(movies: [Movie]) {
        var sectionDict = [MovieGenre: [Movie]]()

        movies.forEach { (movie) in
            movie.genres.forEach { (genre) in
                if sectionDict[genre] == nil {
                    sectionDict[genre] = []
                }

                sectionDict[genre]?.append(movie)
            }
        }

        var tempSections = [MovieSection]()

        sectionDict.keys.forEach {
            tempSections.append(MovieSection(genre: $0, movies: sectionDict[$0]))
        }

        self.sections = tempSections
    }

    private func setMoviesSectionViewModels() {
        var tempMoviesSectionViewModels = [MoviesSectionViewModel]()

        sections.forEach {
            tempMoviesSectionViewModels.append(createMoviesSectionViewModel($0))
        }

        self.moviesSectionViewModels = tempMoviesSectionViewModels
    }

    private func createMoviesSectionViewModel(_ section: MovieSection) -> MoviesSectionViewModel {
        return MoviesSectionViewModel(genre: section.genre.rawValue.capitalized, movies: section.movies)
    }
}
