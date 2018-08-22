//
//  SettingsSettingsVM.swift
//  serverless
//
//  Created by Maxym Sahaydak on 22/08/2018.
//  Copyright © 2018 TechMagic. All rights reserved.
//

protocol SettingsVMProtocol {
    
}

protocol SettingsVMDelegate: class { 

}

class SettingsVM: SettingsVMProtocol {

	weak var delegate: SettingsVMDelegate?

	init(withDelegate delegate: SettingsVMDelegate) {
        self.delegate = delegate
    }
}