//
//  MovieDataProvider.swift
//  Movs
//
//  Created by Leonardo Canhette on 04/01/20.
//  Copyright © 2019 Leonardo Canhette. All rights reserved.
//

final class MovieDataProvider: DataProvider {
    
    private let service: ServiceAPI
    private let searchPresenter: SearchMoviePresenter
    
    init(service: MovieAPI, searchPresenter: SearchMoviePresenter){
        self.service = service
        self.searchPresenter = searchPresenter
    }
    
    private func sucess(_ movieInfo: MovieInfo){
        self.searchPresenter.removeLoading()
        self.searchPresenter.show(movieInfo: movieInfo)
    }
    
    private func failure(_ error: Error){
        self.searchPresenter.removeLoading()
        self.searchPresenter.show(error: error)        
    }
    
    
    // MARK: Function    
    func search(_ titleFiltering: String?, page: Int){
        self.searchPresenter.showLoading()        
        self.service.fetchMovies(titleFiltering, page: page, completion: { (result) in
            switch result {
            case .success(let movieInfo): self.sucess(movieInfo)
            case .failure(let error): self.failure(error)
            }
        })
    }
}
