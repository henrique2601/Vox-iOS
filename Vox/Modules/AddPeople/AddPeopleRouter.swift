//
//  AddPeopleRouter.swift
//  Vox
//
//  Created by Santos, Paulo Henrique (external - Service) on 22/06/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class AddPeopleRouter: AddPeopleRouterProtocol , TabBarViewProtocol {
    var tabIcon = UIImage(named:"peopleSearch")!
    var tabTitle = "Cadastrar pessoa"
    
    var storyboard: UIStoryboard {
        return UIStoryboard(name: "AddPeopleView", bundle: Bundle.main)
    }
    
    func configuredViewController() -> UIViewController {
        let interactor = AddPeopleInteractor()
        let presenter = AddPeoplePresenter()
        let router = AddPeopleRouter()
        let viewController = storyboard.instantiateViewController(withIdentifier: "AddPeopleView") as! AddPeopleView
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        return viewController
    }
}
