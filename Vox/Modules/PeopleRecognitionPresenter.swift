//
//  PeopleRecognitionPresenter.swift
//  Vox
//
//  Created by Paulo Henrique dos Santos on 04/05/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class PeopleRecognitionPresenter: PeopleRecognitionPresenterProtocol {
    var view: PeopleRecognitionViewProtocol?
    var interactor: PeopleRecognitionInteractorInputProtocol?
    var router: PeopleRecognitionRouterProtocol?
    
    func searchPeople(_ image: UIImage) {
        interactor?.searchPeople(image)
    }
}

extension PeopleRecognitionPresenter: PeopleRecognitionInteractorOutputProtocol {
    func peopleSearchDidReturn(response: String) {
        view?.update(response: response)
    }
}
