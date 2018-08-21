//
//  BaseVC.swift
//  serverless
//
//  Created by Maxym Sahaydak on 8/21/18.
//  Copyright © 2018 TechMagic. All rights reserved.
//

import UIKit

class BaseVC: UIViewController, BaseVCSpinnerProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()

        spinnerControl = Spinner(with: self)
        // Do any additional setup after loading the view.
    }

    //MARK: - BaseVCSpinnerProtocol

    private(set) var spinnerControl: SpinnerControlProtocol?
    
}


protocol BaseVCSpinnerProtocol {
    var spinnerControl: SpinnerControlProtocol? { get }
}

protocol BaseVCMessagesProtocol {
    func errorMessage(_ errorMessage: String?)
    func infoMessage(_ title: String?, message: String?)
}


