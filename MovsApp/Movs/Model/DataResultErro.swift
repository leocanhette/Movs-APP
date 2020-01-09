//
//  DataResultErro.swift
//  Movs
//
//  Created by Leonardo Canhette on 07/01/20.
//  Copyright © 2019 Leonardo Canhette. All rights reserved.
//

struct DataResultErro: Decodable {
    
    let statusCode: Int
    let statusMessage: String
    
    init(statusCode: Int, statusMessage: String){
        self.statusCode = statusCode
        self.statusMessage = statusMessage
    }
}

extension DataResultErro {
    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }
}
