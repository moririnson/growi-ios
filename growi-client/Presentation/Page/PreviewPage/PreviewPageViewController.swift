//
//  PreviewPageViewController.swift
//  growi-client
//
//  Created by Shunsuke Mori on 2018/06/24.
//  Copyright © 2018年 Shunsuke Mori. All rights reserved.
//

import UIKit
import SwiftyMarkdown
import XLPagerTabStrip

class PreviewPageViewController: UIViewController, IndicatorInfoProvider {
    
    @IBOutlet weak var previewTextView: UITextView!
    
    private var text = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        previewTextView.isEditable = false
        
        setMarkdown(text: text)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setMarkdown(text: String) {
        self.text = text
        let md = SwiftyMarkdown(string: text).attributedString()
        if previewTextView != nil {
            previewTextView?.attributedText = md
        }
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "プレビュー")
    }
}
