//
//  RootWireFrame.swift
//  Vox
//
//  Created by Paulo Henrique dos Santos on 11/05/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class RootWireframe: NSObject
{
    var window: UIWindow!
    var tabBarModuleWireframe: TabBarModuleRouterProtocol?
    
    init(window: UIWindow)
    {
        super.init()
        self.window = window
        
        // custom initialization
    }
    
    func installViewIntoRootViewController(){
        
        var wireframes = [TabBarViewProtocol]()
        
        let missingPeople = MissingPeopleRouter()
        missingPeople.peopleType = .missing
        missingPeople.tabTitle = "Desaparecidos"
        wireframes.append(missingPeople)
        
        let homelessPeople = MissingPeopleRouter()
        homelessPeople.peopleType = .homeless
        homelessPeople.tabTitle = "Moradores de rua"
        wireframes.append(homelessPeople)
        
        let peopleRegistration = AddPeopleRouter()
        wireframes.append(peopleRegistration)
        
        self.tabBarModuleWireframe = TabBarModuleRouter().installIntoWindow(rootWireFrame: self, window: self.window, wireFrames: wireframes)
    }
}
