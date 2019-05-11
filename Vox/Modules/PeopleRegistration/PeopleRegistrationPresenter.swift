//
//  PeopleRegistrationPresenter.swift
//  Vox
//
//  Created by Paulo Henrique dos Santos on 11/05/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class PeopleRegistrationPresenter: PeopleRegistrationPresenterProtocol {
    var view: PeopleRegistrationViewProtocol?
    var interactor: PeopleRegistrationInteractorInputProtocol?
    var router: PeopleRegistrationRouterProtocol?
    
    func resgister(people: PeopleToRegister) {
        interactor?.resgister(people: people)
    }
}

extension PeopleRegistrationPresenter: PeopleRegistrationInteractorOutputProtocol {
    func peopleRegisterDidReturn(response: String) {
        view?.update(response: response)
    }
}
