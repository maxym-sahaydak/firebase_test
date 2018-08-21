//
//  LoginLoginVC.swift
//  serverless
//
//  Created by Maxym Sahaydak on 21/08/2018.
//  Copyright 2018 TechMagic. All rights reserved.
//

import UIKit

class LoginVC : BaseVC {

	override func viewDidLoad() {
        super.viewDidLoad()
        
        router = LoginRouter(withVC: self)
        viewModel = LoginVM(withDelegate: self)
    }

    // MARK: - Private
    
    private var router: LoginRouterProtocol?
    private var viewModel: LoginVMProtocol?
}

extension LoginVC: LoginVMDelegate {
	
}