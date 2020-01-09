//
//  MovieCollectionPresenter.swift
//  Movs
//
//  Created by Leonardo Canhette on 04/01/20.
//  Copyright © 2019 Leonardo Canhette. All rights reserved.
//

protocol SearchMoviePresenter: ErrorPresenter, LoadingPresenter {
    func show(movieInfo: MovieInfo)
}
