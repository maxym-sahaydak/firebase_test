//
//  SettingsSettingsVC.swift
//  serverless
//
//  Created by Maxym Sahaydak on 22/08/2018.
//  Copyright 2018 TechMagic. All rights reserved.
//

import UIKit

class SettingsVC : BaseVC {

	override func viewDidLoad() {
        super.viewDidLoad()
        
        router = SettingsRouter(withVC: self)
        viewModel = SettingsVM(withDelegate: self)
    }

    // MARK: - Private
    
    private var router: SettingsRouterProtocol?
    private var viewModel: SettingsVMProtocol?
}

extension SettingsVC: SettingsVMDelegate {
	
}