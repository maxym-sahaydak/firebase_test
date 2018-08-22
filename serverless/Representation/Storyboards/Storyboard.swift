//
//  Storyboard.swift
//  serverless
//
//  Created by Maxym Sahaydak on 8/21/18.
//  Copyright © 2018 TechMagic. All rights reserved.
//

import Foundation

enum Storyboard {
    case main
    case onboarding
    case browse

    func name() -> String {
        switch self {
        case .main: return "Main"
        case .onboarding: return "Onboarding"
        case .browse: return "Browse"
        }
    }
    
}
