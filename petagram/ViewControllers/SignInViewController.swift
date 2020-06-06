//
//  SignInViewController.swift
//  petagram
//
//  Created by Svetlana on 30.05.2020.
//  Copyright © 2020 Svetlana. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var errorTextField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if (Auth.auth().currentUser != nil) {
            self.performSegue(withIdentifier: "SignIntoBoard", sender: nil)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        hideNavigationBar(animated: animated)
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        showNavigationBar(animated: animated)
        super.viewWillDisappear(animated)
    }


    @IBAction func signInBtn_Touch(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
                if error != nil {
                    self.errorTextField.text = error?.localizedDescription
                return
            }
            self.errorTextField.text = ""
            self.performSegue(withIdentifier: "SignIntoBoard", sender: nil)
        })
    }
}
