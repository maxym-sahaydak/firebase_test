//
//  Item.swift
//  serverless
//
//  Created by Maxym Sahaydak on 8/23/18.
//  Copyright © 2018 TechMagic. All rights reserved.
//

import Foundation

struct CMLItem {
    var name: String?
    var imagesURL: [CMLImage]?

}

struct CMLImage {
    var url: String?
    var name: String?
    var thumbUrl: String?
    var key: String?
    var timestamp: NSNumber?
    var width: NSNumber?
    var height: NSNumber?

    init(with dictionary: Dictionary<String, Any>) {
        url = dictionary["url"] as? String
        name = dictionary["name"] as? String
        thumbUrl = dictionary["thumbUrl"] as? String
        width = dictionary["width"] as? NSNumber
        height = dictionary["height"] as? NSNumber
        timestamp = dictionary["height"] as? NSNumber
    }
}

class CMLImageForm: BaseForm {
    var url: String?
    var thumbUrl: String?
    var name: String?
    var key: String?
    var width: NSNumber?
    var height: NSNumber?
    var timestamp: NSNumber?

    func params() -> [String : Any] {
        var params: [String: Any] = [:]
        params[filterNil: "url"] = url
        params[filterNil: "thumbUrl"] = thumbUrl
        params[filterNil: "name"] = name
        params[filterNil: "key"] = key
        params[filterNil: "width"] = width
        params[filterNil: "height"] = height
        params[filterNil: "timestamp"] = timestamp
        return params
    }

}
