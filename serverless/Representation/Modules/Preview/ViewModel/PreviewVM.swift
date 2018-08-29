//
//  PreviewPreviewVM.swift
//  serverless
//
//  Created by Maxym Sahaydak on 29/08/2018.
//  Copyright © 2018 TechMagic. All rights reserved.
//

import UIKit

protocol PreviewVMProtocol {

    func viewDidLoad()
    var cmlImage: CMLImage { get }
    var colors: [Array<CGFloat>]? { get }

}

protocol PreviewVMDelegate: class {

    func updateUI()
    
}

class PreviewVM: PreviewVMProtocol {

	weak var delegate: PreviewVMDelegate?

    init(withDelegate delegate: PreviewVMDelegate, cmlImage: CMLImage) {
        self.delegate = delegate
        self.cmlImage = cmlImage
    }

    //MARK: - PreviewVMProtocol

    func viewDidLoad() {
        colors = getColorsFromCMLImage(cmlImage)
        print(colors ?? "")
        delegate?.updateUI()
    }

    let cmlImage: CMLImage
    private(set) var colors: [Array<CGFloat>]?

    //MARK: - Private

    private func getColorsFromCMLImage(_ cmlImage: CMLImage) -> [[CGFloat]]? {
        guard let palette = cmlImage.palette, let allKeys = palette.allKeys as? [String] else { print("palette missed"); return nil }
        var rbgs: [[CGFloat]] = []
        for key in allKeys {
            let dictionary = palette[key] as! NSDictionary
            if let rgb = dictionary["_rgb"] as? [CGFloat] {
                rbgs.append(rgb)
            }
        }
        return rbgs
    }

}
