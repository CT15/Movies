//
//  AllMoviesViewController+UICollectionView.swift
//  Movies
//
//  Created by Calvin Tantio on 7/6/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit

extension AllMoviesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // MARK: - Collection View Data Source methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionVM = viewModel.getMoviesSectionViewModel(at: collectionView.tag)
        return sectionVM.numberOfMovies
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
            MovieCell.identifier, for: indexPath) as? MovieCell else {
                fatalError("UICollectionViewCell must be downcasted to MovieCell")
        }

        let sectionVM = viewModel.getMoviesSectionViewModel(at: collectionView.tag)
        let movieCellVM = sectionVM.getMovieCellViewModel(at: indexPath.row)

        cell.setMovieTitle(movieCellVM.title,
                           withImage: UIImage(named: movieCellVM.imageLink))

        return cell
    }

    // MARK: - Collection View Delegate Flow Layout methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 200)
    }

}
