//
//  Dictionary+Extensions.swift
//  serverless
//
//  Created by Maxym Sahaydak on 8/23/18.
//  Copyright © 2018 TechMagic. All rights reserved.
//

import Foundation

extension Dictionary where Value == Any {

    subscript (filterNil key: Key) -> Any? {
        get {
            return self[key]
        }
        set(newValue) {
            if let value = newValue {
                self[key] = value
            }
        }
    }

}
