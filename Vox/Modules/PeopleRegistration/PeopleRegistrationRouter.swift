//
//  PeopleRegistrationRouter.swift
//  Vox
//
//  Created by Paulo Henrique dos Santos on 11/05/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class PeopleRegistrationRouter: PeopleRegistrationRouterProtocol, TabBarViewProtocol {
    var tabIcon = UIImage(named:"peopleSearch")!
    var tabTitle = "Cadastrar pessoa"
    
    var storyboard: UIStoryboard {
        return UIStoryboard(name: "PeopleRegistration", bundle: Bundle.main)
    }
    
    func configuredViewController() -> UIViewController {
        let interactor = PeopleRegistrationInteractor()
        let presenter = PeopleRegistrationPresenter()
        let router = PeopleRegistrationRouter()
        let worker = PeopleRegistrationWorker()
        let viewController = storyboard.instantiateViewController(withIdentifier: "PeopleRegistration") as! PeopleRegistrationViewController
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.worker = worker
        return viewController
    }
}
