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

    //MARK: - Outlets

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!

    //MARK: - IBAction

    @IBAction func forgotPasswordBtnPressed(_ sender: Any) {
    }

    @IBAction func logInBtnPressed(_ sender: Any) {
        viewModel?.login(with: emailTF.text, password: passwordTF.text)
    }
    // MARK: - Private
    
    private var router: LoginRouterProtocol?
    private var viewModel: LoginVMProtocol?
}

extension LoginVC: LoginVMDelegate {

    func didLoginSuccess() {
        
    }

	
}
