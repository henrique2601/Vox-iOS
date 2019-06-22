//
//  PeopleRegistrationWorker.swift
//  Vox
//
//  Created by Paulo Henrique dos Santos on 11/05/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class PeopleRegistrationWorker: PeopleRegistrationWorkerProtocol {
    func resgister(people: PeopleToRegister, completion: ((String) -> Void)!) {
        HttpService.request(
            path: "upload-face",
            method: .post,
            token: nil,
            headers: nil,
            parameters: ["name" : people.name],
            imageNames: ["file"],
            images: [people.image.jpegData(compressionQuality: 1)!]) { (response, error, seiLa) in
                if(error != nil){
                    completion("\(error!.localizedDescription)")
                }
                
                completion("Response: \(response.debugDescription)")
        }
    }
}
