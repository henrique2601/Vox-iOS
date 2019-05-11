//
//  TabBarModuleRouter.swift
//  Vox
//
//  Created by Paulo Henrique dos Santos on 11/05/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class TabBarModuleRouter: TabBarModuleRouterProtocol {
    var rootWireframe: RootWireframe?
    
    func installIntoWindow(rootWireFrame: RootWireframe, window: UIWindow, wireFrames: [TabBarViewProtocol]) -> TabBarModuleRouterProtocol {

        let wireFrame: TabBarModuleRouterProtocol = TabBarModuleRouter()
        wireFrame.rootWireframe = rootWireFrame
        
        var viewControllers = [UIViewController]()
        
        for wireFrame in wireFrames {
            
            let tabBarItem = UITabBarItem()
            tabBarItem.image = wireFrame.tabIcon
            tabBarItem.title = wireFrame.tabTitle
            let viewController = wireFrame.configuredViewController()
            let navigationController = UINavigationController(rootViewController: viewController)
            navigationController.tabBarItem = tabBarItem
            navigationController.setNavigationBarHidden(false, animated: false)
            navigationController.title = wireFrame.tabTitle
            viewControllers.append(navigationController)
        }
        
        //installing tabBarController into window
        //rest interactions can be done VIPER way
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = viewControllers
        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        
        return wireFrame
    }    
}
