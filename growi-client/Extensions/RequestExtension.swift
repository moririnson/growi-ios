//
//  RequestExtension.swift
//  growi-client
//
//  Created by Shunsuke Mori on 2018/06/24.
//  Copyright © 2018年 Shunsuke Mori. All rights reserved.
//

import APIKit
import Himotoki

extension Request {
    func intercept(object: Any, urlResponse: HTTPURLResponse) throws -> Any {
        guard (200..<300).contains(urlResponse.statusCode) else {
            throw ResponseError.unacceptableStatusCode(urlResponse.statusCode)
        }
        return object
    }
}

protocol GrowiAPIRequest: Request {
    var path: String { get }
}

extension GrowiAPIRequest {
    var baseURL: URL {
        return URL(string: ProcessInfo.processInfo.environment["GROWI_API_URL"] ?? "")!
    }
}
