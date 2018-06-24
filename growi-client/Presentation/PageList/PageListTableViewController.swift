//
//  PageListTableViewControllerTableViewController.swift
//  growi-client
//
//  Created by Shunsuke Mori on 2018/06/24.
//  Copyright © 2018年 Shunsuke Mori. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Toast

class PageListTableViewController: UITableViewController {
    
    private let viewModel = PageListViewModel()
    private let disposeBag = DisposeBag()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = viewModel
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        
        // page create button
        let plusButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(tapPlusButton))
        self.navigationItem.setRightBarButtonItems([plusButton], animated: true)
        
        bind()
        viewModel.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pageVC = PageViewController()
        pageVC.page = viewModel.pageList.pages.value[indexPath.row]
        navigationController?.pushViewController(pageVC, animated: true)
    }
    
    private func bind() {
        viewModel.pageList.pages.asObservable()
            .subscribe(onNext: { [unowned self] pages in
                self.tableView.reloadData()
                }, onError: { error in
            }, onCompleted: { () in
            }, onDisposed: { () in
            }).disposed(by: disposeBag)
        
        viewModel.pageList.errors.asObservable()
            .subscribe(onNext: { [unowned self] error in
                if let errorMessage = error?.message {
                    self.showErrorAlert(message: "通信に失敗しました")
                    Logger.error(message: errorMessage)
                }
                }, onError: { error in
            }, onCompleted: { () in
            }, onDisposed: { () in
            }).disposed(by: disposeBag)
        
        viewModel.wasCreatedPage.asObservable()
            .subscribe(onNext: { [unowned self] wasCreatedPage in
                if wasCreatedPage != nil {
                    self.view.makeToast("ページを作成しました！", duration: 3, position: CSToastPositionBottom)
                    self.viewModel.reloadData()
                }
                }, onError: { error in
            }, onCompleted: { () in
            }, onDisposed: { () in
            }).disposed(by: disposeBag)
    }
    
    @objc func refresh(sender: UIRefreshControl) {
        viewModel.reloadData()
        refreshControl?.endRefreshing()
    }
    
    @objc func tapPlusButton() {
        showTextFieldAlert(title: "新規ページ作成", message: "ページのパス&名前を入力してください。", placeholder: "/Directory/Example") { text in
            self.viewModel.createPage(pagePath: text)
        }
    }
}
