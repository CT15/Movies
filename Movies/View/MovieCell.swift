//
//  MovieCellCollectionViewCell.swift
//  Movies
//
//  Created by Calvin Tantio on 7/6/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    public static let identifier = "movie-cell"

    private var movieImage: UIImageView = MovieImageView()
    
    private var movieTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setImageView()
        setLabel()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func setImageView() {
        addSubview(movieImage)
        movieImage.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        movieImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        movieImage.widthAnchor.constraint(equalTo: widthAnchor, constant: -10).isActive = true
        movieImage.heightAnchor.constraint(equalTo: widthAnchor, constant: -10).isActive = true
    }

    private func setLabel() {
        addSubview(movieTitle)
        movieTitle.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 10).isActive = true
        movieTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        movieTitle.widthAnchor.constraint(equalTo: widthAnchor, constant: -10).isActive = true
        movieTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
    }

    func setMovieTitle(_ title: String, withImage image: UIImage? = nil) {
        movieTitle.text = title
        movieImage.image = image
    }
}
