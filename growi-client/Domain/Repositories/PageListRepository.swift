//
//  GrowiAPIRepository.swift
//  growi-client
//
//  Created by Shunsuke Mori on 2018/06/24.
//  Copyright © 2018年 Shunsuke Mori. All rights reserved.
//

import APIKit
import Himotoki

struct PageListRepository: GrowiAPIRequest {
    typealias Response = PageList
    let path = "pages.list"
    let method: HTTPMethod = .get
    var parameters: Any? {
        var params = ["access_token": ProcessInfo.processInfo.environment["GROWI_API_KEY"] ?? ""]
        if let userName = self.userName {
            params.merge(["user": userName]) { (_, new) in new }
        }
        if let pagePath = self.pagePath {
            params.merge(["path": pagePath]) { (_, new) in new }
        }
        return params
    }
    
    var userName: String?
    var pagePath: String?
    
    init(userName: String) {
        self.userName = userName
    }
    
    init(pagePath: String) {
        self.pagePath = pagePath
    }
    
    func response(from object: Any, urlResponse: HTTPURLResponse) throws -> PageListRepository.Response {
        return try decodeValue(object)
    }
}
