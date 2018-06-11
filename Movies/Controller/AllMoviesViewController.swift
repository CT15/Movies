//
//  MainViewController.swift
//  Seivom
//
//  Created by Calvin Tantio on 6/6/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit

class AllMoviesViewController: UIViewController {

    var viewModel: AllMoviesViewModel!

    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        return activityIndicator
    }()

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        activityIndicator.center = view.center

        initViewModel()
        initView()
    }

    private func initView() {
        view = AllMoviesView()
        (view as! AllMoviesView).setTableViewDataSourceDelegate(dataSourceDelegate: self)
    }

    private func initViewModel() {
        viewModel = AllMoviesViewModel()

        viewModel.reloadTableViewClosure = {
            DispatchQueue.main.async { [weak self] in
                (self?.view as! AllMoviesView).sectionTableView.reloadData()
            }
        }

        viewModel.updateLoadingStatus = { [weak self] () in
            DispatchQueue.main.async {
                let isLoading = self?.viewModel.isLoading ?? false
                if isLoading {
                    self?.activityIndicator.startAnimating()
                    UIView.animate(withDuration: 0.2, animations: {
                        (self?.view as! AllMoviesView).sectionTableView.alpha = 0.0
                    })
                }else {
                    self?.activityIndicator.stopAnimating()
                    UIView.animate(withDuration: 0.2, animations: {
                        (self?.view as! AllMoviesView).sectionTableView.alpha = 1.0
                    })
                }
            }

        }

        viewModel.showAlertClosure = { [weak self] in
            DispatchQueue.main.async {
                if let message = self?.viewModel.alertMessage {
                    self?.showAlert(message)
                }
            }
        }
    }

    private func showAlert(_ message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction( UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
