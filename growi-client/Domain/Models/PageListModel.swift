//
//  PageListModel.swift
//  growi-client
//
//  Created by Shunsuke Mori on 2018/06/24.
//  Copyright © 2018年 Shunsuke Mori. All rights reserved.
//

import RxSwift
import RxCocoa

struct PageListModel {
    let pages: BehaviorRelay<[Page]>
    let errors: BehaviorRelay<Error?>
    
    init(pages: BehaviorRelay<[Page]>, errors: BehaviorRelay<Error?>) {
        self.pages = pages
        self.errors = errors
    }
}
