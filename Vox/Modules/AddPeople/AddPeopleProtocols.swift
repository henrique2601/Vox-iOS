//
//  AddPeopleProtocol.swift
//  Vox
//
//  Created by Santos, Paulo Henrique (external - Service) on 22/06/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

protocol AddPeopleViewProtocol: class {
    var presenter: AddPeoplePresenterProtocol! { get set }
    
    // Add here your methods for communication PRESENTER -> VIEW
    func clean()
}

protocol AddPeoplePresenterProtocol: class {
    var view: AddPeopleViewProtocol! { get set }
    var interactor: AddPeopleInteractorInputProtocol! { get set }
    var router: AddPeopleRouterProtocol! { get set }
    
    // Add here your methods for communication VIEW -> PRESENTER
    func createNewPeople(_ people: MissingPeople)
}

protocol AddPeopleInteractorInputProtocol: class {
    var presenter: AddPeopleInteractorOutputProtocol! { get set }
    
    // Add here your methods for communication PRESENTER -> INTERACTOR
    func createNewPeople(_ people:MissingPeople)
}

protocol AddPeopleInteractorOutputProtocol: class {
    // Add here your methods for communication INTERACTOR -> PRESENTER
    func peopleCreated()
    func failToCreatePeopleWith(message: String)
}

protocol AddPeopleRouterProtocol: class {
    // Add here your methods for communication PRESENTER -> ROUTER
    func configuredViewController() -> UIViewController
}
