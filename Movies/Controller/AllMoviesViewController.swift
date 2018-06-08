//
//  MainViewController.swift
//  Seivom
//
//  Created by Calvin Tantio on 6/6/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit

class AllMoviesViewController: UIViewController {

    var moviesTable: UITableView!
    var viewModel: AllMoviesViewModel!

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // TODO: change these dummy values
        let movie10 = Movie(title: "Hi there0", genres: .romance)
        let movie11 = Movie(title: "Hi there1", genres: .romance)
        let movie12 = Movie(title: "Hi there2", genres: .romance)
        let movie13 = Movie(title: "Hi there3", genres: .romance)
        let movie14 = Movie(title: "Hi there4", genres: .romance)
        let movie15 = Movie(title: "Hi there5", genres: .romance)
        let movieSection1 = MovieSection(genre: .romance, movies: [movie10, movie11, movie12, movie13, movie14, movie15])
        let movie20 = Movie(title: "Hi0", genres: .action)
        let movie21 = Movie(title: "Hi1", genres: .action)
        let movie22 = Movie(title: "Hi2", genres: .action)
        let movie23 = Movie(title: "Hi3", genres: .action)
        let movie24 = Movie(title: "Hi4", genres: .action)
        var movieSection2 = MovieSection(genre: .action)
        movieSection2.add(movies: movie20, movie21, movie22, movie23, movie24)
        var movieSection3 = MovieSection(genre: .horror)
        let movie30 = Movie(title: "Hi0", genres: .horror)
        let movie31 = Movie(title: "Hi1", genres: .horror)
        let movie32 = Movie(title: "Hi2", genres: .horror)
        let movie33 = Movie(title: "Hi3", genres: .horror)
        let movie34 = Movie(title: "Hi4", genres: .horror)
        let movie35 = Movie(title: "Hi5", genres: .horror)
        let movie36 = Movie(title: "Hi6", genres: .horror)
        let movie37 = Movie(title: "Hi7", genres: .horror)
        movieSection3.add(movies: movie30, movie31, movie32, movie33, movie34, movie35, movie36, movie37)

        // viewModel must be initialised before view as table view in view requires view model
        viewModel = AllMoviesViewModel(movieSection: movieSection1, movieSection2, movieSection3)
        view = AllMoviesView()
        (view as! AllMoviesView).setTableViewDataSourceDelegate(dataSourceDelegate: self)
    }
}
