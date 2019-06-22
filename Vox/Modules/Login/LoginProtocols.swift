//
//  LoginProtocols.swift
//  Vox
//
//  Created by Santos, Paulo Henrique (external - Service) on 21/06/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

protocol LoginViewProtocol: class {
    var presenter: LoginPresenterProtocol! { get set }
    
    // Add here your methods for communication PRESENTER -> VIEW
    func startLoadingAnimation()
    func stopLoadingAnimation()
    func showErrorMessage(message: String)
}

protocol LoginPresenterProtocol: class {
    var view: LoginViewProtocol! { get set }
    var interactor: LoginInteractorInputProtocol! { get set }
    var router: LoginRouterProtocol! { get set }
    
    // Add here your methods for communication VIEW -> PRESENTER
    func loginWith(username:String, password: String)
    func signupClicked()
    func forgotPasswordClicked()
}

protocol LoginInteractorInputProtocol: class {
    var presenter: LoginInteractorOutputProtocol! { get set }
    
    // Add here your methods for communication PRESENTER -> INTERACTOR
    func loginWith(username:String, password: String)
}

protocol LoginInteractorOutputProtocol: class {
    // Add here your methods for communication INTERACTOR -> PRESENTER
    func loginSuceed()
    func loginFailedWith(errorMessage: String)
}

protocol LoginRouterProtocol: class {
    // Add here your methods for communication PRESENTER -> ROUTER
    func configuredViewController() -> UIViewController
    func presentLoggedScreen()
    func presentForgotPasswordScreen()
    func presentSignupScreen()
}
