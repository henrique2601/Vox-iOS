//
//  LoginInteractorInput.swift
//  Vox
//
//  Created by Santos, Paulo Henrique (external - Service) on 21/06/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit
import Firebase

class LoginInteractor: LoginInteractorInputProtocol {
    weak var presenter: LoginInteractorOutputProtocol!
    
    func loginWith(username: String, password: String) {
        Auth.auth().signIn(withEmail: username, password: password) { [weak self] user, error in
            guard let strongSelf = self else { return }
            
            if error != nil {
                strongSelf.presenter.loginFailedWith(errorMessage: error?.localizedDescription ?? "Erro desconhecido")
            } else {
                strongSelf.presenter.loginSuceed()
            }
        }
    }
}
