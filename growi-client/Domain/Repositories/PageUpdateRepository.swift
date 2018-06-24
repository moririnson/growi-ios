//
//  PageUpdateRepository.swift
//  growi-client
//
//  Created by Shunsuke Mori on 2018/06/24.
//  Copyright © 2018年 Shunsuke Mori. All rights reserved.
//

import APIKit
import Himotoki

struct PageUpdateRepository: GrowiAPIRequest {
    typealias Response = BooleanResult
    let path = "pages.update"
    let method: HTTPMethod = .post
    var queryParameters: [String : Any]? {
        return [
            "access_token": ProcessInfo.processInfo.environment["GROWI_API_KEY"] ?? "",
        ]
    }
    var bodyParameters: BodyParameters? {
        return JSONBodyParameters(JSONObject: [
            "page_id": pageId,
            "body": pageBody,
            "revision_id": revisionId
            ])
    }
    
    let pageId: String
    let pageBody: String
    let revisionId: String
    
    init(pageId: String, pageBody: String, revisionId: String) {
        self.pageId = pageId
        self.pageBody = pageBody
        self.revisionId = revisionId
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> PageUpdateRepository.Response {
        return try decodeValue(object)
    }
}
