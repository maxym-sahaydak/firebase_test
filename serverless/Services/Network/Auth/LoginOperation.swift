//
//  LoginOperation.swift
//  serverless
//
//  Created by Maxym Sahaydak on 8/21/18.
//  Copyright © 2018 TechMagic. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

final class LoginOperation: AsyncOperation {
    typealias AuthCompletion = SuccessWithItemCallback<User>
    let loginForm: LoginForm
    let successHandler: AuthCompletion?
    let failureHandler: FailureCallback?

    @discardableResult
    init(loginForm: LoginForm, success: AuthCompletion?, failure: FailureCallback?) {
        self.loginForm = loginForm
        self.successHandler = success
        self.failureHandler = failure
    }

    override func execute() {
        Auth.auth().signIn(withEmail: loginForm.email, password: loginForm.password, completion: loginCompletion(_: _:))
    }

}

fileprivate extension LoginOperation {
    func loginCompletion(_ result: AuthDataResult?, _ error: Error?) {
        if let user = result?.user, error == nil {
            self.successHandler?(user)
        } else {
            self.failureHandler?(error)
        }
        finish(withIsFailed: error != nil)
    }
}
