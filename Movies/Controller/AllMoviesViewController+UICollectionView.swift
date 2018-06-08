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
        return viewModel.getNumberOfMoviesIn(section: collectionView.tag)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.identifier,
                                                            for: indexPath) as? MovieCell else {
                                                                fatalError("UICollectionViewCell must be downcasted to MovieCell")
        }

        let section = collectionView.tag
        let row = indexPath.row

        cell.setMovieTitle(viewModel.getMovieTitle(section: section, row: row),
                           withImage: viewModel.getMovieImage(section: section, row: row))

        return cell
    }

    // MARK: - Collection View Delegate Flow Layout methods
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 250)
    }

}
