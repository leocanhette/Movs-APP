//
//  MainCoordinator.swift
//  Movs
//
//  Created by Leonardo Canhette on 04/01/20.
//  Copyright © 2019 Leonardo Canhette. All rights reserved.
//

import UIKit

final class MainCoordinator {
    
    private let window: UIWindow
    var navigationController: UINavigationController = NavigationControllerFactory.make()
    
    init(_ window: UIWindow){
        self.window = window
    }
}

extension MainCoordinator: Coordinator {
    func start() {
        window.makeKeyAndVisible()
        window.rootViewController = self.navigationController
        
        MovieCoordinator(self.navigationController, mainCoordinator: self).start()
    }
    
    func movieDetailCoordinatorStart(_ movieViewModel: MovieViewModel){
        MovieDetailCoordinator(self.navigationController, movieViewModel: movieViewModel).start()
    }
    
}

