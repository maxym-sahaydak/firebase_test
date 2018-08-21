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

final class AuthOperation: AsyncOperation {
    typealias AuthCompletion = SuccessWithItemCallback<User>
    let registrationForm: RegistrationForm
//    let loginForm: LoginForm
    let completion: AuthCompletion?
//    init(loginForm: LoginForm, completion: AuthCompletion?) {
//        self.loginForm = loginForm
//        self.registrationForm = loginForm
//        self.completion = completion
//    }
    
@discardableResult
    init(registrationForm: RegistrationForm, completion: AuthCompletion?) {
        self.registrationForm = registrationForm
//        self.loginForm = registrationForm
        self.completion = completion
    }

    override func execute() {
        Auth.auth().createUser(withEmail: registrationForm.email, password: registrationForm.password) { (result, error) in
            self.completion?(result!.user)
        }
//        Auth.auth().signIn(withEmail: loginForm.email, password: loginForm.password) { (result, error) in
//            self.completion
//        }
    }
}

//MARK:

extension AuthOperation {
    func completeLogin(_ authUser: User?, _ authError: Error?) {

    }
}
