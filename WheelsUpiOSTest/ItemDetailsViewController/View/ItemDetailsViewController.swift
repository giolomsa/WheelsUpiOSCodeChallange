//
//  ItemDetailsViewController.swift
//  WheelsUpiOSTest
//
//  Created by Gio Lomsa on 8/31/19.
//  Copyright © 2019 Giorgi Lomsadze. All rights reserved.
//

import UIKit

class ItemDetailsViewController: UIViewController {

    @IBOutlet weak var propertyContainerView: UIView!
    @IBOutlet weak var initialsBackgroundView: UIView!
    @IBOutlet weak var initialsLabel: UILabel!
    @IBOutlet weak var topYellowLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var currentCategory: RootCategory.SWCategoryType?
    var selectedItem: Category?
    var viewModel = CategoryDetailsViewMode()
    var itemDetailsViewModel = ItemDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manageObservers()
        customizeUI()
        
        
        if let selectedItem = selectedItem{
            activityIndicator.startAnimating()
            DispatchQueue.global(qos: .background).async {
                self.viewModel.loadDataFromUrl(url: selectedItem.url)
            }
            
            print(selectedItem.url)
//            switch selectedItem.category{
//            case .films:
//                print("films were selected")
////                viewModel.loadCategories(for: selectedItem.url)
//            case .people:
//                print("people selected")
//            case .starships:
//                print("starshipsple selected")
//            case.vheicles:
//                print("vheicles selected")
//            case .species:
//                print("species selected")
//            case .planets:
//                print("planets  selected")
//            }
        }
        // Do any additional setup after loading the view.
    }
    private func manageObservers(){
        NotificationCenter.default.addObserver(self, selector: #selector(updateUIFromViewModel) , name: CategoryDetailsViewMode.categoriesWereSetNotification, object: nil)
    }
    
    private func customizeUI(){
        navigationItem.backBarButtonItem?.title = " "
        initialsBackgroundView.layer.cornerRadius = initialsBackgroundView.frame.width/2
    }
    
    @objc private func updateUIFromViewModel(){
        if let genericItem = viewModel.genericItem{
            var startY = 0
            let sortedProperties = genericItem.propertyDictionary.sorted(by: {$0.key < $1.key})
            for property in sortedProperties{
                DispatchQueue.main.async {
                let width = self.view.frame.width
            let generiView = UINib(nibName: "GenericView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
                    
                    generiView.frame = CGRect(x: 0, y: startY, width: Int(width), height: 145)
                    startY += 145
                    
                    if let keyLabel = generiView.viewWithTag(1) as? UILabel{
                        keyLabel.text = property.key.capitalizedStringFromSnakeCase
                    }
                    
                    if let valueLabel = generiView.viewWithTag(2) as? UILabel{
                        if property.key == "species" ||
                            property.key == "starships" ||
                            property.key == "films" ||
                            property.key == "vehicles" ||
                            property.key == "planets" ||
                            property.key == "pilots" ||
                            property.key == "people" ||
                            property.key == "residents"{

                            DispatchQueue.global(qos: .background).async {
                                self.itemDetailsViewModel.loadStringFromUrl(urlArray: property.value as! [String], completion: {[weak valueLabel] (value) in
                                    DispatchQueue.main.async {
                                        valueLabel?.text = value.count > 0 ? value.joined(separator: ", ") : "N/A"
                                    }
                                })
                            }
                        }else{
                            valueLabel.text = (property.value as? String ?? "N/A").capitalized
                        }
                        
                    }
                    
                    self.propertyContainerView.addSubview(generiView)
                }
                
                
            }
            
            if let name = genericItem.propertyDictionary["name"] as? String{
                DispatchQueue.main.async {
                    self.navigationItem.title = name.uppercased()
                    self.initialsLabel.text = name.firstAndSecondWordFirstLetters
                }
            }
            
            if let title = genericItem.propertyDictionary["title"] as? String{
                DispatchQueue.main.async {
                    self.navigationItem.title = title.uppercased()
                    self.initialsLabel.text = title.firstAndSecondWordFirstLetters
                }
            }
            
            setHeaderLabel()
            
        }
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
    }
    
    private func setHeaderLabel(){
        if let selectedCategory = currentCategory,
            let propertiesDictionary = viewModel.genericItem?.propertyDictionary{
                        switch selectedCategory{
                        case .films:
                            if let openintCrowl = propertiesDictionary["opening_crawl"] as? String{
                                DispatchQueue.main.async {
                                    self.topYellowLabel.text = openintCrowl.capitalized
                                }
                            }
                        case .people:
                            if let birthYear = propertiesDictionary["birth_year"] as? String{
                                DispatchQueue.main.async {
                                    self.topYellowLabel.text = birthYear.capitalized
                                }
                            }
                        case .starships, .vheicles:
                            if let model = propertiesDictionary["model"] as? String{
                                DispatchQueue.main.async {
                                    self.topYellowLabel.text = model.capitalized
                                }
                            }
                        case .species:
                            if let classification = propertiesDictionary["classification"] as? String{
                                DispatchQueue.main.async {
                                    self.topYellowLabel.text = classification.capitalized
                                }
                            }
                        case .planets:
                            if let diameter = propertiesDictionary["diameter"] as? String{
                                DispatchQueue.main.async {
                                    self.topYellowLabel.text = diameter.capitalizedStringFromSnakeCase
                                }
                            }
                        }
        }
    }
    
}

