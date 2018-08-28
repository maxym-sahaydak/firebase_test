//
//  ContentPickerMode.swift
//  SocioLocal
//
//  Created by Alex Kunitsa on 11/17/17.
//  Copyright © 2017 TechMagic. All rights reserved.
//

import Foundation
import MobileCoreServices
import UIKit

enum ContentPickerMode {
    
    case photoAndVideo
    case photo
    case video
}

enum ContentPickerSource {
    
    case camera(ContentPickerMode)
    case library(ContentPickerMode)
    
    func title() -> String {
        switch self {
        case .camera(let mode):
            switch mode {
            case .photo:
                return "Photo"
            case .video:
                return "Video"
            case .photoAndVideo:
                return "Photo And Video"
            }
        case .library(let mode):
            switch mode {
            case .photo:
                return "Library Photo"
            case .video:
                return "Library Video"
            case .photoAndVideo:
                return "Library Photo And Video"
            }
        }
    }
    
    func mediaTypes() -> [String] {
        switch self {
        case .camera(let mode), .library(let mode):
            switch mode {
            case .photo:
                return [(kUTTypeImage as String)]
            case .video:
                return [(kUTTypeMovie as String)]
            case .photoAndVideo:
                return [(kUTTypeMovie as String), (kUTTypeImage as String)]
            }
        }
    }

    func sourceType() -> UIImagePickerController.SourceType {
        switch self {
        case .camera:
            return UIImagePickerController.SourceType.camera
        case .library:
            return UIImagePickerController.SourceType.photoLibrary
        }
    }
}
