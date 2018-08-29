//
//  BrowseBrowseRouter.swift
//  serverless
//
//  Created by Maxym Sahaydak on 22/08/2018.
//  Copyright © 2018 TechMagic. All rights reserved.
//

import UIKit

protocol BrowseRouterProtocol {
    func showImageInfo(cmlImage: CMLImage)
}

class BrowseRouter: BaseRouter, BrowseRouterProtocol {

    func showImageInfo(cmlImage: CMLImage) {
        guard let vc = vc(withType: PreviewVC.self, fromStoryboard: .browse) else { return }
        vc.setCMLImage(cmlImage)
        open(vc)
    }

}
