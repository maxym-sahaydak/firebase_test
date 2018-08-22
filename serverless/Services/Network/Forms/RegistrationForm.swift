//
//  RegistrationForm.swift
//  serverless
//
//  Created by Maxym Sahaydak on 8/20/18.
//  Copyright © 2018 TechMagic. All rights reserved.
//

import Foundation

class RegistrationForm: BaseForm {

    var email: String
    var password: String
    var confirmPass: String

    init(email: String, password: String, confirmPass: String) {
        self.email = email
        self.password = password
        self.confirmPass = confirmPass
    }
}

extension RegistrationForm: FormValidationProtocol {

    func isInputValid() -> (isValid: Bool, errorMessages: [String]) {
        guard let validationDM = validationDM else { return (false, []) }

        var errorMsgs: [String?] = []
        errorMsgs.append(validationDM.isEmailValid(email).errorStr)
        errorMsgs.append(validationDM.isNewPasswordValid(password, retryPassword: confirmPass).errorText)
        let messages = errorMsgs.compactMap{ $0 }
        return (messages.isEmpty, messages)

    }
}
