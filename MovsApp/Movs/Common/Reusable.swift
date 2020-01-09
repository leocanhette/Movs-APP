//
//  Reusable.swift
//  Movs
//
//  Created by Leonardo Canhette on 07/01/20.
//  Copyright © 2019 Leonardo Canhette. All rights reserved.
//

protocol Reusable {
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
    
