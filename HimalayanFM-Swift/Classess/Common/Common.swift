//
//  Common.swift
//  HimalayanFM-Swift
//
//  Created by xiaoye on 2019/8/14.
//  Copyright © 2019 叶炯. All rights reserved.
//

import Foundation
import UIKit

/// 是否是刘海屏
public func iPhoneNotchScreen() -> Bool {
    
    if #available(iOS 11.0, *) {
        var iPhoneNotchDirectionSafeAreaInsets = 0.0
        let safeAreaInsets = UIApplication.shared.windows[0].safeAreaInsets

        if UIApplication.shared.statusBarOrientation == .portrait {
            iPhoneNotchDirectionSafeAreaInsets = Double(safeAreaInsets.top)
        }else if UIApplication.shared.statusBarOrientation == .landscapeLeft {
            iPhoneNotchDirectionSafeAreaInsets = Double(safeAreaInsets.left)
        }else if UIApplication.shared.statusBarOrientation == .landscapeRight {
            iPhoneNotchDirectionSafeAreaInsets = Double(safeAreaInsets.right)
        }else if UIApplication.shared.statusBarOrientation == .portraitUpsideDown {
            iPhoneNotchDirectionSafeAreaInsets = Double(safeAreaInsets.bottom)
        }else {
            iPhoneNotchDirectionSafeAreaInsets = Double(safeAreaInsets.top)
        }
        return iPhoneNotchDirectionSafeAreaInsets > 20
    } else {
        return false
    }
}

//MARK:- 日志打印
public func print<T>(message: T, fileName: String = #file, methodName: String = #function, lineNumber: Int = #line) {
    #if DEBUG
    ///获取当前时间
    let now = Date()
    /// 创建一个日期格式器
    let dformatter = DateFormatter()
    dformatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    /// 要把路径最后的字符串截取出来
    let lastName = ((fileName as NSString).pathComponents.last!)
    print("\(dformatter.string(from: now)) [\(lastName)][第\(lineNumber)行] \n\t\t \(message)")
    #endif
}

//MARK:- UserDefaults
public func kUserDefaultsRead(_ key: String) -> String {
    return kUserDefaults.string(forKey: key)!
}

public func kUserDefaultsWrite(_ obj: Any, _ key: String) {
    kUserDefaults.set(obj, forKey: key)
}

public func kUserValue(forKey key: String) -> Any? {
    return kUserDefaults.value(forKey:key)
}

//MARK:- 颜色
extension UIColor {
    convenience init(hexCode: String) {
        var cString:String = hexCode.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.count) != 6) {
            self.init()
        } else {
            var rgbValue:UInt32 = 0
            Scanner(string: cString).scanHexInt32(&rgbValue)
            self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                      blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                      alpha: 1)
        }
    }
}

//MARK:- 字体
public func kSystemFont(ofSize size: CGFloat) -> UIFont {
    
    return UIFont.systemFont(ofSize: size)
}

public func kBoldSystemFont(ofSize size: CGFloat) -> UIFont {
    return UIFont.boldSystemFont(ofSize: size)
}

public func kFontWithName(_ name: String, ofSize size: CGFloat) -> UIFont {
    return UIFont.init(name: name, size: size)!
}


/// 适配 350 375 414       568 667 736
public func kAutoLayoutWidth(_ width: CGFloat) -> CGFloat {
    return kScreenWidth < CGFloat(kDesignWidth) ? width : kScreenWidth / CGFloat(kDesignWidth) * width
}

public func kAutoLayoutHeigth(_ height: CGFloat) -> CGFloat {
    return kScreenHeight < CGFloat(kDesignHeight) ? height : kScreenHeight / CGFloat(kDesignHeight) * height
}

//MARK:- 通知
public func kNOTIFY_ADD(observer: Any, selector: Selector, name: String) {
    
    return NotificationCenter.default.addObserver(observer, selector: selector, name: Notification.Name(rawValue: name), object: nil)
}
// 发送通知
public func kNOTIFY_POST(name: String, object: Any) {
    return NotificationCenter.default.post(name: Notification.Name(rawValue: name), object: object)
}
// 移除通知
public func kNOTIFY_REMOVE(observer: Any, name: String) {
    return NotificationCenter.default.removeObserver(observer, name: Notification.Name(rawValue: name), object: nil)
}

//MARK:- 字符串相关
/**
 字符串是否为空
 @param str NSString 类型 和 子类
 @return BOOL类型 true or false
 */
public func kStringIsEmpty(_ str: String!) -> Bool {
    if str.isEmpty {
        return true
    }
    if str == nil {
        return true
    }
    if str.count < 1 {
        return true
    }
    if str == "(null)" {
        return true
    }
    if str == "null" {
        return true
    }
    return false
}

/// 字符串判空 如果为空返回@“”
public func kStringNullToEmpty(_ str: String) -> String {
    let resutl = kStringIsEmpty(str) ? "" : str
    return resutl
}

/// 字符串判空 如果为空则替换replaceStr
public func kStringNullToReplaceStr(_ str: String,_ replaceStr: String) -> String {
    let resutl = kStringIsEmpty(str) ? replaceStr : str
    return resutl
}

//MARK:- 数组
/**
 数组是否为空
 @param array NSArray 类型 和 子类
 @return BOOL类型 true or false
 */

public func kArrayIsEmpty(_ array: [String]) -> Bool {
    let str: String! = array.joined(separator: "")
    if str == nil {
        return true
    }
    if str == "(null)" {
        return true
    }
    if array.count == 0 {
        return true
    }
    if array.isEmpty {
        return true
    }
    return false
}

//MARK:- 字典
/**
 字典是否为空
 @param dic NSDictionary 类型 和子类
 @return BOOL类型 true or false
 */
func kDictIsEmpty(_ dict: NSDictionary) -> Bool {
    let str: String! = "\(dict)"
    if str == nil {
        return true
    }
    if str == "(null)" {
        return true
    }
    if dict .isKind(of: NSNull.self) {
        return true
    }
    if dict.allKeys.count == 0 {
        return true
    }
    return false
}
