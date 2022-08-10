//
//  TabBarViewController.swift
//  Brick
//
//  Created by 송영모 on 2022/08/10.
//

import UIKit

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .white
        tabBar.isTranslucent = false
        tabBar.layer.borderWidth = 1.0
        tabBar.layer.borderColor = .init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.1)
        
        let homeVC = UINavigationController(rootViewController: HomeViewController())
        let homeTabBarItem = UITabBarItem(title: "홈", image: nil, selectedImage: nil)
        
        let factoryVC = UINavigationController(rootViewController: FactoryViewController())
        let factoryTabBarItem = UITabBarItem(title: "공장", image: nil, selectedImage: nil)
        
        let myPageVC = UINavigationController(rootViewController: MyPageViewController())
        let myPageTabBarItem = UITabBarItem(title: "마이 페이지", image: nil, selectedImage: nil)
        
        homeVC.tabBarItem = homeTabBarItem
        factoryVC.tabBarItem = factoryTabBarItem
        myPageVC.tabBarItem = myPageTabBarItem

        viewControllers = [homeVC, factoryVC, myPageVC]
        selectedIndex = 0
    }
}
