//
//  PageList.swift
//  growi-client
//
//  Created by Shunsuke Mori on 2018/06/24.
//  Copyright © 2018年 Shunsuke Mori. All rights reserved.
//

import Himotoki

struct BooleanResult: Himotoki.Decodable {
    var ok: Bool
    
    static func decode(_ e: Extractor) throws -> BooleanResult {
        return try BooleanResult(ok: e <| "ok")
    }
}
