//
//  ServiceAPI.swift
//  Movs
//
//  Created by Leonardo Canhette on 04/01/20.
//  Copyright © 2019 Leonardo Canhette. All rights reserved.
//

protocol ServiceAPI {
    func fetchMovies(_ titleFiltering: String?, page: Int, completion: @escaping (Result<MovieInfo, Error>) -> Void)
}
