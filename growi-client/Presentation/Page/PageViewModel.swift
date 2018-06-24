//
//  PageViewModel.swift
//  growi-client
//
//  Created by Shunsuke Mori on 2018/06/24.
//  Copyright © 2018年 Shunsuke Mori. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift
import APIKit

class PageViewModel {
    private let disposeBag = DisposeBag()
    
    private(set) var wasUpdatedPage = BehaviorRelay<Bool?>(value: nil)
    private(set) var error = BehaviorRelay<Error?>(value: nil)
    
    func updatePage(page: Page) {
        let request = PageUpdateRepository(pageId: page.id, pageBody: page.revision.body, revisionId: page.revision.id)
        Session.rx_sendRequest(request: request)
            .subscribe { [weak self] event in
                switch event {
                case .next(let resp):
                    if resp.ok {
                        self?.wasUpdatedPage.accept(resp.ok)
                    } else {
                        self?.error.accept(nil)
                    }
                case .error(let error):
                    self?.error.accept(error)
                default: break
                }
            }.disposed(by: disposeBag)
    }
}
