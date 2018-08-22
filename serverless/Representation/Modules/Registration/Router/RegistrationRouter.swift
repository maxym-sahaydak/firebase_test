//
//  RegistrationRegistrationRouter.swift
//  serverless
//
//  Created by Maxym Sahaydak on 21/08/2018.
//  Copyright © 2018 TechMagic. All rights reserved.
//

import UIKit

protocol RegistrationRouterProtocol {

    func close()
    func openMainScreen()
}

class RegistrationRouter: BaseRouter, RegistrationRouterProtocol {

    func close() {
        viewController?.dismiss(animated: true, completion: nil)
    }

    func openMainScreen() {
        guard let vc = vc(withType: TMTabBarVC.self, fromStoryboard: .main) else { return }
        open(vc)
    }

}
