//
//  AppDelegate.swift
//  Vox
//
//  Created by Paulo Henrique dos Santos on 04/05/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var rootWireframe: RootWireframe?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.initMainScreen()
        return true
    }
    
    func initMainScreen() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        rootWireframe = RootWireframe.init(window: window!)
        rootWireframe!.installViewIntoRootViewController()
        
//        if let appDelegate = UIApplication.shared.delegate as? AppDelegate, let window = appDelegate.window  {
//            let viewControllerMain = PeopleRecognitionRouter().build()
//            let navigationController = UINavigationController()
//            navigationController.viewControllers = [viewControllerMain]
//            window.rootViewController = navigationController
//            window.makeKeyAndVisible()
//        }
    }
    
    
    func applicationWillTerminate(_ application: UIApplication) {
        CoreDataStore().save()
    }
}
