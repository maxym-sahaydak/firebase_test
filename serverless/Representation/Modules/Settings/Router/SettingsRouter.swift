//
//  SettingsSettingsRouter.swift
//  serverless
//
//  Created by Maxym Sahaydak on 22/08/2018.
//  Copyright © 2018 TechMagic. All rights reserved.
//

import UIKit

protocol SettingsRouterProtocol {
    func showLogin()
}

class SettingsRouter: BaseRouter, SettingsRouterProtocol {

    func showLogin() {
        guard let vc = vc(withType: LoginVC.self, fromStoryboard: .onboarding) else { return }
        UIApplication.shared.keyWindow?.rootViewController = vc
    }

}
