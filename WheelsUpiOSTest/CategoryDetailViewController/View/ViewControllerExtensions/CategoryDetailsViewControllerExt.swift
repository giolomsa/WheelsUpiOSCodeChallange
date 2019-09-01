//
//  CategoryDetailsViewControllerExt.swift
//  WheelsUpiOSTest
//
//  Created by Gio Lomsa on 8/30/19.
//  Copyright © 2019 Giorgi Lomsadze. All rights reserved.
//

import Foundation
import UIKit

extension CategoryDetailViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = categoryDetailTableView.dequeueReusableCell(withIdentifier: "CategorydetailCell", for: indexPath) as? CategoryDetailCell{
            let currentCategory = viewModel.categories[indexPath.row]
            cell.titleLabel.text = currentCategory.title ?? currentCategory.name
            cell.dateLabel.text = currentCategory.created
            cell.initialsLabel.text = currentCategory.title?.firstAndSecondWordFirstLetters
            cell.initialsLabel.text = currentCategory.name?.firstAndSecondWordFirstLetters

            if let birthYear = currentCategory.birth_year{
                cell.descriptionLabel.text = birthYear.capitalized
            }
            
            if let opening = currentCategory.opening_crawl{
                cell.descriptionLabel.text = opening.capitalized
            }
            
            if let model = currentCategory.model{
                cell.descriptionLabel.text = model.capitalized
            }
            
            if let classification = currentCategory.classification{
                cell.descriptionLabel.text = classification.capitalized
            }
            
            if let diameter = currentCategory.diameter{
                cell.descriptionLabel.text = diameter.capitalized
            }
            
            cell.initialsBackgroundView.layer.cornerRadius = cell.initialsBackgroundView.frame.width/2
            return cell
        }else{
            return UITableViewCell()
        }
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let currentItem = viewModel.categories[indexPath.row]
        self.selectedItem = currentItem
        
        
        if let selectedCategory = self.selectedCategory{
            switch selectedCategory.category{
            case .people:
//                performSegue(withIdentifier: "peopleViewControllerSegue", sender: self)
                
                performSegue(withIdentifier: "ItemDetailsViewControllerSegue", sender: self)
                
//            case .films:
//                performSegue(withIdentifier: "filmsViewControllerSegue", sender: self)
//            case .planets:
//                performSegue(withIdentifier: "planetsViewControllerSegue", sender: self)
//            case .species:
//                performSegue(withIdentifier: "speciesViewControllerSegue", sender: self)
//            case .starships:
//                performSegue(withIdentifier: "starshipsViewControllerSegue", sender: self)
//            case .vheicles:
//                performSegue(withIdentifier: "vheiclesViewControllerSegue", sender: self)
//
            default:
                performSegue(withIdentifier: "ItemDetailsViewControllerSegue", sender: self)
            }
        }
//        performSegue(withIdentifier: "ItemDetailsViewControllerSegue", sender: self)
    }
    
}
