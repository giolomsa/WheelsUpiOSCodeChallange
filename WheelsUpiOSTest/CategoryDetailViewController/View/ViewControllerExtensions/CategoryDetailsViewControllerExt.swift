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
        return self.viewModel.categoryElements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = categoryDetailTableView.dequeueReusableCell(withIdentifier: "CategoryElementCell", for: indexPath) as? CategoryDetailCell{
            
            let currentCategory = viewModel.categoryElements[indexPath.row]
            // set title label either title or name(depends on category)
            cell.titleLabel.text = currentCategory.title ?? currentCategory.name
            
            cell.dateLabel.text = currentCategory.created.iso8601StringToLocaleDateString

            // set initials label either title or name(depends on category) first letters
            cell.initialsLabel.text = currentCategory.title?.firstAndSecondWordFirstLetters
            cell.initialsLabel.text = currentCategory.name?.firstAndSecondWordFirstLetters

            // set description label value depending on category
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
            
            cell.selectionStyle = .none
            
            return cell
            
        }else{
            return UITableViewCell()
        }
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // select current element
        let currentItem = viewModel.categoryElements[indexPath.row]
        //set selected item
        self.selectedItem = currentItem
        
        performSegue(withIdentifier: "ItemDetailsViewControllerSegue", sender: self)
    }
    
}
