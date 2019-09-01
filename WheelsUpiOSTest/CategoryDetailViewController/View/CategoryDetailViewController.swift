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
    var selectedItem: Category?
    var genericItem: GenericItem?
    let viewModel = CategoryDetailsViewMode()

    //MARK:- IBOutlets
    @IBOutlet weak var categoryDetailTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        categoryDetailTableView.delegate = self
        categoryDetailTableView.dataSource = self
        
        self.activityIndicator.startAnimating()
        
        manageObservers()
        
        if let selectedCategory = selectedCategory{
            self.navigationItem.title = selectedCategory.title.uppercased()
            navigationItem.backBarButtonItem?.title = ""
            
            DispatchQueue.global(qos: .background).async {
                self.viewModel.loadCategories(for: selectedCategory.url)
            }
        }
        // Do any additional setup after loading the view.
    }

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
        NotificationCenter.default.addObserver(self, selector: #selector(updateUIFromViewModel) , name: CategoryDetailsViewMode.categoriesWereSetNotification, object: nil)
    }
    
    @objc private func updateUIFromViewModel(){
        DispatchQueue.main.async {
            self.categoryDetailTableView.reloadData()
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
    }
    
}
