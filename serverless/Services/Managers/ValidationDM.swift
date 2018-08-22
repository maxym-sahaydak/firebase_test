//
//  ValidationDM.swift
//  serverless
//
//  Created by Maxym Sahaydak on 8/22/18.
//  Copyright © 2018 TechMagic. All rights reserved.
//

import Foundation

protocol ValidationDMProtocol {
    func isEmailValid(_ email: String?) -> (isValid: Bool, errorStr: String?)
    func isPasswordValid(_ password: String?) -> (isValid: Bool, errorText: String?)
    func isNewPasswordValid(_ password: String?, retryPassword: String?) -> (isValid: Bool, errorText: String?)
}

class ValidationDM: ValidationDMProtocol {

    func isEmailValid(_ email: String?) -> (isValid: Bool, errorStr: String?) {
        guard let email = email else { return (false, "Email Empty")}
        if email.isEmpty {
            return (false, "Email Empty")
        }

        let validationRule = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        if !NSPredicate(format: "SELF MATCHES %@", validationRule).evaluate(with: email) {
            return (false, "Email Format not corect")
        }

        return (true, nil)
    }

    func isPasswordValid(_ password: String?) -> (isValid: Bool, errorText: String?) {
        guard let password = password else { return (false, "Password Empty")}
        if password.isEmpty {
            return (false, "Password Empty")
        }

        if password.count < 8 || password.count > 30  {
            return (false, "Password Length")
        }

        return (true, nil)
    }

    func isNewPasswordValid(_ password: String?, retryPassword: String?) -> (isValid: Bool, errorText: String?) {
        guard let password = password, let retryPassword = retryPassword else { return (false, "Password Empty") }
        if (password != retryPassword) {
            return (false, "Passwords not Equal")
        }

        return (true, nil)
    }

}
