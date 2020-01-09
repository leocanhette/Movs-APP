//
//  MovieDetailCoordinator.swift
//  Movs
//
//  Created by Leonardo Canhette on 07/01/20.
//  Copyright © 2019 Leonardo Canhette. All rights reserved.
//

import UIKit

final class MovieDetailCoordinator {
    
    private let movieViewModel: MovieViewModel
    let navigationController: UINavigationController
    
    private lazy var movieDetailController: MovieDetailController = {
        let viewController = MovieDetailController(self.movieViewModel)
        viewController.title = self.movieViewModel.title
        return viewController
    }()
    
    init(_ navigationController: UINavigationController, movieViewModel: MovieViewModel){
        self.navigationController = navigationController
        self.movieViewModel = movieViewModel
    }
    
}

extension MovieDetailCoordinator: Coordinator {
    func start(){
        self.navigationController.pushViewController(self.movieDetailController, animated: true)
    }
}

