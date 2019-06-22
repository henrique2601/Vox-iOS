//
//  AppDelegate.swift
//  Vox
//
//  Created by Paulo Henrique dos Santos on 04/05/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var rootWireframe: RootWireframe?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        Auth.auth().languageCode = "br"
        self.initMainScreen()
        return true
    }
    
    func initMainScreen() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
//        
//        do {
//            try Auth.auth().signOut()
//            // signed out
//        } catch (_){
//            // an error
//        }
        
        if Auth.auth().currentUser != nil {
            // User is signed in.
            presentLoggedScreen()
        } else {
            // No user is signed in.
            presentNotLoggedScreen()
        }
    }
    
    func presentLoggedScreen() {
        rootWireframe = RootWireframe.init(window: window!)
        rootWireframe!.installViewIntoRootViewController()
    }
    
    func presentNotLoggedScreen() {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate, let window = appDelegate.window  {
            let viewControllerMain = LoginRouter().configuredViewController()
            let navigationController = UINavigationController()
            navigationController.viewControllers = [viewControllerMain]
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
        }
    }
}
