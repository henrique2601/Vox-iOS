//
//  ViewControllerExtension.swift
//  Vox
//
//  Created by Paulo Henrique dos Santos on 11/05/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func showAlertWith(message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
            alert.dismiss(animated: false, completion: nil)
        }
        alert.addAction(OKAction)
        self.present(alert, animated: false)
    }
}

extension JSONDecoder {
    func decode<T>(_ type: T.Type, fromJSONObject object: Any) throws -> T where T: Decodable {
        return try decode(T.self, from: try JSONSerialization.data(withJSONObject: object, options: []))
    }
}
