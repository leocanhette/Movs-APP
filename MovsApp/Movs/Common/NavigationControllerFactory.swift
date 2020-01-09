//
//
//  Factories.swift
//  Movs
//
//  Created by Leonardo Canhette on 04/01/20.
//  Copyright © 2019 Leonardo Canhette. All rights reserved.
//

import UIKit

final class NavigationControllerFactory {
    static func make() -> UINavigationController{
        let navigationController = UINavigationController()
        navigationController.navigationBar.barTintColor = R.color.main()
        navigationController.navigationBar.tintColor = .black
        navigationController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController.navigationBar.isTranslucent = false
        navigationController.navigationBar.prefersLargeTitles = false
        return navigationController
    }
}
