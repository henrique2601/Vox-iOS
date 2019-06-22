//
//  MissingPeopleProtocols.swift
//  Vox
//
//  Created by Santos, Paulo Henrique (external - Service) on 22/06/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

protocol MissingPeopleViewProtocol: class {
    var presenter: MissingPeoplePresenterProtocol! { get set }
    
    // Add here your methods for communication PRESENTER -> VIEW
    func reload()
    func showErrorMessage(message: String)
    func setTitle(_ title: String)
}

protocol MissingPeoplePresenterProtocol: class {
    var view: MissingPeopleViewProtocol! { get set }
    var interactor: MissingPeopleInteractorInputProtocol! { get set }
    var router: MissingPeopleRouterProtocol! { get set }
    var peopleType: PeopleType! { get set }
    var peopleList: [MissingPeople] { get }
    
    // Add here your methods for communication VIEW -> PRESENTER
    func viewWillAppear()
    func addPeopleTouched()
    func cellTouched(at IndexPath: IndexPath)
}

protocol MissingPeopleInteractorInputProtocol: class {
    var presenter: MissingPeopleInteractorOutputProtocol! { get set }
    
    // Add here your methods for communication PRESENTER -> INTERACTOR
    func fetchPeople(peopleType: PeopleType)
}

protocol MissingPeopleInteractorOutputProtocol: class {
    // Add here your methods for communication INTERACTOR -> PRESENTER
    func peopleFetched(people: [MissingPeople])
    func failToFetchPeopleWith(message: String)
}

protocol MissingPeopleRouterProtocol: class {
    var peopleType: PeopleType! { get set }
    // Add here your methods for communication PRESENTER -> ROUTER
    func configuredViewController() -> UIViewController
    func presentDetailScreen(people: MissingPeople)
    func presentAddScreen()
}
