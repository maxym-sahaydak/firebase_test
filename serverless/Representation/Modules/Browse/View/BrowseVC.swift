//
//  BrowseBrowseVC.swift
//  serverless
//
//  Created by Maxym Sahaydak on 22/08/2018.
//  Copyright 2018 TechMagic. All rights reserved.
//

import UIKit

class BrowseVC : BaseVC {

	override func viewDidLoad() {
        super.viewDidLoad()
        
        router = BrowseRouter(withVC: self)
        viewModel = BrowseVM(withDelegate: self)
    }

    // MARK: - Private
    
    private var router: BrowseRouterProtocol?
    private var viewModel: BrowseVMProtocol?
}

extension BrowseVC: BrowseVMDelegate {
	
}