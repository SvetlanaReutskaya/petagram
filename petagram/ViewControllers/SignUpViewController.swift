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
    
    @IBOutlet weak var signUpBtn: UIButton!
    
    @IBOutlet weak var errorField: UILabel!
    
    override func viewDidLoad() {
           super.viewDidLoad()
           handleFields()
        
    }
    
    func  handleFields() {
        signUpBtn.isEnabled = false
        
        logInField.addTarget(self, action: #selector(SignUpViewController.fieldsDidChanged), for: UIControl.Event.editingChanged)
        emailField.addTarget(self, action: #selector(SignUpViewController.fieldsDidChanged), for: UIControl.Event.editingChanged)
        passwordField.addTarget(self, action: #selector(SignUpViewController.fieldsDidChanged), for: UIControl.Event.editingChanged)
    }
    
    @objc func fieldsDidChanged(){
        if !(loginCheck() && emailCheck() && passwCheck()) {
            signUpBtn.setTitleColor(UIColor.gray, for: UIControl.State.normal)
            signUpBtn.isEnabled = false
            errorField.text = "error"
            return
        }
        signUpBtn.setTitleColor(UIColor.white, for: UIControl.State.normal)
        signUpBtn.isEnabled = true
        errorField.text = ""
    }
    
    func loginCheck()->Bool{
        guard let login = logInField.text, !login.isEmpty else {
            return false
        }
        return true
    }
    func emailCheck()->Bool{
       guard let email = emailField.text, !email.isEmpty else {
                return false
            }
         return true
    }
    func passwCheck()->Bool{
        guard let passw = passwordField.text, !passw.isEmpty && passw.count>5 else {
            return false
            }
        return true
    }
    
    @IBAction func signUpBtn_TouchUpInside(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailField.text!, password: passwordField.text!) { authResult, error  in
            if(error != nil){
                self.errorField.text = error?.localizedDescription
                return
            }
            guard let user = authResult?.user, error == nil else {
                self.errorField.text = error?.localizedDescription
                return
            }
            self.errorField.text = ""
            
            let ref = Database.database().reference()
            let usersRef = ref.child("users")
            let idUser = user.uid
            let newUserReference = usersRef.child(idUser)
            newUserReference.setValue(["username" : self.logInField.text!, "email": self.emailField.text!])
            
            self.performSegue(withIdentifier: "SignUptoBoard", sender: nil)
        }
    }
}
