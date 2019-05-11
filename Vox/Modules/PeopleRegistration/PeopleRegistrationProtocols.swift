//
//  PeopleRegistrationProtocols.swift
//  Vox
//
//  Created by Paulo Henrique dos Santos on 11/05/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

protocol PeopleRegistrationViewProtocol: class {
    var presenter: PeopleRegistrationPresenterProtocol? { get set }
    
    // Add here your methods for communication PRESENTER -> VIEW
    func update(response: String)
}

protocol PeopleRegistrationPresenterProtocol: class {
    var view: PeopleRegistrationViewProtocol? { get set }
    var interactor: PeopleRegistrationInteractorInputProtocol? { get set }
    var router: PeopleRegistrationRouterProtocol? { get set }
    
    // Add here your methods for communication VIEW -> PRESENTER
    func resgister(people: PeopleToRegister)
}

protocol PeopleRegistrationInteractorInputProtocol: class {
    var presenter: PeopleRegistrationInteractorOutputProtocol? { get set }
    var worker: PeopleRegistrationWorkerProtocol? { get set }
    
    // Add here your methods for communication PRESENTER -> INTERACTOR
    func resgister(people: PeopleToRegister)
}

protocol PeopleRegistrationWorkerProtocol: class {
    // Add here your methods for communication INTERACTOR -> WORKER
    func resgister(people: PeopleToRegister, completion: ((String) -> Void)!)
    
}

protocol PeopleRegistrationInteractorOutputProtocol: class {    
    // Add here your methods for communication INTERACTOR -> PRESENTER
    func peopleRegisterDidReturn(response: String)
}

protocol PeopleRegistrationRouterProtocol: class {
    // Add here your methods for communication PRESENTER -> ROUTER
    func configuredViewController() -> UIViewController
}
