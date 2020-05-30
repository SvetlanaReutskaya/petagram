//
//  UIControllerExtentions.swift
//  petagram
//
//  Created by Svetlana on 30.05.2020.
//  Copyright © 2020 Svetlana. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideNavigationBar(animated: Bool){
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)

    }

    func showNavigationBar(animated: Bool) {
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

}
