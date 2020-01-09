//
//  MovieCollectionDataSource.swift
//  Movs
//
//  Created by Leonardo Canhette on 04/01/20.
//  Copyright © 2019 Leonardo Canhette. All rights reserved.
//

import UIKit

final class MovieCollectionDataSource: NSObject, DataSource {
    
    typealias selectItemHandler = (MovieViewModel) -> ()
    typealias scrollCollectionHandler = (IndexPath) -> ()
    
    private var movieViewModel: [MovieViewModel] = []
    private let collectionView: UICollectionView
    private let selectItemHandler: selectItemHandler
    private let scrollCollectionHandler: scrollCollectionHandler    
    
    init(collectionView: UICollectionView, selectItemHandler: @escaping selectItemHandler, scrollCollectionHandler: @escaping scrollCollectionHandler){
        self.collectionView = collectionView
        self.selectItemHandler = selectItemHandler
        self.scrollCollectionHandler = scrollCollectionHandler
        super.init()
        self.setupCollectionView()
    }
    
    private func setupCollectionView(){
        self.collectionView.registerReusableCell(MovieCell.self)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self        
    }
    
    
    
    // MARK: Function
    
    func loadMovies(movies: [MovieViewModel]){
        self.movieViewModel = movies
        self.collectionView.reloadData()
    }
    
    func updateMovies(movies: [MovieViewModel]){
        self.movieViewModel += movies
        self.collectionView.reloadData()
    }
}

extension MovieCollectionDataSource: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movieViewModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movieViewModel = self.movieViewModel[indexPath.row]
        let cell: MovieCell = collectionView.dequeueReusableCell(indexPath)        
        cell.movieViewModel = movieViewModel
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectItemHandler(self.movieViewModel[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.scrollCollectionHandler(indexPath)
    }
}

extension MovieCollectionDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingWithItems: CGFloat = 13
        let widthCollectionView = self.collectionView.frame.width
        let width: CGFloat = (widthCollectionView / 2) - paddingWithItems
        let height: CGFloat = (width / 2) + width
        return CGSize(width: width, height: height)
    }
}
