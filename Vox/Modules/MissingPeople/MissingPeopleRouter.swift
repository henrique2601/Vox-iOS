//
//  MissingPeopleRouter.swift
//  Vox
//
//  Created by Santos, Paulo Henrique (external - Service) on 22/06/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class MissingPeopleRouter: MissingPeopleRouterProtocol , TabBarViewProtocol {
    var tabIcon = UIImage(named:"peopleSearch")!
    var tabTitle = "Cadastrar pessoa"
    var peopleType: PeopleType!
    
    var storyboard: UIStoryboard {
        return UIStoryboard(name: "MissingPeopleView", bundle: Bundle.main)
    }
    
    func configuredViewController() -> UIViewController {
        let interactor = MissingPeopleInteractor()
        let presenter = MissingPeoplePresenter()
        let router = MissingPeopleRouter()
        let viewController = storyboard.instantiateViewController(withIdentifier: "MissingPeopleView") as! MissingPeopleView
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.peopleType = peopleType
        presenter.router = router
        interactor.presenter = presenter
        return viewController
    }
    
    func presentDetailScreen(people: MissingPeople) {
        //
    }
    
    func presentAddScreen() {
        //
    }
    

}
