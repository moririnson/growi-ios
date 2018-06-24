//
//  PageCreateRepository.swift
//  growi-client
//
//  Created by Shunsuke Mori on 2018/06/24.
//  Copyright © 2018年 Shunsuke Mori. All rights reserved.
//

import APIKit
import Himotoki

struct PageCreateRepository: GrowiAPIRequest {
    typealias Response = BooleanResult
    let path = "pages.create"
    let method: HTTPMethod = .post
    var queryParameters: [String : Any]? {
        return [
            "access_token": ProcessInfo.processInfo.environment["GROWI_API_KEY"] ?? "",
        ]
    }
    var bodyParameters: BodyParameters? {
        return JSONBodyParameters(JSONObject: [
            "path": pagePath,
            "body": pageBody
        ])
    }
    
    let pagePath: String
    let pageBody: String
    
    init(pagePath: String, pageBody: String) {
        self.pagePath = pagePath
        self.pageBody = pageBody
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> PageCreateRepository.Response {
        return try decodeValue(object)
    }
}
