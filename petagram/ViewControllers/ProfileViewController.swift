//
//  ProfileViewController.swift
//  petagram
//
//  Created by Svetlana on 31.05.2020.
//  Copyright © 2020 Svetlana. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOut_Touch(_ sender: Any) {
        do{
            try Auth.auth().signOut()
        } catch let error{
            print(error)
        }
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let signInController = storyboard.instantiateViewController(identifier: "SignInViewController")
        self.present(signInController, animated: true, completion: nil)
    }

}
