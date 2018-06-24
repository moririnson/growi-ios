//
//  PageViewController.swift
//  growi-client
//
//  Created by Shunsuke Mori on 2018/06/24.
//  Copyright © 2018年 Shunsuke Mori. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import XLPagerTabStrip
import Toast

class PageViewController: ButtonBarPagerTabStripViewController {
    private let disposeBag = DisposeBag()
    
    private let previewPageVC = PreviewPageViewController(nibName: "PreviewPageViewController", bundle: nil)
    private let editPageVC = EditPageViewController(nibName: "EditPageViewController", bundle: nil)
    
    private let viewModel = PageViewModel()
    
    var page: Page? {
        didSet {
            if let text = page?.revision.body {
                previewPageVC.setMarkdown(text: text)
                editPageVC.set(text: text)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isTranslucent = false
        settings.style.buttonBarHeight = 0.5
        settings.style.buttonBarItemBackgroundColor = UIColor.themeColor()
        buttonBarView.backgroundColor = UIColor.subThemeColor()
        buttonBarView.selectedBar.backgroundColor = UIColor.accentColor()
        
        // page create button
        let saveButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.save, target: self, action: #selector(tapSaveButton))
        self.navigationItem.setRightBarButtonItems([saveButton], animated: true)
        
        bind()
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        return [previewPageVC, editPageVC]
    }
    
    override func updateIndicator(for viewController: PagerTabStripViewController, fromIndex: Int, toIndex: Int, withProgressPercentage progressPercentage: CGFloat, indexWasChanged: Bool) {
        // Edit → Preview
        if fromIndex == 1 && toIndex == 0 {
            previewPageVC.setMarkdown(text: editPageVC.editorText)
        }
    }
    
    @objc func tapSaveButton() {
        page?.revision.body = editPageVC.editorTextView.text
        viewModel.updatePage(page: page!)
    }
    
    private func bind() {
        viewModel.wasUpdatedPage.asObservable()
            .subscribe(onNext: { [unowned self] wasUpdatedPage in
                if let wasUpdated = wasUpdatedPage, wasUpdated == true {
                    self.view.makeToast("ページを更新しました！", duration: 3, position: CSToastPositionBottom)
                }
                }, onError: { error in
            }, onCompleted: { () in
            }, onDisposed: { () in
            }).disposed(by: disposeBag)
    }
}
