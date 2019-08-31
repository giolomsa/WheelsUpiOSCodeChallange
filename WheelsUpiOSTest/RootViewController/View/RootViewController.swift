//
//  ViewController.swift
//  WheelsUpiOSTest
//
//  Created by Gio Lomsa on 8/28/19.
//  Copyright © 2019 Giorgi Lomsadze. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    let viewModel = RootViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.loadRoot()
    }


}

