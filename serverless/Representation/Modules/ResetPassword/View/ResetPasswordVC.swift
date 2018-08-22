//
//  ResetPasswordResetPasswordVC.swift
//  serverless
//
//  Created by Maxym Sahaydak on 22/08/2018.
//  Copyright 2018 TechMagic. All rights reserved.
//

import UIKit

class ResetPasswordVC : BaseVC {

	override func viewDidLoad() {
        super.viewDidLoad()
        
        router = ResetPasswordRouter(withVC: self)
        viewModel = ResetPasswordVM(withDelegate: self)
    }

    @IBAction func backToLoginPressed(_ sender: Any) {
        router?.close()
    }
    // MARK: - Private
    
    private var router: ResetPasswordRouterProtocol?
    private var viewModel: ResetPasswordVMProtocol?
}

extension ResetPasswordVC: ResetPasswordVMDelegate {
	
}
