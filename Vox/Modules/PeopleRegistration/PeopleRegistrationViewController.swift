//
//  PeopleRegistrationView.swift
//  Vox
//
//  Created by Paulo Henrique dos Santos on 11/05/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class PeopleRegistrationViewController: UIViewController, PeopleRegistrationViewProtocol {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var lblResponse: UILabel!
    
    var presenter: PeopleRegistrationPresenterProtocol?
    var imagePicker: ImagePicker!
    var imageSelected = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Cadastrar pessoa"
        
        imagePicker = ImagePicker(presentationController: self, delegate: self)
        imageView.addTapGestureRecognizer {
            self.imagePicker.present(from: self.imageView)
        }
        
        hideKeyboardWhenTappedAround()
        
        txtName.delegate = self
    }
    
    func update(response: String) {
        DispatchQueue.main.async {
            self.imageView.image = UIImage(named: "peopleSearchImageHolder")
            self.imageSelected = false
            self.txtName.text = ""
            self.lblResponse.text = response
            self.viewDidLayoutSubviews()
        }
    }
    
    @IBAction func registerClicked(_ sender: Any) {
        guard let name = txtName.text, name != "" else {
            lblResponse.text = "Por favor digite o nome"
            return
        }
        
        guard let image = imageView.image, imageSelected else {
            lblResponse.text = "Por favor selecione a imagem"
            return
        }
        
        let people = PeopleToRegister(name: name, image: image)
        presenter?.resgister(people: people)
    }
}

extension PeopleRegistrationViewController: ImagePickerDelegate {
    
    func didSelect(image: UIImage?) {
        guard let image = image else {
            return
        }
        
        imageView.image = image
        imageSelected = true
    }
}

extension PeopleRegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        dismissKeyboard()
        return true
    }
}
