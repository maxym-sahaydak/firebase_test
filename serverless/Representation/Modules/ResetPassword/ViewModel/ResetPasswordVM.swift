//
//  ResetPasswordResetPasswordVM.swift
//  serverless
//
//  Created by Maxym Sahaydak on 22/08/2018.
//  Copyright © 2018 TechMagic. All rights reserved.
//

protocol ResetPasswordVMProtocol {
    
}

protocol ResetPasswordVMDelegate: class { 

}

class ResetPasswordVM: ResetPasswordVMProtocol {

	weak var delegate: ResetPasswordVMDelegate?

	init(withDelegate delegate: ResetPasswordVMDelegate) {
        self.delegate = delegate
    }
}