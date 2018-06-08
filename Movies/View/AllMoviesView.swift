//
//  MovieListView.swift
//  Movies
//
//  Created by Calvin Tantio on 6/6/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit

class AllMoviesView: UIView {

    private var topView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        return view
    }()

    private var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchBarStyle = .minimal
        (searchBar.value(forKey: "searchField") as? UITextField)?.textColor = .white
        return searchBar
    }()

    private var synopsisView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()

    private var sectionTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SectionTableCell.self, forCellReuseIdentifier: SectionTableCell.identifier)

        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.allowsSelection = false
        return tableView
    }()

    private var selectedMovieImage = MovieImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setTopView()
        setSynopsisView()
        setTableView()
        setSelectedMovieImage()
    }

    private func setTopView() {
        addSubview(topView)
        topView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        topView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15).isActive = true

        topView.addSubview(searchBar)
        searchBar.trailingAnchor.constraint(equalTo: topView.trailingAnchor, constant: -5).isActive = true
        searchBar.topAnchor.constraint(equalTo: topView.topAnchor, constant: 10).isActive = true
        searchBar.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.5).isActive = true
        searchBar.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }

    private func setSynopsisView() {
        addSubview(synopsisView)
        synopsisView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        synopsisView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        synopsisView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        synopsisView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.15).isActive = true
    }

    private func setTableView() {
        addSubview(sectionTableView)
        sectionTableView.topAnchor.constraint(equalTo: synopsisView.bottomAnchor).isActive = true
        sectionTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        sectionTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        sectionTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }

    private func setSelectedMovieImage() {
        addSubview(selectedMovieImage)
        selectedMovieImage.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        selectedMovieImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3, constant: -40).isActive = true
        selectedMovieImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        selectedMovieImage.widthAnchor.constraint(equalTo: selectedMovieImage.heightAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func setTableViewDataSourceDelegate <obj: UITableViewDataSource & UITableViewDelegate> (
        dataSourceDelegate: obj) {
        sectionTableView.dataSource = dataSourceDelegate
        sectionTableView.delegate = dataSourceDelegate
        sectionTableView.reloadData()
    }

}
