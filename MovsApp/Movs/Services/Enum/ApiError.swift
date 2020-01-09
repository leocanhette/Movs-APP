//
//  ApiError.swift
//  Movs
//
//  Created by Leonardo Canhette on 07/01/20.
//  Copyright © 2019 Leonardo Canhette. All rights reserved.
//
import Alamofire

enum ApiError: LocalizedError {
    case requestMovie(localizedDescription: String)
    case decodeData(localizedDescription: String)
    
    var errorDescription: String? {
        switch self {
        case let .requestMovie(localizedDescription):
            return R.string.error.apiError() + localizedDescription
        case let .decodeData(localizedDescription):
            return R.string.error.decodeError() + localizedDescription
        }
    }    
}
