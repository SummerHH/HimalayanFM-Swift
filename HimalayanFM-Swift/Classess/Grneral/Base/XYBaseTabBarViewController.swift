//
//  XYBaseTabBarViewController.swift
//  HimalayanFM-Swift
//
//  Created by xiaoye on 2019/8/13.
//  Copyright © 2019 叶炯. All rights reserved.
//

import UIKit
import RTRootNavigationController

class XYBaseTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var tempNavArr = [UIViewController]()
        
        let home = XYHomeViewController()
        let listen = XYListenViewController()
        let play = XYPlayViewController()
        let find = XYFindViewController()
        let mine = XYMineViewController()
    
        let objs = [home, listen, play, find, mine]
        let tabBarName = ["首页", "我听", "play", "发现", "我的"];
        let tabBarImageNormal = ["tab_home_1_33x25_", "tab_hear_1_33x25_", "tab_vip_1_33x25_", "tab_find_1_33x25_", "tab_me_1_33x25_"]
        let tabBarImageSelect = ["tab_home_2_33x25_", "tab_hear_2_33x25_", "tab_vip_2_33x25_", "tab_find_2_33x25_", "tab_me_2_33x25_"]

        
        for index in 0..<objs.count {
           
            let containerNav = itemChildViewController(obj: objs[index], title: tabBarName[index], imageName: tabBarImageNormal[index], selectedImage: tabBarImageSelect[index])
            
            tempNavArr.append(containerNav)
        }
        
        self.viewControllers = tempNavArr
    }
    
    func itemChildViewController(obj: UIViewController, title: String, imageName: String, selectedImage: String) -> RTContainerNavigationController {
    
        obj.tabBarItem.image = UIImage(named: imageName)!.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        obj.tabBarItem.selectedImage = UIImage(named: selectedImage)?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        obj.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.purple], for: UIControl.State.normal)
        obj.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.orange], for: UIControl.State.selected)
        
        obj.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4)
        obj.tabBarItem.title = title
        
        let nav: RTContainerNavigationController = RTContainerNavigationController(rootViewController: obj)
        
        return nav
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
