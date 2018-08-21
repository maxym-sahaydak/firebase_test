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
    func register(with registratioForm: RegistrationForm, completion: @escaping SuccessWithItemCallback<User>)
}

final class AuthService: AuthProtocol {
    func register(with registratioForm: RegistrationForm, completion: @escaping (User) -> ()) {
        let operation = AuthOperation(registrationForm: registratioForm, completion: completion)
        let operationQueue = OperationQueue()
        operationQueue.addOperation(operation)
    }






}
