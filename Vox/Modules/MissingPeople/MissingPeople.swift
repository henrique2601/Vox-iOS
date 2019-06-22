//
//  MissingPeople.swift
//  Vox
//
//  Created by Santos, Paulo Henrique (external - Service) on 22/06/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

struct MissingPeople: Decodable {
    var name: String
    var imageURL: String
    var gender: String
    var ethnicity: String
    var eyeColor: String
    var height: String
    var hairColor: String
    var city: String
    var state: String
    var type: String
    //var birthday: Date
}

enum PeopleType: String {
    case missing = "missing"
    case homeless = "homeless"
}
