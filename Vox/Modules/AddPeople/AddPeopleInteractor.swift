//
//  AddPeopleInteractor.swift
//  Vox
//
//  Created by Santos, Paulo Henrique (external - Service) on 22/06/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit
import FirebaseStorage
import FirebaseFirestore

class AddPeopleInteractor: AddPeopleInteractorInputProtocol {
    var presenter: AddPeopleInteractorOutputProtocol!
    let db = Firestore.firestore()
    
    func createNewPeople(_ people: MissingPeople, image: UIImage) {
        let storageRef = Storage.storage().reference().child("\(UUID().uuidString).png")
        if let uploadData = image.pngData() {
            storageRef.putData(uploadData, metadata: nil) { (metadata, error) in
                storageRef.downloadURL { (url, error) in
                    guard let downloadURL = url else {
                        // Uh-oh, an error occurred!
                        self.presenter.failToCreatePeopleWith(message: "falha no upload")
                        return
                    }
                    var newPeople = people
                    newPeople.imageURL = downloadURL.absoluteString
                    self.uploadePeopleToStore(people: newPeople)
                }
            }
        }
    }
    
    private func uploadePeopleToStore(people: MissingPeople) {
        // Add a new document with a generated id.
        db.collection("people").addDocument(data: [
            "name": people.name,
            "imageURL": people.imageURL,
            "city": people.city,
            "state": people.state,
            "type": people.type,
        ]) { err in
            if let err = err {
                self.presenter.failToCreatePeopleWith(message: err.localizedDescription)
            } else {
                self.presenter.peopleCreated()
            }
        }
    }
}
