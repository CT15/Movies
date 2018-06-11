//
//  Movie.swift
//  Movies
//
//  Created by Calvin Tantio on 6/6/18.
//  Copyright © 2018 Calvin Tantio. All rights reserved.
//

struct Movies: Decodable {
    let movies: [Movie]
}

struct Movie: Decodable {

    let title: String
    let synopsis: String?
    let imageLink: String?
    let genres: [MovieGenre]

    init(title: String, synopsis: String? = nil, link: String? = nil, genres: [MovieGenre]) {
        self.title = title
        self.synopsis = synopsis
        self.imageLink = link

        self.genres = {
            var list = [MovieGenre]()

            genres.forEach {
                list.append($0)
            }

            return list
        }()
    }

    init(title: String, synopsis: String? = nil, link: String? = nil, genres: MovieGenre...) {
        self.init(title: title, synopsis: synopsis, link: link, genres: genres)
    }
    
}

extension Movie: Hashable {
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.title == rhs.title
                    && lhs.synopsis == rhs.synopsis
                    && lhs.imageLink == rhs.imageLink
                    && lhs.genres == rhs.genres
    }

    var hashValue: Int {
        return "\(title)\(String(describing: synopsis))\(imageLink ?? "nil")\(genres)".hashValue
    }
}
