//
//  APIService.swift
//  Movies
//
//  Created by Calvin Tantio on 11/6/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

import UIKit

enum APIError: String, Error {
    case noNetwork = "No Network"
    case serverOverload = "Server is overloaded"
    case permissionDenied = "You don't have permission"
}

protocol APIServiceProtocol {
    func fetchAllMovies( complete: @escaping ( _ success: Bool, _ movies: [Movie],
        _ error: APIError? )->() )
}

class APIService: APIServiceProtocol {
    // Simulate a long waiting for fetching
    func fetchAllMovies( complete: @escaping ( _ success: Bool, _ movies: [Movie], _ error: APIError? )->() ) {
        DispatchQueue.global().async {
            sleep(3)
            let path = Bundle.main.path(forResource: "all_movies", ofType: "json")!
            let data = try! Data(contentsOf: URL(fileURLWithPath: path))
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let movies = try! decoder.decode(Movies.self, from: data)
            complete(true, movies.movies, nil)
        }
    }
}
