//
//  MovieCoordinator.swift
//  Movs
//
//  Created by Leonardo Canhette on 04/01/20.
//  Copyright © 2019 Leonardo Canhette. All rights reserved.
//

import UIKit

final class MovieCoordinator {

    let navigationController: UINavigationController
    let mainCoordinator: MainCoordinator
    
    private lazy var movieCollectionController: MovieCollectionController = {
        let viewController = MovieCollectionController()
        viewController.coordinator = self
        viewController.title = R.string.controller.movieTitle()
        return viewController
    }()
    
    init(_ navigationController: UINavigationController, mainCoordinator: MainCoordinator){
        self.navigationController = navigationController
        self.mainCoordinator = mainCoordinator
    }
}

extension MovieCoordinator: Coordinator, CoordinatorChildren{
    func start() {
        self.navigationController.pushViewController(self.movieCollectionController, animated: true)
    }
        
    func detailMovie(_ movieViewModel: MovieViewModel){
        self.mainCoordinator.movieDetailCoordinatorStart(movieViewModel)
    }
}
