//
//  LoginLoginVM.swift
//  serverless
//
//  Created by Maxym Sahaydak on 21/08/2018.
//  Copyright © 2018 TechMagic. All rights reserved.
//

protocol LoginVMProtocol {
    func login(with email: String?, password: String?)
}

protocol LoginVMDelegate: class, BaseVCMessagesProtocol, BaseVCSpinnerProtocol {
    func didLoginSuccess()
}

class LoginVM: LoginVMProtocol {

	weak var delegate: LoginVMDelegate?

	init(withDelegate delegate: LoginVMDelegate) {
        self.delegate = delegate
    }

    //MARK: - LoginVMProtocol

    func login(with email: String?, password: String?) {
        delegate?.spinnerControl?.show()
        guard let email = email, let password = password else { return }
        let loginForm = LoginForm(email: email, password: password)
        authDM.login(with: loginForm, success: { [weak self] (user) in
            self?.delegate?.spinnerControl?.hide()
            self?.delegate?.didLoginSuccess()
            self?.delegate?.infoMessage("Succes", message: "Did login success!!!")
        }) { [weak self] (error) in
            self?.delegate?.spinnerControl?.hide()
            self?.delegate?.errorMessage(error?.localizedDescription)
        }
    }

    //MARK: - Private

    let authDM = AuthDM()
}
