//
//  PeopleRecognitionView.swift
//  Vox
//
//  Created by Paulo Henrique dos Santos on 04/05/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class PeopleRecognitionViewController: UIViewController, PeopleRecognitionViewProtocol {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet weak var lblResponse: UILabel!
    
    var presenter: PeopleRecognitionPresenterProtocol?
    var imagePicker: ImagePicker!
    
    func update(response: String) {
        DispatchQueue.main.async {
            self.lblResponse.text = response
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Buscar pessoa"
        
        imagePicker = ImagePicker(presentationController: self, delegate: self)
        imageView.addTapGestureRecognizer {
            self.imagePicker.present(from: self.imageView)
        }
    }
}

extension PeopleRecognitionViewController: ImagePickerDelegate {
    
    func didSelect(image: UIImage?) {
        guard let image = image else {
            return
        }
        
        imageView.image = image
        imageView.backgroundColor = UIColor.clear
        presenter?.searchPeople(image)
    }
}
