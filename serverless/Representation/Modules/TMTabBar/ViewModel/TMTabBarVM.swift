//
//  TMTabBarTMTabBarVM.swift
//  serverless
//
//  Created by Maxym Sahaydak on 21/08/2018.
//  Copyright © 2018 TechMagic. All rights reserved.
//

protocol TMTabBarVMProtocol {
    
}

protocol TMTabBarVMDelegate: class { 

}

class TMTabBarVM: TMTabBarVMProtocol {

	weak var delegate: TMTabBarVMDelegate?

	init(withDelegate delegate: TMTabBarVMDelegate) {
        self.delegate = delegate
    }
}