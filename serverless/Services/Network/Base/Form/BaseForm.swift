//
//  BaseForm.swift
//  serverless
//
//  Created by Maxym Sahaydak on 8/20/18.
//  Copyright © 2018 TechMagic. All rights reserved.
//

import Foundation

protocol BaseForm {
    func params() -> [String: Any]
    func query() -> String
}

extension BaseForm {

    func params() -> [String: Any] {
        return [:]
    }

    func query() -> String {
        return ""
    }
    
}
