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

    //MARK: -  Outlet

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var confirmPassTF: UITextField!


    //MARK: - Action

    @IBAction func backToLoginPressed(_ sender: Any) {
        router?.close()
    }

    @IBAction func registerBtnPressed(_ sender: Any) {
        viewModel?.register(with: emailTF.text ?? "", password: passwordTF.text ?? "", confirmPassword: confirmPassTF.text ?? "")
    }
    // MARK: - Private
    
    private var router: RegistrationRouterProtocol?
    private var viewModel: RegistrationVMProtocol?
}

extension RegistrationVC: RegistrationVMDelegate {

    func didRegisterSuccess() {
        router?.openMainScreen()
    }
}
