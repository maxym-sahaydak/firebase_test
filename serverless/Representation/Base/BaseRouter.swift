//
//  BaseRouter.swift
//  serverless
//
//  Created by Maxym Sahaydak on 8/21/18.
//  Copyright © 2018 TechMagic. All rights reserved.
//

import Foundation
import UIKit

class BaseRouter {
    weak var viewController: UIViewController?

    init(withVC viewController: UIViewController?) {
        self.viewController = viewController
    }

    func initialVC(fromStoryboard storyboard: Storyboard) -> UIViewController? {
        let storyboard = UIStoryboard(name: storyboard.name(), bundle: nil)
        let vc = storyboard.instantiateInitialViewController()

        return vc
    }

    func vc(withId id: String, fromStoryboard storyboard: Storyboard) -> UIViewController? {
        let storyboard = UIStoryboard(name: storyboard.name(), bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: id)

        return vc
    }

    func vc<T>(withType type: T.Type, fromStoryboard storyboard: Storyboard) -> T? {
        return vc(withId: String(describing: T.self), fromStoryboard: storyboard) as? T
    }

    // MARK: - Navigation

    func navigateTo(_ vc: UIViewController) {
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }

    func navigateBack() {
        viewController?.navigationController?.popViewController(animated: true)
    }

    func open(_ vc: UIViewController) {
        viewController?.present(vc, animated: true, completion: nil)
    }

    func presentPopUp(_ vc: UIViewController, animated: Bool = false) {
        vc.modalPresentationStyle = .custom
        vc.modalTransitionStyle = .crossDissolve
        viewController?.present(vc, animated: animated, completion: nil)
    }
    
}
