//
//  AppStartConfigurator.swift
//  iOSArchitecturesDemo
//
//  Created by ekireev on 19.02.2018.
//  Copyright © 2018 ekireev. All rights reserved.
//

import UIKit

final class AppStartManager {
    
    var window: UIWindow?
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    func start() {
        let softwearTab = UITabBarItem()
        softwearTab.title = "Softwear"
        softwearTab.image = UIImage(systemName: "app.fill")

        let softwearVC = SearchAppAssembly.make()
        softwearVC.tabBarItem = softwearTab
        
        let musicTab = UITabBarItem()
        musicTab.title = "Music"
        musicTab.image = UIImage(systemName: "music.note.list")

        let musicVC = SearchSongAssembly.make()
        musicVC.tabBarItem = musicTab
        
        let rootVC = UITabBarController()
        rootVC.navigationItem.title = "Search via iTunes"
        rootVC.viewControllers = [softwearVC, musicVC]
        
        let navVC = self.configuredNavigationController
        navVC.viewControllers = [rootVC]
        
        window?.rootViewController = navVC
        window?.makeKeyAndVisible()
    }
    
    private lazy var configuredNavigationController: UINavigationController = {
        let navVC = UINavigationController()
        navVC.navigationBar.barTintColor = UIColor.varna
        navVC.navigationBar.isTranslucent = false
        navVC.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        return navVC
    }()
}
