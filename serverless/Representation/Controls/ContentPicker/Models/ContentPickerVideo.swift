//
//  ContentPickerVideo.swift
//  SocioLocal
//
//  Created by Alex Kunitsa on 11/21/17.
//  Copyright © 2017 TechMagic. All rights reserved.
//

import Foundation
import UIKit

class ContentPickerVideo: ContentPickerData {
    
    var videoUrl: URL?
    var thumbnail: UIImage?
    var duration: Double = 0
    var orientation: VideoOrientation = .portrait
    
    override init() {
        super.init()
        
        self.mode = .video
    }
}
