//
//  SignInViewController.swift
//  petagram
//
//  Created by Svetlana on 30.05.2020.
//  Copyright © 2020 Svetlana. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        hideNavigationBar(animated: animated)
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        showNavigationBar(animated: animated)
        super.viewWillDisappear(animated)
    }


}
