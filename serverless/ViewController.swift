//
//  ViewController.swift
//  serverless
//
//  Created by Maxym Sahaydak on 8/20/18.
//  Copyright © 2018 TechMagic. All rights reserved.
//

import UIKit
import SVProgressHUD
import FirebaseAuth
import FirebaseDatabase

struct Item {
    var name: String
    var ownerId: String
    var subscribed: [String]?

    var json: [String: Any] {
        get {
            var dict: [String: Any] = ["name": name, "ownerId": ownerId]
            if let subscribed = subscribed, !subscribed.isEmpty {
                dict["subscribed"] = subscribed
            }
            return dict

        }
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!


    @IBAction func registerBtnPressed(_ sender: Any) {
//        SVProgressHUD.show()
//        let registrationForm = RegistrationForm(email: emailTF.text!, password: passwordTF.text!)
//        authService.register(with: registrationForm) { (user) in
//            SVProgressHUD.dismiss()
//        }
    }

    @IBAction func addObject() {
        guard let currentUser = Auth.auth().currentUser else { return }
        let ref = Database.database().reference()
        let item = Item(name: "Item", ownerId: currentUser.uid, subscribed: ["1", "2", "3", "4", "5"])
//        let userRef = ref.child(currentUser.uid)
        ref.setValue(item.json) { (error, dbRef) in

        }
    }

    let authService = AuthDM()
}

