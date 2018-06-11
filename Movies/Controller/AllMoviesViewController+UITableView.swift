//
//  AllMoviesViewController+UITableView.swift
//  Movies
//
//  Created by Calvin Tantio on 7/6/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit

extension AllMoviesViewController: UITableViewDataSource, UITableViewDelegate {

    // MARK: - Table View Data Source methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfSections
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:
            SectionTableCell.identifier, for: indexPath) as? SectionTableCell else {
                fatalError("UITableViewCell must be downcasted to SectionTableCell")
        }

        return cell
    }

    // MARK: - Table View Delegate methods
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let sectionTableCell = cell as? SectionTableCell else { return }

        let sectionVM = viewModel.getMoviesSectionViewModel(at: indexPath.row)

        sectionTableCell.setGenreLabelText(sectionVM.genre)
        sectionTableCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, forRow: indexPath.row)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
