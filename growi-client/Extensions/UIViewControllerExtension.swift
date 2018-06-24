//
//  UIViewControllerExtension.swift
//  sorry-crazy-train
//
//  Created by Shunsuke Mori on 2018/06/23.
//  Copyright © 2018年 Shunsuke Mori. All rights reserved.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController.singleBtnAlertWithTitle(title: title, message: message, completion: nil)
        present(alert, animated: true, completion: nil)
    }
    
    func showErrorAlert(message: String) {
        let alert = UIAlertController.singleBtnAlertWithTitle(title: "エラー", message: message, completion: nil)
        present(alert, animated: true, completion: nil)
    }
    
    func showTextFieldAlert(title: String, message: String, placeholder: String = "", completionHandler: @escaping (String) -> Void) {
        let alert = UIAlertController.textFieldAlert(with: title, message: message, placeholder: placeholder, completion: completionHandler)
        present(alert, animated: true, completion: nil)
    }
}
