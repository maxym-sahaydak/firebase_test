//
//  LoginLoginVM.swift
//  serverless
//
//  Created by Maxym Sahaydak on 21/08/2018.
//  Copyright © 2018 TechMagic. All rights reserved.
//

protocol LoginVMProtocol {
    
}

protocol LoginVMDelegate: class { 

}

class LoginVM: LoginVMProtocol {

	weak var delegate: LoginVMDelegate?

	init(withDelegate delegate: LoginVMDelegate) {
        self.delegate = delegate
    }
}