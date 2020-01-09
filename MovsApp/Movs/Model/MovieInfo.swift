//
//  MovieInfo.swift
//  Movs
//
//  Created by Leonardo Canhette on 07/01/20.
//  Copyright © 2019 Leonardo Canhette. All rights reserved.
//

struct MovieInfo: Decodable {    
    let page: Int
    let totalResults: Int
    let totalPages: Int
    let results: [Movie]
    
    init(page: Int, totalResults: Int, totalPages: Int, results: [Movie]) {
        self.page = page
        self.totalResults = totalResults
        self.totalPages = totalPages
        self.results = results
    }
}

extension MovieInfo {
    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"        
        case results
    }
}


