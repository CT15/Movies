//
//  SectionTableCell.swift
//  Movies
//
//  Created by Calvin Tantio on 7/6/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit

class SectionTableCell: UITableViewCell {

    public static let identifier = "section-cell"

    private var genreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 30)
        return label
    }()
    
    private var moviesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false

        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.identifier)
        return collectionView
    }()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLabel()
        setCollectionView()
    }

    private func setLabel() {
        addSubview(genreLabel)
        genreLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        genreLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        genreLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        genreLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    }

    private func setCollectionView() {
        addSubview(moviesCollectionView)
        moviesCollectionView.topAnchor.constraint(equalTo: genreLabel.bottomAnchor).isActive = true
        moviesCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        moviesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        moviesCollectionView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func setGenreLabelText(_ text: String?) {
        genreLabel.text = text
    }

    func setCollectionViewDataSourceDelegate <obj: UICollectionViewDataSource & UICollectionViewDelegate> (
        dataSourceDelegate: obj, forRow row: Int) {
        moviesCollectionView.dataSource = dataSourceDelegate
        moviesCollectionView.delegate = dataSourceDelegate
        moviesCollectionView.tag = row
        moviesCollectionView.reloadData()
    }
}
