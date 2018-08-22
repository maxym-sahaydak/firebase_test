//
//  File.swift
//  serverless
//
//  Created by Maxym Sahaydak on 8/22/18.
//  Copyright © 2018 TechMagic. All rights reserved.
//

import Foundation

protocol FormValidationProtocol {
    func isInputValid() -> (isValid: Bool, errorMessages:[String])
}
