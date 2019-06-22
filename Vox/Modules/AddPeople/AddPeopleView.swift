//
//  AddPeopleView.swift
//  Vox
//
//  Created by Santos, Paulo Henrique (external - Service) on 22/06/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class AddPeopleView: UIViewController, AddPeopleViewProtocol {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblName: UITextField!
    @IBOutlet weak var lblType: UITextField!
    @IBOutlet weak var lblState: UITextField!
    @IBOutlet weak var lblCity: UITextField!
    @IBOutlet weak var btnAdd: UIButton!
    var imagePicker: ImagePicker!
    weak var pickerView: UIPickerView?
    
    var presenter: AddPeoplePresenterProtocol!
    var imageSelected = false
    var types = ["Morador de rua", "Desaparecido"]
    var states = ["RS", "SC", "SP", "TO"]
    var cities = ["Canoas", "Esteio", "Porto Alegre", "São Leopoldo"]
    
    func clean() {
        // peopleSearchImageHolder
        
    }
    
    func showMessage(text: String) {
        showAlertWith(message: text)
    }
    
    @IBAction func btnAddClicked(_ sender: Any) {
        let pessoa = MissingPeople(name: lblName.text ?? "", imageURL: "", city: lblCity.text ?? "", state: lblState.text ?? "", type: lblType.text ?? "")
        let image = imageView.image ?? UIImage()
        presenter.createNewPeople(pessoa, image: image)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnAdd.layer.cornerRadius = 16
        imagePicker = ImagePicker(presentationController: self, delegate: self)
        imageView.addTapGestureRecognizer {
            self.imagePicker.present(from: self.imageView)
        }
        
        hideKeyboardWhenTappedAround()
        configPickerView()
    }
    
    private func configPickerView() {
        //UIPICKER
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        lblType.delegate = self
        lblState.delegate = self
        lblCity.delegate = self
        
        lblType.inputView = pickerView
        lblState.inputView = pickerView
        lblCity.inputView = pickerView
        
        //It is important that goes after de inputView assignation
        self.pickerView = pickerView
    }
}

extension AddPeopleView: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        guard let image = image else {
            return
        }
        
        imageView.image = image
        imageSelected = true
    }
}

extension AddPeopleView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickerView?.reloadAllComponents()
    }
}

extension AddPeopleView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if lblType.isFirstResponder{
             lblType.text = types[row]
        }else if lblState.isFirstResponder{
            lblState.text = states[row]
        }else if lblCity.isFirstResponder{
            lblCity.text = cities[row]
        }
    }
}

extension AddPeopleView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if lblType.isFirstResponder{
            return types.count
        }else if lblState.isFirstResponder{
            return states.count
        }else if lblCity.isFirstResponder{
            return cities.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if lblType.isFirstResponder{
            return types[row]
        }else if lblState.isFirstResponder{
            return states[row]
        }else if lblCity.isFirstResponder{
            return cities[row]
        }
        return nil
    }
}
