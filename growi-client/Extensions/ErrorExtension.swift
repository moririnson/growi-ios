//
//  ErrorExtension.swift
//  growi-client
//
//  Created by Shunsuke Mori on 2018/06/24.
//  Copyright © 2018年 Shunsuke Mori. All rights reserved.
//

import Foundation

extension Error {
    var message: String {
        let nsError = self as NSError
        return nsError.localizedDescription
    }
}
