//
//  Spinner.swift
//  serverless
//
//  Created by Maxym Sahaydak on 8/21/18.
//  Copyright © 2018 TechMagic. All rights reserved.
//

import Foundation
import SVProgressHUD

class Spinner: SpinnerControlProtocol {

    var parent: UIViewController

    init(with parent: UIViewController) {
        self.parent = parent
    }

    func show() {
        DispatchQueue.main.async {
            SVProgressHUD.show()
        }
    }

    func hide() {
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
}
