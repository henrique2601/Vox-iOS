//
//  PeopleRecognitionProtocols.swift
//  Vox
//
//  Created by Paulo Henrique dos Santos on 04/05/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

protocol PeopleRecognitionViewProtocol: class {
    var presenter: PeopleRecognitionPresenterProtocol? { get set }
    
    // Add here your methods for communication PRESENTER -> VIEW
    func update(response: String)
}


protocol PeopleRecognitionPresenterProtocol: class {
    var view: PeopleRecognitionViewProtocol? { get set }
    var interactor: PeopleRecognitionInteractorInputProtocol? { get set }
    var router: PeopleRecognitionRouterProtocol? { get set }
    
    // Add here your methods for communication VIEW -> PRESENTER
    func searchPeople(_ image: UIImage)
}

protocol PeopleRecognitionInteractorInputProtocol: class {
    var presenter: PeopleRecognitionInteractorOutputProtocol? { get set }
    var worker: PeopleRecognitionWorkerProtocol? { get set }
    
    // Add here your methods for communication PRESENTER -> INTERACTOR
    func searchPeople(_ image: UIImage)
}

protocol PeopleRecognitionWorkerProtocol: class {
    // Add here your methods for communication INTERACTOR -> WORKER
    func searchPeople(_ image: UIImage, completion: ((String) -> Void)!)
}

protocol PeopleRecognitionInteractorOutputProtocol: class {
    var view: PeopleRecognitionViewProtocol? { get set }
    
    // Add here your methods for communication INTERACTOR -> PRESENTER
    func peopleSearchDidReturn(response: String)
}

protocol PeopleRecognitionRouterProtocol: class {
    // Add here your methods for communication PRESENTER -> ROUTER
}
