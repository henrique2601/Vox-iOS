//
//  AddPeoplePresenter.swift
//  Vox
//
//  Created by Santos, Paulo Henrique (external - Service) on 22/06/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class AddPeoplePresenter: AddPeoplePresenterProtocol {
    var view: AddPeopleViewProtocol!
    var interactor: AddPeopleInteractorInputProtocol!
    var router: AddPeopleRouterProtocol!
    
    func createNewPeople(_ people: MissingPeople, image: UIImage) {
        interactor.createNewPeople(people, image: image)
    }
}

extension AddPeoplePresenter: AddPeopleInteractorOutputProtocol {
    func peopleCreated() {
        view.showMessage(text: "Cadastrado com suscesso")
        view.clean()
    }
    
    func failToCreatePeopleWith(message: String) {
        view.showMessage(text: message)
    }
}
