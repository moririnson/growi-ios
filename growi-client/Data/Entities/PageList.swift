//
//  PageList.swift
//  growi-client
//
//  Created by Shunsuke Mori on 2018/06/24.
//  Copyright © 2018年 Shunsuke Mori. All rights reserved.
//

import Himotoki

struct PageList: Himotoki.Decodable {
    var pages: [Page]
    
    static func decode(_ e: Extractor) throws -> PageList {
        return try PageList(pages: e <|| "pages")
    }
}
