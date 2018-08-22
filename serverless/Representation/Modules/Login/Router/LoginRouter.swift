//
//  LoginLoginRouter.swift
//  serverless
//
//  Created by Maxym Sahaydak on 21/08/2018.
//  Copyright © 2018 TechMagic. All rights reserved.
//

import UIKit

protocol LoginRouterProtocol {
    func showMainController()
    func openResetPass()
    func openRegistration()
}

class LoginRouter: BaseRouter, LoginRouterProtocol {

    func showMainController() {
        guard let vc = vc(withType: TMTabBarVC.self, fromStoryboard: .main) else { return }
        open(vc)
    }

    func openResetPass() {
        guard let vc = vc(withType: ResetPasswordVC.self, fromStoryboard: .onboarding) else { return }
        open(vc)
    }

    func openRegistration() {
        guard let vc = vc(withType: RegistrationVC.self, fromStoryboard: .onboarding) else { return }
        open(vc)
    }
}
