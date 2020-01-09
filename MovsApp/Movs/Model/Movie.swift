//
//  Movie.swift
//  Movs
//
//  Created by Leonardo Canhette on 04/01/20.
//  Copyright © 2019 Leonardo Canhette. All rights reserved.
//

struct Movie: Decodable {
    
    let id: Int
    let title: String?
    let overview: String?
    let nameImage: String?
    let posterPath: String?
    let releaseDate: String?
    let genreIds: [Int]?
    
    init(id: Int, title: String?, overview: String?, nameImage: String?, posterPath: String, releaseDate: String?, genresID: [Int]?){
        self.id = id
        self.title = title
        self.overview = overview
        self.nameImage = nameImage
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.genreIds = genresID
    }
        
    func getCompleteUrlPosterPath() -> String? {
        if let posterPath = posterPath {
            return R.string.apI.basePathUrlImage() + posterPath
        } else {
            return nil
        }        
    }
}

extension Movie {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case nameImage
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case genreIds = "genre_ids"
    }
}
