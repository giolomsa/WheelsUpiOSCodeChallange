//
//  CategoryDetailViewController.swift
//  WheelsUpiOSTest
//
//  Created by Gio Lomsa on 8/30/19.
//  Copyright © 2019 Giorgi Lomsadze. All rights reserved.
//

import UIKit

class CategoryDetailViewController: UIViewController {
    
    //MARK:- Variables/Constants
    var selectedCategory: RootCategory?
    var selectedItem: CategoryElement?
    
    let viewModel = CategoryDetailsViewMode()

    //MARK:- IBOutlets
    @IBOutlet weak var categoryDetailTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK:- lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        //manage tableview delegate/datasource
        categoryDetailTableView.delegate = self
        categoryDetailTableView.dataSource = self
        
        self.activityIndicator.startAnimating()
        
        manageObservers()
        
        if let selectedCategory = selectedCategory{
            self.navigationItem.title = selectedCategory.title.uppercased()
            navigationItem.backBarButtonItem?.title = ""
            
            DispatchQueue.global(qos: .background).async {
                self.viewModel.loadCategoryElements(for: selectedCategory.url)
            }
        }
        // Do any additional setup after loading the view.
    }

    //MARK:- prepare segue methos
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            if let selectedItem = self.selectedItem,
                let selectedCategory = self.selectedCategory{
                if let destination = segue.destination as? ItemDetailsViewController{
                    destination.selectedItem = selectedItem
                    destination.currentCategory = selectedCategory.category
                }
            }
    }
    
    //MARK:- Class methods
    private func manageObservers(){
        NotificationCenter.default.addObserver(self, selector: #selector(updateUIFromViewModel) , name: CategoryDetailsViewMode.categoryElementsWereSetNotification, object: nil)
    }
    
    @objc private func updateUIFromViewModel(){
        DispatchQueue.main.async {
            self.categoryDetailTableView.reloadData()
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
    }
    
}
