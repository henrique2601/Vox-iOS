//
//  LoginView.swift
//  Vox
//
//  Created by Santos, Paulo Henrique (external - Service) on 21/06/19.
//  Copyright © 2019 Paulo Henrique dos Santos. All rights reserved.
//

import UIKit

class LoginView: UIViewController, LoginViewProtocol {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnSignup: UIButton!
    
    var presenter: LoginPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        btnLogin.layer.cornerRadius = 16
        btnSignup.layer.cornerRadius = 16
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    func startLoadingAnimation() {
        activityIndicator.startAnimating()
        view.isUserInteractionEnabled = false
    }
    
    func stopLoadingAnimation() {
        activityIndicator.stopAnimating()
        view.isUserInteractionEnabled = true
    }
    
    func showErrorMessage(message: String) {
        showAlertWith(message: message)
    }
    
    //Actions
    @IBAction func forgotPasswordClicked(_ sender: Any) {
        presenter.forgotPasswordClicked()
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        presenter.loginWith(username: txtUsername.text ?? "", password: txtPassword.text ?? "")
    }
    
    @IBAction func SignupClicked(_ sender: Any) {
        presenter.signupClicked()
    }
}
