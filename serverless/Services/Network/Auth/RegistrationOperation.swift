//
//  Auth.swift
//  serverless
//
//  Created by Maxym Sahaydak on 8/20/18.
//  Copyright © 2018 TechMagic. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

final class RegistrationOperation: AsyncOperation {
    typealias AuthCompletion = SuccessWithItemCallback<User>
    let registrationForm: RegistrationForm
    let successHandler: AuthCompletion?
    let failureHandler: FailureCallback?
    
@discardableResult
    init(registrationForm: RegistrationForm, success: AuthCompletion?, failure: FailureCallback?) {
        self.registrationForm = registrationForm
        self.successHandler = success
        self.failureHandler = failure
    }

    override func execute() {
        Auth.auth().createUser(withEmail: registrationForm.email, password: registrationForm.password, completion: registrationCompletion(_:_:))
    }
}

//MARK:

extension RegistrationOperation {
    func registrationCompletion(_ result: AuthDataResult?, _ error: Error?) {
        if let user = result?.user, error == nil {
            self.successHandler?(user)
        } else {
            self.failureHandler?(error)
        }
        finish(withIsFailed: error != nil)
    }
}
