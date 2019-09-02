//
//  ItemDetailsViewController.swift
//  WheelsUpiOSTest
//
//  Created by Gio Lomsa on 8/31/19.
//  Copyright © 2019 Giorgi Lomsadze. All rights reserved.
//

import UIKit

class ItemDetailsViewController: UIViewController {

    //MARK:- IBOutlets
    @IBOutlet weak var propertyContainerView: UIView!
    @IBOutlet weak var initialsBackgroundView: UIView!
    @IBOutlet weak var initialsLabel: UILabel!
    @IBOutlet weak var topYellowLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    //MARK:- Variables/Constants
    var currentCategory: RootCategory.SWCategoryType?
    var selectedItem: CategoryElement?
    var viewModel = ItemDetailsViewModel()
    
    //MARK:- lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manageObservers()
        customizeUI()
        
        activityIndicator.startAnimating()
        
        if let selectedItem = selectedItem{
            DispatchQueue.global(qos: .background).async {
                self.viewModel.loadDataFromUrl(url: selectedItem.url)
            }
        }
        // Do any additional setup after loading the view.
    }
    
    //MARK:- class methods
    private func manageObservers(){
        NotificationCenter.default.addObserver(self, selector: #selector(updateUIFromViewModel) , name: ItemDetailsViewModel.elementDetailsWereSetNotification, object: nil)
    }
    
    private func customizeUI(){
        navigationItem.backBarButtonItem?.title = " "
        initialsBackgroundView.layer.cornerRadius = initialsBackgroundView.frame.width/2
    }
    
    @objc private func updateUIFromViewModel(){
        if let elementDetailsObject = viewModel.elementDetailsObject{
            var current = 0
            // sort properties by key
            let sortedProperties = elementDetailsObject.propertyDictionary.sorted(by: {$0.key < $1.key})
            
            for property in sortedProperties{
                DispatchQueue.main.async {
                    
                    //create view with variable
                    let width = self.view.frame.width
                    
                    //load property detail view from xib file
                    let propertyDetail = UINib(nibName: "GenericView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
                    // set view frame
                    propertyDetail.frame = CGRect(x: 0, y: current, width: Int(width), height: 145)
                    current += 145
                    
                    // set key label text
                    if let keyLabel = propertyDetail.viewWithTag(1) as? UILabel{
                        keyLabel.text = property.key.capitalizedStringFromSnakeCase
                    }
                    //set value label text depending on key
                    //if value is url array, calling method which takes urlstrings array, loads titles from urls and returns array of string
                    if let valueLabel = propertyDetail.viewWithTag(2) as? UILabel{
                        if property.key == "species" ||
                            property.key == "starships" ||
                            property.key == "films" ||
                            property.key == "vehicles" ||
                            property.key == "planets" ||
                            property.key == "pilots" ||
                            property.key == "people" ||
                            property.key == "residents"{

                            DispatchQueue.global(qos: .background).async {
                                self.viewModel.loadStringFromUrl(urlArray: property.value as! [String], completion: {[weak valueLabel] (value) in
                                    DispatchQueue.main.async {
                                        valueLabel?.text = value.count > 0 ? value.joined(separator: ", ") : "N/A"
                                    }
                                })
                            }
                        }else if property.key == "created" ||
                            property.key == "edited"{
                            // converting to datelocalestring from iso8601
                            valueLabel.text = (property.value as? String)?.iso8601StringToLocaleDateString
                        }else{
                            // set key label text for other properties
                            valueLabel.text = (property.value as? String ?? "N/A").capitalized
                        }
                    }
                    // add custom view to container view
                    self.propertyContainerView.addSubview(propertyDetail)
                }
            }
            
            //set view title and initials label depending on category
            if let name = elementDetailsObject.propertyDictionary["name"] as? String{
                DispatchQueue.main.async {
                    self.navigationItem.title = name.uppercased()
                    self.initialsLabel.text = name.firstAndSecondWordFirstLetters
                }
            }
            //set view title and initials label depending on category
            if let title = elementDetailsObject.propertyDictionary["title"] as? String{
                DispatchQueue.main.async {
                    self.navigationItem.title = title.uppercased()
                    self.initialsLabel.text = title.firstAndSecondWordFirstLetters
                }
            }
            
            setDescriptionLabel()
            
        }
        // stop and hide activity indicator after setting all properties
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
        }
    }
    
    //set description label depending on category
    private func setDescriptionLabel(){
        if let selectedCategory = currentCategory,
            let propertiesDictionary = viewModel.elementDetailsObject?.propertyDictionary{
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

