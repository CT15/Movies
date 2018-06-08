//
//  MovieImageView.swift
//  Movies
//
//  Created by Calvin Tantio on 8/6/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit

class MovieImageView: UIImageView {

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        backgroundColor = .blue   // TODO: to change
        translatesAutoresizingMaskIntoConstraints = false

        layer.cornerRadius = 10.0
        layer.shadowOffset = CGSize(width: -2, height: 2)
        layer.shadowOpacity = 0.5
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
