//
//  PlistDataStore.swift
//  growi-client
//
//  Created by Shunsuke Mori on 2018/06/24.
//  Copyright © 2018年 Shunsuke Mori. All rights reserved.
//

import InfoKit

class PlistDataStore<T: Codable> {
    func getPlist() -> T {
        let plist = Plist<T>()
        return plist.decode()!
    }
}
