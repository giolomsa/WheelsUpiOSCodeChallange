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
    var selectedCategory: RootCategory?
    
    // MARK:- IBOutlets
    @IBOutlet weak var rootTitleTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "STAR WAR API"
        
        rootTitleTableView.delegate = self
        rootTitleTableView.dataSource = self
        
        manageObservers()
        customizeUI()
        
        DispatchQueue.global(qos: .background).sync {
            self.viewModel.loadRoot()
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CategoryDetailViewController{
            destination.selectedCategory = self.selectedCategory
        }
    }
    
    //MARK:- Class methods
    private func manageObservers(){
        NotificationCenter.default.addObserver(self, selector: #selector(updateUIFromViewModel) , name: RootViewModel.rootTitlesWereSetNotification, object: nil)
    }
    
    private func customizeUI(){
       
        activityIndicator.startAnimating()
        navigationController?.navigationBar.barTintColor = UIColor(red: 50/255, green: 49/255, blue: 51/255, alpha: 100)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.backBarButtonItem?.title = ""
    }

    @objc private func updateUIFromViewModel(){
        DispatchQueue.main.async {
            self.rootTitleTableView.reloadData()
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
    }
}

