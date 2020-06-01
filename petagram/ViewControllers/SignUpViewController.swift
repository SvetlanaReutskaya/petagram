//
//  SignUpViewController.swift
//  petagram
//
//  Created by Svetlana on 30.05.2020.
//  Copyright © 2020 Svetlana. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {

    @IBOutlet weak var logInField: UITextField!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func signUpBtn_TouchUpInside(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { authResult, error  in
            if(error != nil){
                print(error?.localizedDescription as Any)
                return
            }
            guard let user = authResult?.user, error == nil else {
                print(error as Any)
                return
            }
            
            let ref = Database.database().reference()
            let usersRef = ref.child("users")
            let idUser = user.uid
            let newUserReference = usersRef.child(idUser)
            newUserReference.setValue(["username" : self.logInField.text!, "email": self.emailField.text!])
        }
    }
}
