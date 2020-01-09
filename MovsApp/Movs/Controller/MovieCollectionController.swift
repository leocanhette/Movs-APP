//
//  MovieCollectionViewController.swift
//  Movs
//
//  Created by Leonardo Canhette on 04/01/20.
//  Copyright © 2019 Leonardo Canhette. All rights reserved.
//

import UIKit

final class MovieCollectionController: UIViewController {
    
    var coordinator: MovieCoordinator?
    
    private lazy var movieCollectionView: UIView = MovieCollectionView(self.view.frame, searchBar: self.movieSearchBar, collectionView: self.movieCollection, searchStateView: movieSearchStateView)
    
    private lazy var movieCollection: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private lazy var movieSearchStateView = MovieSearchViewStateView(frame: self.view.frame)
    
    private lazy var dataSource: DataSource = MovieCollectionDataSource(collectionView: self.movieCollection, selectItemHandler: self.movieDidSelect, scrollCollectionHandler: self.scrollMovieCollection)
    
    private lazy var dataProvider: DataProvider = MovieDataProvider(service: MovieAPI.shared, searchPresenter: self)
    
    private lazy var movieSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.delegate = self
        return searchBar
    }()
    
    private var currentPage: Int = 0
    private var totalPages: Int = 0
    private var totalMoviesByPage: Int = 0
    private var totalResults: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadMoviesCollection()
    }
    
    override func loadView() {
        super.loadView()
        self.view = self.movieCollectionView        
    }
    
    private func loadMoviesCollection(title: String? = nil, page: Int = 1){
        self.dataProvider.search(title, page: page)        
    }
    
    private func showCollectionView(_ show: Bool){
        self.movieCollection.isHidden = !show
        self.movieSearchStateView.isHidden = show
    }
    
    private func movieDidSelect(movieViewModel: MovieViewModel){
        coordinator?.detailMovie(movieViewModel)
    }
    
    private func scrollMovieCollection(indexPath: IndexPath){
        if indexPath.row == ((self.totalMoviesByPage - 4) * self.currentPage) && self.totalPages > self.currentPage {
            self.loadMoviesCollection(title: self.movieSearchBar.text, page: self.currentPage + 1 )
        }
    }
}


extension MovieCollectionController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.loadMoviesCollection(title: searchBar.text)
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.loadMoviesCollection()
        searchBar.resignFirstResponder()
        searchBar.text = ""
    }
}

extension MovieCollectionController: SearchMoviePresenter {
    func show(movieInfo: MovieInfo) {
        let movieViewModel: [MovieViewModel] = movieInfo.results.map({ return MovieViewModel($0) })
        if movieInfo.page == 1 {
            self.dataSource.loadMovies(movies: movieViewModel)
        }else {
            self.dataSource.updateMovies(movies: movieViewModel)
        }
        self.showCollectionView(true)
        
        self.totalPages = movieInfo.totalPages
        self.totalResults = movieInfo.totalResults
        self.currentPage = movieInfo.page
        self.totalMoviesByPage = movieInfo.results.count
    }
    
    func show(error: Error) {
        if error is EmptyError {
            self.movieSearchStateView.update(with: .empty(description: error.localizedDescription))
        }else {
            self.movieSearchStateView.update(with: .error(description: error.localizedDescription))
        }
        self.showCollectionView(false)
        
        self.totalPages = 0
        self.totalResults = 0
        self.currentPage = 0
        self.totalMoviesByPage = 0
    }
}
