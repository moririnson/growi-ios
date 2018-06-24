//
//  EditPageViewController.swift
//  growi-client
//
//  Created by Shunsuke Mori on 2018/06/24.
//  Copyright © 2018年 Shunsuke Mori. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class EditPageViewController: UIViewController, IndicatorInfoProvider {
    
    @IBOutlet weak var editorTextView: UITextView!
    
    private var initText = ""
    
    var editorText: String {
        return editorTextView.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        set(text: initText)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func set(text: String) {
        self.initText = text
        if editorTextView != nil {
            editorTextView?.text = text
        }
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "編集")
    }
}
