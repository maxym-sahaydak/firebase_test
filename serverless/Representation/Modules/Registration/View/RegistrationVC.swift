//
//  RegistrationRegistrationVC.swift
//  serverless
//
//  Created by Maxym Sahaydak on 21/08/2018.
//  Copyright 2018 TechMagic. All rights reserved.
//

import UIKit

class RegistrationVC : BaseVC {

	override func viewDidLoad() {
        super.viewDidLoad()
        
        router = RegistrationRouter(withVC: self)
        viewModel = RegistrationVM(withDelegate: self)
    }

    // MARK: - Private
    
    private var router: RegistrationRouterProtocol?
    private var viewModel: RegistrationVMProtocol?
}

extension RegistrationVC: RegistrationVMDelegate {
	
}