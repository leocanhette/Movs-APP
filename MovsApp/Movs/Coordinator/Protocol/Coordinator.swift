//
//  CoordinatorChildren.swift
//  Movs
//
//  Created by Leonardo Canhette on 04/01/20.
//  Copyright © 2019 Leonardo Canhette. All rights reserved.
//

import UIKit

protocol Coordinator{
    var navigationController: UINavigationController { get }
    func start()
}
