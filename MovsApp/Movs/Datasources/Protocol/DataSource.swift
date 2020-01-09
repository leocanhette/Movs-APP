//
//  DataSource.swift
//  Movs
//
//  Created by Leonardo Canhette on 05/01/20.
//  Copyright © 2019 Leonardo Canhette. All rights reserved.
//

protocol DataSource {
    func loadMovies(movies: [MovieViewModel])
    func updateMovies(movies: [MovieViewModel])
}
