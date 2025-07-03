//
//  MainTabBarController.swift
//  TabBar + NotificationCenter
//
//  Created by Gabriel Mors Pulga on 02/07/25.
//

import UIKit

class MainTabBarController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tela01 = createNavController(viewController: Tela01ViewController(), title: "Tela 01", image: "magnifyingglass")
        
        let tela02 = createNavController(viewController: Tela02ViewController(), title: "Tela 02", image: "heart")
        
        let tela03 = createNavController(viewController: Tela03ViewController(), title: "Tela 03", image: "star")
        
        viewControllers = [tela01, tela02, tela03]
        customizeTabBarAppearance()
    }
    
    private func createNavController(viewController: UIViewController, title: String, image: String) -> UINavigationController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(systemName: image)
        return navController
    }
    
    private func customizeTabBarAppearance() {
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .lightGray
        
        tabBar.backgroundColor = .white
        tabBar.isTranslucent = false
        
        
    }
}
