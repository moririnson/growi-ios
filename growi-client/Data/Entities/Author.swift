//
//  Author.swift
//  growi-client
//
//  Created by Shunsuke Mori on 2018/06/24.
//  Copyright © 2018年 Shunsuke Mori. All rights reserved.
//

import Himotoki

struct Author: Himotoki.Decodable {
    var admin: Bool
    var id: String
    var name: String
    var username: String
    var email: String
    
    static func decode(_ e: Extractor) throws -> Author {
        return try Author(
            admin: e <| "admin",
            id: e <| "_id",
            name: e <| "name",
            username: e <| "username",
            email: e <| "email")
    }
}
