//
//  LoginPresenter.swift
//  Vox
//
//  Created by Santos, Paulo Henrique (external - Service) on 21/06/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class LoginPresenter: LoginPresenterProtocol {
    weak var view: LoginViewProtocol!
    var interactor: LoginInteractorInputProtocol!
    var router: LoginRouterProtocol!
    
    func loginWith(username: String, password: String) {
        view.startLoadingAnimation()
        interactor.loginWith(username: username, password: password)
    }
    
    func signupClicked() {
        router.presentSignupScreen()
    }
    
    func forgotPasswordClicked() {
        router.presentForgotPasswordScreen()
    }
}

extension LoginPresenter: LoginInteractorOutputProtocol {
    func loginSuceed() {
        view.stopLoadingAnimation()
        router.presentLoggedScreen()
    }
    
    func loginFailedWith(errorMessage: String) {
        view.stopLoadingAnimation()
        view.showErrorMessage(message: errorMessage)
    }
}
