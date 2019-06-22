//
//  MissingPeopleInteractor.swift
//  Vox
//
//  Created by Santos, Paulo Henrique (external - Service) on 22/06/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit
import FirebaseFirestore

class MissingPeopleInteractor: MissingPeopleInteractorInputProtocol {
    var presenter: MissingPeopleInteractorOutputProtocol!
    let db = Firestore.firestore()
    
    func fetchPeople(peopleType: PeopleType) {
        db.collection("people")
            .whereField("type", isEqualTo: peopleType.rawValue)
            .getDocuments { [weak self] (snapshot, error) in
                if let error = error {
                    self?.presenter.failToFetchPeopleWith(message: error.localizedDescription)
                }
                
                guard let safeSnapshot = snapshot, !safeSnapshot.isEmpty else {
                    self?.presenter.failToFetchPeopleWith(message: "sem valores retornados")
                    return
                }
                
                var peopleList: [MissingPeople] = []
                
                for document in safeSnapshot.documents {
                    if let people = try? JSONDecoder().decode(MissingPeople.self, fromJSONObject: document.data()) {
                        peopleList.append(people)
                    }
                }
                
                self?.presenter.peopleFetched(people: peopleList)
        }
        
        //presenter.failToFetchPeopleWith(message: "fail")
    }
}
