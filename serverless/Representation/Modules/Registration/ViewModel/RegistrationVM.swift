//
//  RegistrationRegistrationVM.swift
//  serverless
//
//  Created by Maxym Sahaydak on 21/08/2018.
//  Copyright © 2018 TechMagic. All rights reserved.
//

protocol RegistrationVMProtocol {
    func register(with email: String, password: String, confirmPassword: String)
}

protocol RegistrationVMDelegate: class, BaseVCSpinnerProtocol, BaseVCMessagesProtocol {
    func didRegisterSuccess()
}

class RegistrationVM: RegistrationVMProtocol {

	weak var delegate: RegistrationVMDelegate?

	init(withDelegate delegate: RegistrationVMDelegate) {
        self.delegate = delegate
    }

    //MARK: - RegistrationVMProtocol

    func register(with email: String, password: String, confirmPassword: String) {
        let form = RegistrationForm(email: email, password: password, confirmPass: confirmPassword)
        let validationResult = form.isInputValid()
        guard validationResult.isValid else {
            delegate?.errorMessage(validationResult.errorMessages.first)
            return
        }
        delegate?.spinnerControl?.show()
        authDM.register(with: form, success: { [weak self] (user) in
            self?.delegate?.spinnerControl?.hide()
            self?.delegate?.didRegisterSuccess()
        }) { [weak self] (error) in
            self?.delegate?.spinnerControl?.hide()
            self?.delegate?.errorMessage(error?.localizedDescription)
        }
    }

    //MARK: - Private
    let authDM = AuthDM()
}
