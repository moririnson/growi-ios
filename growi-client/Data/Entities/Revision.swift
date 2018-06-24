//
//  Revision.swift
//  growi-client
//
//  Created by Shunsuke Mori on 2018/06/24.
//  Copyright © 2018年 Shunsuke Mori. All rights reserved.
//

import Himotoki

struct Revision: Himotoki.Decodable {
    var id: String
    var format: String
    var createdAt: String
    var path: String
    var body: String
    var author: Author
    
    static func decode(_ e: Extractor) throws -> Revision {
        return try Revision(
            id: e <| "_id",
            format: e <| "format",
            createdAt: e <| "createdAt",
            path: e <| "path",
            body: e <| "body",
            author: e <| "author")
    }
}
