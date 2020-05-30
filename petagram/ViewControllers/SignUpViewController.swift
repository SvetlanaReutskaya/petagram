//
//  SignUpViewController.swift
//  petagram
//
//  Created by Svetlana on 30.05.2020.
//  Copyright © 2020 Svetlana. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideNavigationBar(animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        showNavigationBar(animated: animated)
    }
    @IBAction func goToSignIn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
