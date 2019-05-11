//
//  PeopleRecognitionInteractor.swift
//  Vox
//
//  Created by Paulo Henrique dos Santos on 04/05/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class PeopleRecognitionInteractor: PeopleRecognitionInteractorInputProtocol {
    var presenter: PeopleRecognitionInteractorOutputProtocol?
    var worker: PeopleRecognitionWorkerProtocol?
    
    func searchPeople(_ image: UIImage) {
        worker?.searchPeople(image, completion: { (response) in
            self.presenter?.peopleSearchDidReturn(response: response)
        })
    }
}
