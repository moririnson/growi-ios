//
//  UIAlertControllerExtension.swift
//  sorry-crazy-train
//
//  Created by Shunsuke Mori on 2018/06/23.
//  Copyright © 2018年 Shunsuke Mori. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    class func singleBtnAlertWithTitle(title: String, message: String, completion: (() -> Void)?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            if let completion = completion {
                completion()
            }
        }))
        return alert
    }
    
    class func doubleBtnAlertWithTitle(title: String, message: String, otherBtnTitle:String, completion: (() -> Void)?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: otherBtnTitle, style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            if let completion = completion {
                completion()
            }
        }))
        return alert
    }
    
    class func textFieldAlert(with title: String, message: String, placeholder: String, completion: ((_ text: String) -> Void)?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action:UIAlertAction!) -> Void in
            let textFields:Array<UITextField>? =  alert.textFields as Array<UITextField>?
            if let textField = textFields?.first, let completion = completion  {
                completion(textField.text!)
            }
        }))
        alert.addAction(UIAlertAction(title: "キャンセル", style: .default, handler: nil))
        alert.addTextField(configurationHandler: {(text: UITextField!) -> Void in
            text.placeholder = placeholder
        })
        return alert
    }
}
