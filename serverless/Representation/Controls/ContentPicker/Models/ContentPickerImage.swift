//
//  ContentPickerImage.swift
//  SocioLocal
//
//  Created by Alex Kunitsa on 11/21/17.
//  Copyright © 2017 TechMagic. All rights reserved.
//

import Foundation
import UIKit

class ContentPickerImage: ContentPickerData {
    
    var image: UIImage?
    
    init(image: UIImage?) {
        super.init()
        
        self.image = image
        self.mode = .video
    }
}
