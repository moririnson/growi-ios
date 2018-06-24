//
//  Page.swift
//  growi-client
//
//  Created by Shunsuke Mori on 2018/06/24.
//  Copyright © 2018年 Shunsuke Mori. All rights reserved.
//

import Himotoki

struct Page: Himotoki.Decodable {
    var id: String
    var updatedAt: String
    var lastUpdateUser: String
    var creator: String
    var path: String
    var revision: Revision
    
    static func decode(_ e: Extractor) throws -> Page {
        return try Page(
            id: e <| "id",
            updatedAt: e <| "updatedAt",
            lastUpdateUser: e <| "lastUpdateUser",
            creator: e <| "creator",
            path: e <| "path",
            revision: e <| "revision"
        )
    }
}
