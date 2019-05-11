//
//  PeopleRegistrationInteractorInput.swift
//  Vox
//
//  Created by Paulo Henrique dos Santos on 11/05/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class PeopleRegistrationInteractor: PeopleRegistrationInteractorInputProtocol {
    var presenter: PeopleRegistrationInteractorOutputProtocol?
    var worker: PeopleRegistrationWorkerProtocol?
    
    func resgister(people: PeopleToRegister) {
        worker?.resgister(people: people, completion: { (reponse) in
            self.presenter?.peopleRegisterDidReturn(response: reponse)
        })
    }
}
