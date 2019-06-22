//
//  MissingPeopleCell.swift
//  Vox
//
//  Created by Santos, Paulo Henrique (external - Service) on 22/06/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class MissingPeopleCell: UICollectionViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    
    func configureWith(people: MissingPeople) {
        lblName.text = people.name
        lblLocation.text = "\(people.city)/\(people.state)"
        
        profileImage.image = UIImage(named: "peopleSearch")
        
        guard let url = URL(string: people.imageURL), people.imageURL != "" else { return }
        
        DispatchQueue.global().async {
            let data = try? Data(contentsOf: url)
            
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                   self.profileImage.image = image
                }
            }
        }
    }
}
