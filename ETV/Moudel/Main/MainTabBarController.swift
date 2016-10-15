//
//  MainTabBarController.swift
//  ETV
//
//  Created by Heisenbean on 16/9/29.
//  Copyright © 2016年 Heisenbean. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.barTintColor = UIColor.white
        setVc()
    }
    
    
    func setVc() {
        addChildViewController("Home", "首页", UIImage(named:"menu_homepage_24x24_"), UIImage(named:"menu_homepage_sel_24x24_"))
        addChildViewController("Entertainment", "游戏", UIImage(named:"menu_youxi_24x24_"), UIImage(named:"menu_youxi_sel_24x24_"))
        addChildViewController("Game", "娱乐", UIImage(named:"menu_yule_24x24_"),UIImage(named: "menu_yule_sel_24x24_"))
        addChildViewController("Goddess", "女神", UIImage(named:"menu_goddess_normal_20x21_"), UIImage(named:"menu_goddess_20x21_"))
        addChildViewController("Mine", "我的", UIImage(named:"menu_mine_24x24_"), UIImage(named:"menu_mine_sel_24x24_"))
    }
    
    fileprivate func addChildViewController(_ sbName: String, _ title: String, _ image: UIImage?, _ selectImage: UIImage?) {
        let vc = UIStoryboard.initialViewController(sbName)
        let nav = MainNavigationController(rootViewController: vc)
        vc.title = title
        nav.title = title
        nav.tabBarItem.image = image!.withRenderingMode(.alwaysOriginal)
        nav.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.init(colorLiteralRed: 36/255.0, green: 205/255.0, blue: 137/255.0, alpha: 1.0)], for: .selected)
        nav.tabBarItem.selectedImage = selectImage!.withRenderingMode(.alwaysOriginal)
        addChildViewController(nav)
        
    }


// MARK: Others
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
}
