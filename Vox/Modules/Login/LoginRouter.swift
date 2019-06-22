//
//  LoginRouter.swift
//  Vox
//
//  Created by Santos, Paulo Henrique (external - Service) on 21/06/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class LoginRouter: LoginRouterProtocol {
    var storyboard: UIStoryboard {
        return UIStoryboard(name: "LoginView", bundle: Bundle.main)
    }
    
    func configuredViewController() -> UIViewController {
        let interactor = LoginInteractor()
        let presenter = LoginPresenter()
        let router = LoginRouter()
        let viewController = storyboard.instantiateViewController(withIdentifier: "LoginView") as! LoginView
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        return viewController
    }
    
    func presentLoggedScreen() {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.presentLoggedScreen()
        }
    }
    
    func presentForgotPasswordScreen() {
        //TODO
    }
    
    func presentSignupScreen() {
        //TODO
    }
}
