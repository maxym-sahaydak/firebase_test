//
//  RegistrationRegistrationVM.swift
//  serverless
//
//  Created by Maxym Sahaydak on 21/08/2018.
//  Copyright © 2018 TechMagic. All rights reserved.
//

protocol RegistrationVMProtocol {
    
}

protocol RegistrationVMDelegate: class { 

}

class RegistrationVM: RegistrationVMProtocol {

	weak var delegate: RegistrationVMDelegate?

	init(withDelegate delegate: RegistrationVMDelegate) {
        self.delegate = delegate
    }
}