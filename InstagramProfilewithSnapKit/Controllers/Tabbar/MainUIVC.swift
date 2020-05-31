//
//  MainUIVC.swift
//  InstagramProfilewithSnapKit
//
//  Created by Tolga İskender on 30.05.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
import UIKit

extension MainVC {
    func setupTabbar(){
        tabbarControllers()
    }
    
}
extension MainVC {
    fileprivate func tabbarControllers(){
        let mainFeedVC = MainFeedVC()
        mainFeedVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        let profileVC = HomeVC()
        profileVC.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        let tabBarList = [mainFeedVC, profileVC]
        viewControllers = tabBarList
    }
}
