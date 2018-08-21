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

    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
