//
//  PlistRepository.swift
//  growi-client
//
//  Created by Shunsuke Mori on 2018/06/24.
//  Copyright © 2018年 Shunsuke Mori. All rights reserved.
//

import Foundation

class InfoPlistRepository {
    let infoPlistDataStore = PlistDataStore<Info>()
    
    func findAll() -> Info {
        return infoPlistDataStore.getPlist()
    }
}
