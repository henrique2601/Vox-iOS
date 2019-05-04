//
//  PeopleRecognitionRouter.swift
//  Vox
//
//  Created by Paulo Henrique dos Santos on 04/05/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class PeopleRecognitionRouter: PeopleRecognitionRouterProtocol {
    var storyboard: UIStoryboard {
        return UIStoryboard(name: "PeopleRecognition", bundle: Bundle.main)
    }
    
    func build() -> UIViewController {
        let interactor = PeopleRecognitionInteractor()
        let presenter = PeopleRecognitionPresenter()
        let router = PeopleRecognitionRouter()
        let worker = PeopleRecognitionWorker()
        let viewController = storyboard.instantiateViewController(withIdentifier: "PeopleRecognition") as! PeopleRecognitionViewController
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.worker = worker
        return viewController
    }
}
