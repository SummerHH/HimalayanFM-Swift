//
//  UConstants.swift
//  HimalayanFM-Swift
//
//  Created by xiaoye on 2019/8/14.
//  Copyright © 2019 叶炯. All rights reserved.
//

import Foundation
import UIKit

//MARK:- 尺寸相关
/// 屏幕的分辨率
let kMainScreenScale = UIScreen.main.scale
/// 屏幕宽度
let kScreenWidth = UIScreen.main.responds(to: #selector(getter: UIScreen.nativeBounds)) ? UIScreen.main.nativeBounds.width / UIScreen.main.nativeScale : UIScreen.main.bounds.width
/// 屏幕高度
let kScreenHeight = UIScreen.main.responds(to: #selector(getter: UIScreen.nativeBounds)) ? UIScreen.main.nativeBounds.height / UIScreen.main.nativeScale : UIScreen.main.bounds.height

/// 屏幕大小
let kScreenSize = UIScreen.main.responds(to: #selector(getter: UIScreen.nativeBounds)) ? CGSize(width: kScreenWidth, height: kScreenHeight) : UIScreen.main.bounds.size
/// 状态栏的高度
let kStatusBarHeight = UIApplication.shared.statusBarFrame.size.height
/// 导航栏的高度
let kNavigationBarHeight = 44.0
/// tabBar的高度
let kTabBarHeight = kStatusBarHeight > 20.0 ? 83.0 : 49.0
/// iphoneX 底部区域
let ksafeAreaLayoutGuideBottom = iPhoneNotchScreen() ? 34.0 : 0.0
/// 按钮默认高度
let kBtnDefaultHeight = 44.0
/// 导航的高度
let kTopHeight = CGFloat(kStatusBarHeight) + CGFloat(kNavigationBarHeight)

/// iphone 6 尺寸
let kDesignHeight = 667.0
let kDesignWidth = 375.0

/// 中英文下键盘的高度
let kEnglishKeyboardHeight = 216.0
let kChineseKeyboardHeight = 252.0

/// 设备
let kSCREEN_MAX_LENGTH = max(kScreenWidth, kScreenHeight)
let kSCREEN_MIN_LENGTH = min(kScreenWidth, kScreenHeight)
/// 判断是否为iPhone
let kDevice_Is_iphone = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.phone)
/// 判断是否为iPad
let kDevice_Is_ipad = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad)
/// 机型
let kDevice_Is_iPhone5 = (kDevice_Is_iphone && kSCREEN_MAX_LENGTH == 568.0)
let kDevice_Is_iPhone6 = (kDevice_Is_iphone && kSCREEN_MAX_LENGTH == 667.0)
let kDevice_Is_iPhone6Plus = (kDevice_Is_iphone && kSCREEN_MAX_LENGTH == 736.0)
let kDevice_Is_iPhoneX = (kDevice_Is_iphone && kSCREEN_MAX_LENGTH == 568.0)


/// window
let kWindow = UIApplication.shared.delegate?.window
/// 通知
let kNotificationCenter = NotificationCenter.default
/// 随机颜色
let kRandomColor = UIColor(red: CGFloat(arc4random_uniform(256)/255), green: CGFloat(arc4random_uniform(256)/255), blue: CGFloat(arc4random_uniform(256)/255), alpha: 1.0)

//MARK:- 沙盒相关
/// 获取沙盒Document路径
let kDocumentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
/// 获取沙盒Cache路径
let kCachePath = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true).first
/// 获取沙盒temp路径
let kTempPath = NSTemporaryDirectory()
/// 本地存储
let kUserDefaults = UserDefaults.standard

//MARK:- 系统相关
/// 获取系统的版本号
let kDeviceSystemVersion = (UIDevice.current.systemVersion as NSString).floatValue
/// 获取应用外部版本号
let kAppSystemVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"]
/// 获取应用的内部版本号
let kAppBundleVersion = Bundle.main.infoDictionary?["CFBundleVersion"]
/// 获取应用的名称
let kAppDisplayName = Bundle.main.infoDictionary?["CFBundleDisplayName"]
/// 获取当前语言
let kAppCurrentLanguage = Locale.preferredLanguages[0]





