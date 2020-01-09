//
//  EmptyError.swift
//  Movs
//
//  Created by Leonardo Canhette on 07/01/20.
//  Copyright © 2019 Leonardo Canhette. All rights reserved.
//
import Alamofire

enum EmptyError: LocalizedError {
    case emptySearchWitlTitleFiltered(_ titleFiltered: String)
    case emptySearch
    
    var errorDescription: String? {
        switch self {
        case let .emptySearchWitlTitleFiltered(titleFiltered):
            return R.string.error.emptyWithFilter().replacingOccurrences(of: "[TITLE]", with: titleFiltered)
        case .emptySearch:
            return R.string.error.empty()
        }
    }
}
