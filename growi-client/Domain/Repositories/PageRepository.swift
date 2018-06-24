//
//  PageRepository.swift
//  growi-client
//
//  Created by Shunsuke Mori on 2018/06/24.
//  Copyright © 2018年 Shunsuke Mori. All rights reserved.
//

import APIKit
import Himotoki

struct PageRepository: GrowiAPIRequest {
    typealias Response = Page
    let path = "pages.get"
    let method: HTTPMethod = .get
    var parameters: Any? {
        return [
            "access_token": ProcessInfo.processInfo.environment["GROWI_API_KEY"] ?? "",
            "page_id": pageId,
            "path": pagePath,
            "revision_id": revisionId
        ]
    }
    
    var pageId: String?
    var pagePath: String?
    var revisionId: String?
    
    init(pageId: String, pagePath: String, revisionId: String) {
        self.pagePath = pagePath
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> PageRepository.Response {
        return try decodeValue(object)
    }
}
