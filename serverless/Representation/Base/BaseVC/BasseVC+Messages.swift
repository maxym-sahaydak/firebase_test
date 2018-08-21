//
//  BasseVC+Messages.swift
//  serverless
//
//  Created by Maxym Sahaydak on 8/21/18.
//  Copyright © 2018 TechMagic. All rights reserved.
//

import UIKit

extension BaseVC: BaseVCMessagesProtocol {

    func errorMessage(_ errorMessage: String?) {
        //        guard let errorMessage =  errorMessage else { return }
        let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    func infoMessage(_ title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}
