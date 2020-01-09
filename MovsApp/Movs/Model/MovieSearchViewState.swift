//
//  MovieSearchViewState.swift
//  Movs
//
//  Created by Leonardo Canhette on 07/01/20.
//  Copyright © 2020 Leonardo Canhette. All rights reserved.
//
import UIKit

enum MovieSearchViewState {
    
    case empty(description: String)
    case error(description: String)
    
    var imageView: UIImage? {
        switch self {
        case .empty:
            return R.image.search_icon()
        case .error:
            return R.image.error_icon()
        }
    }
    
    var descriptionLabel: String {
        switch self {
        case let .empty(description: error), let .error(description: error):
            return error        
        }
    }
    
}
