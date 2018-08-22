//
//  ResetPasswordResetPasswordRouter.swift
//  serverless
//
//  Created by Maxym Sahaydak on 22/08/2018.
//  Copyright © 2018 TechMagic. All rights reserved.
//

import UIKit

protocol ResetPasswordRouterProtocol {
    func close()
}

class ResetPasswordRouter: BaseRouter, ResetPasswordRouterProtocol {

    func close() {
        viewController?.dismiss(animated: true, completion: nil)
    }

}
