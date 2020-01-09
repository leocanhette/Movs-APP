//
//  MovieViewModel.swift
//  Movs
//
//  Created by Leonardo Canhette on 04/01/20.
//  Copyright © 2019 Leonardo Canhette. All rights reserved.
//

import UIKit

struct MovieViewModel {
    
    let id: Int
    let title: String
    let releaseDate: String
    let genre: String
    let overview: String
    let urlPosterPath: URL?
    
    var favoriteImageButton: UIImage?
    
    init(_ movie: Movie){
        
        self.id = movie.id
        
        self.genre = "Horror, Fiction, Drama"
        
        if let title = movie.title, !title.isEmpty {
            self.title = title
        }else {
            self.title = R.string.common.labelEmpty()
        }
        
        if let releaseDate = movie.releaseDate, !releaseDate.isEmpty {
            self.releaseDate = String(releaseDate.prefix(4))
        }else {
            self.releaseDate = R.string.common.labelEmpty()
        }
        
        if let overview = movie.overview, !overview.isEmpty {
            self.overview = overview
        }else {
            self.overview = R.string.common.labelEmpty()
        }
        
        if let posterPath = movie.getCompleteUrlPosterPath(), !posterPath.isEmpty, let urlPosterPath =  URL(string: posterPath) {
            self.urlPosterPath = urlPosterPath
        }else {
            self.urlPosterPath = nil
        }
        
        if self.verifyIsFavorite() {
            self.favoriteImageButton =  R.image.favorite_full_icon()
        }else{
            self.favoriteImageButton = R.image.favorite_gray_icon()
        }        
    }
    
    func verifyIsFavorite() -> Bool {
        // In progress
        return false
    }
}
