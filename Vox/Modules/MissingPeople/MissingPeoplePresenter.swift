//
//  MissingPeoplePresenter.swift
//  Vox
//
//  Created by Santos, Paulo Henrique (external - Service) on 22/06/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class MissingPeoplePresenter: MissingPeoplePresenterProtocol {
    var peopleList: [MissingPeople] = []
    var view: MissingPeopleViewProtocol!
    var interactor: MissingPeopleInteractorInputProtocol!
    var router: MissingPeopleRouterProtocol!
    var peopleType: PeopleType!
    
    func viewWillAppear() {
        peopleList = []
        view.reload()
        
        if peopleType == .homeless {
            view.setTitle("Moradores de rua")
        } else {
            view.setTitle("Desaparecidos")
        }
        interactor.fetchPeople(peopleType: peopleType)
    }
    
    func addPeopleTouched() {
        router.presentAddScreen()
    }
    
    func cellTouched(at IndexPath: IndexPath) {
        //
        
       // router.presentDetailScreen(people: people)
    }
}

extension MissingPeoplePresenter: MissingPeopleInteractorOutputProtocol {
    func peopleFetched(people: [MissingPeople]) {
        peopleList = people
        view.reload()
    }
    
    func failToFetchPeopleWith(message: String) {
        view.showErrorMessage(message: message)
    }
    
    
}
