//
//  BrowseBrowseVM.swift
//  serverless
//
//  Created by Maxym Sahaydak on 22/08/2018.
//  Copyright © 2018 TechMagic. All rights reserved.
//

protocol BrowseVMProtocol {
    
}

protocol BrowseVMDelegate: class { 

}

class BrowseVM: BrowseVMProtocol {

	weak var delegate: BrowseVMDelegate?

	init(withDelegate delegate: BrowseVMDelegate) {
        self.delegate = delegate
    }
}