//
//  SettingsSettingsVM.swift
//  serverless
//
//  Created by Maxym Sahaydak on 22/08/2018.
//  Copyright © 2018 TechMagic. All rights reserved.
//

import FirebaseAuth

protocol SettingsVMProtocol {
    func logOut()
}

protocol SettingsVMDelegate: class { 
    func loggedOut()
}

class SettingsVM: SettingsVMProtocol {

	weak var delegate: SettingsVMDelegate?

	init(withDelegate delegate: SettingsVMDelegate) {
        self.delegate = delegate
    }

    //MARK: - SettingsVMProtocol

    func logOut() {
        do {
            try? Auth.auth().signOut()
            delegate?.loggedOut()
        } catch let error {
            print("cant log out \(error.localizedDescription)")
        }

    }
}
