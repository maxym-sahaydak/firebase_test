//
//  ColorTVCell.swift
//  serverless
//
//  Created by Maxym Sahaydak on 8/29/18.
//  Copyright © 2018 TechMagic. All rights reserved.
//

import UIKit

class ColorTVCell: UITableViewCell {

    //MARK: - Outlet

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var infoLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


    //MARK: - Public

    func updateWithRBGColors(_ colors: Array<CGFloat>) {
        let color = UIColor(displayP3Red: colors[0]/255.0, green: colors[1]/255.0, blue: colors[2]/255.0, alpha: 1.0)
        colorView.backgroundColor = color
        
        infoLbl.text = "Red: \(colors[0]), Green: \(colors[1]), Blue: \(colors[2])"
    }
    
}
