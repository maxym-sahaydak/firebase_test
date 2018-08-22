//
//  BaseForm.swift
//  serverless
//
//  Created by Maxym Sahaydak on 8/20/18.
//  Copyright © 2018 TechMagic. All rights reserved.
//

import Foundation

class BaseForm: BaseFormProtocol {

    var validationDM: ValidationDMProtocol?

    init() {
    self.validationDM = ValidationDM()
    }

}

protocol BaseFormProtocol {
    func params() -> [String: Any]
    func query() -> String
}

extension BaseFormProtocol {

    
    func params() -> [String: Any] {
        return [:]
    }

    func query() -> String {
        return ""
    }
    
}
