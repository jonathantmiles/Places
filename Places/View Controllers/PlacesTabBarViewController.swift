//
//  PlacesTabBarViewController.swift
//  Places
//
//  Created by Jonathan T. Miles on 7/26/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class PlacesTabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        for childVC in childViewControllers {
            if let vc = childVC as? PlacesPresenter {
                vc.placeController = placeController
            }
        }
    }

    let placeController = PlaceController()
    
}
