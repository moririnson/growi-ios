//
//  UIColorExtension.swift
//  growi-client
//
//  Created by Shunsuke Mori on 2018/06/24.
//  Copyright © 2018年 Shunsuke Mori. All rights reserved.
//

import UIKit
import Foundation

extension UIColor {
    // Twitterの水色を返します
    class func twitterColor() -> UIColor {
        return UIColor.rgbColor(rgbValue: 0x00ACED)
    }
    
    // Facebookの青色を返します
    class func facebookColor() -> UIColor {
        return UIColor.rgbColor(rgbValue: 0x305097)
    }
    
    // Lineの緑色を返します
    class func lineColor() -> UIColor {
        return UIColor.rgbColor(rgbValue: 0x5AE628)
    }
    
    // テーマカラーを返します
    class func themeColor() -> UIColor {
        return UIColor.rgbColor(rgbValue: 0x27313D)
    }
    
    class func subThemeColor() -> UIColor {
        return UIColor.rgbColor(rgbValue: 0xDE4830)
    }
    
    class func accentColor() -> UIColor {
        return UIColor.rgbColor(rgbValue: 0xA6341F)
    }
    
    // UIntからUIColorを返します　#FFFFFFのように色を指定できるようになります
    class func rgbColor(rgbValue: UInt, alpha: CGFloat = 1.0) -> UIColor{
        return UIColor(
            red:   CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >>  8) / 255.0,
            blue:  CGFloat( rgbValue & 0x0000FF)        / 255.0,
            alpha: CGFloat(alpha)
        )
    }
}
