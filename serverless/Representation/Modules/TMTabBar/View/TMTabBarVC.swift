//
//  TMTabBarTMTabBarVC.swift
//  serverless
//
//  Created by Maxym Sahaydak on 21/08/2018.
//  Copyright 2018 TechMagic. All rights reserved.
//

import UIKit

class TMTabBarVC : UITabBarController {

	override func viewDidLoad() {
        super.viewDidLoad()
        
        router = TMTabBarRouter(withVC: self)
        viewModel = TMTabBarVM(withDelegate: self)
    }

    // MARK: - Private
    
    private var router: TMTabBarRouterProtocol?
    private var viewModel: TMTabBarVMProtocol?
}

extension TMTabBarVC: TMTabBarVMDelegate {
	
}
