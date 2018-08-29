//
//  PreviewPreviewRouter.swift
//  serverless
//
//  Created by Maxym Sahaydak on 29/08/2018.
//  Copyright © 2018 TechMagic. All rights reserved.
//

import UIKit

protocol PreviewRouterProtocol {
    func close()
}

class PreviewRouter: BaseRouter, PreviewRouterProtocol {

    func close() {
        viewController?.dismiss(animated: true, completion: nil)
    }

}
