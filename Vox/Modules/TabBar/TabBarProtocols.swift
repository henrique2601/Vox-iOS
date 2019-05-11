//
//  TabBarProtocols.swift
//  Vox
//
//  Created by Paulo Henrique dos Santos on 11/05/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

protocol TabBarModuleRouterProtocol: class {
    var rootWireframe: RootWireframe? { get set }
    
    func installIntoWindow(rootWireFrame: RootWireframe, window: UIWindow, wireFrames:[TabBarViewProtocol]) -> TabBarModuleRouterProtocol
}

protocol TabBarViewProtocol: class {
    var tabIcon: UIImage { get }
    var tabTitle: String { get }
    
    func configuredViewController() -> UIViewController
}
