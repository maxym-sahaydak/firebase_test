//
//  UIImage+Resize.swift
//  serverless
//
//  Created by Maxym Sahaydak on 8/28/18.
//  Copyright © 2018 TechMagic. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
    func resize(scale: CGFloat) -> UIImage? {
        let newWidth = size.width * scale
        let newHeight = size.height * scale

        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        self.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage
    }
}
