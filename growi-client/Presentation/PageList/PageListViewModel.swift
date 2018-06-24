//
//  PageListViewModel.swift
//  growi-client
//
//  Created by Shunsuke Mori on 2018/06/24.
//  Copyright © 2018年 Shunsuke Mori. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import APIKit

class PageListViewModel: NSObject, UITableViewDataSource, UITableViewDelegate {
    private let CELL_IDENTIFIER = "page_list_cell"
    
    private let disposeBag = DisposeBag()
    
    private(set) var pageList = PageListModel(pages: BehaviorRelay<[Page]>(value: []), errors: BehaviorRelay<Error?>(value: nil))
    private(set) var wasCreatedPage = BehaviorRelay<Bool?>(value: nil)
    
    private var page: Int = 1
    
    func reloadData() {
        let request = PageListRepository(userName: "morimorim") // 固定
        Session.rx_sendRequest(request: request)
            .subscribe { [weak self] event in
                switch event {
                case .next(let resp):
                    self?.pageList.pages.accept(resp.pages)
                case .error(let error):
                    self?.pageList.errors.accept(error)
                default: break
                }
        }.disposed(by: disposeBag)
    }
    
    func createPage(pagePath: String) {
        let request = PageCreateRepository(pagePath: pagePath, pageBody: "# 新規ページ") // 固定
        Session.rx_sendRequest(request: request)
            .subscribe { [weak self] event in
                switch event {
                case .next(let resp):
                    if resp.ok {
                        self?.wasCreatedPage.accept(resp.ok)
                    } else {
                        self?.pageList.errors.accept(nil)
                    }
                case .error(let error):
                    self?.pageList.errors.accept(error)
                default: break
                }
            }.disposed(by: disposeBag)
    }
    
    // MARK: UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pageList.pages.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: CELL_IDENTIFIER)
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: CELL_IDENTIFIER)
        }
        cell?.textLabel?.text = pageList.pages.value[indexPath.row].revision.path
        cell?.detailTextLabel?.text = pageList.pages.value[indexPath.row].revision.author.name
        cell?.accessoryType = .disclosureIndicator
        return cell!
    }
}
