//
//  AuthService.swift
//  serverless
//
//  Created by Maxym Sahaydak on 8/20/18.
//  Copyright © 2018 TechMagic. All rights reserved.
//

import Foundation
import FirebaseAuth

protocol AuthProtocol {
    func register(with registratioForm: RegistrationForm, success: @escaping SuccessWithItemCallback<User>, failure: @escaping FailureCallback)
    func login(with loginForm: LoginForm, success: @escaping SuccessWithItemCallback<User>, failure: @escaping FailureCallback)
    func logOut(completion: @escaping SuccessCallback)
    func isLoggedIn() -> Bool
}

final class AuthDM: AuthProtocol {

    func logOut(completion: @escaping SuccessWithItemCallback<User>) {

    }

    func login(with loginForm: LoginForm, success: @escaping SuccessWithItemCallback<User>, failure: @escaping FailureCallback) {
        let operation = LoginOperation(loginForm: loginForm, success: success, failure: failure)
        let operationQueue = OperationQueue()
        operationQueue.addOperation(operation)
    }

    func register(with registratioForm: RegistrationForm, success: @escaping SuccessWithItemCallback<User>, failure: @escaping FailureCallback) {
        let operation = RegistrationOperation(registrationForm: registratioForm, success: success, failure: failure)
        let operationQueue = OperationQueue()
        operationQueue.addOperation(operation)
    }

    func logOut(completion: @escaping SuccessCallback) {

    }

    func isLoggedIn() -> Bool {
        return Auth.auth().currentUser != nil
    }

}
