//
//  LoadingPresenter.swift
//  Movs
//
//  Created by Leonardo Canhette on 04/01/20.
//  Copyright © 2019 Leonardo Canhette. All rights reserved.
//

import UIKit

protocol LoadingPresenter: class {
    func showLoading()
    func removeLoading()
}

extension LoadingPresenter where Self: UIViewController {
    func showLoading() {
        view.loadActivity()
    }
    
    func removeLoading() {
        view.unloadActivity()
    }
}
