//
//  RootViewControllerExtension.swift
//  WheelsUpiOSTest
//
//  Created by Gio Lomsa on 8/30/19.
//  Copyright © 2019 Giorgi Lomsadze. All rights reserved.
//

import Foundation
import UIKit

extension RootViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.rootElements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = rootTitleTableView.dequeueReusableCell(withIdentifier: "RootElementCell", for: indexPath) as? RootElementCell{
            let currentTitle = self.viewModel.rootElements[indexPath.row]
            cell.titleIconImageView.image = UIImage(named: currentTitle.title)
            cell.titleLabel.text = currentTitle.title.capitalized
            
            cell.selectionStyle = .none
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedCategory = self.viewModel.rootElements[indexPath.row]
        performSegue(withIdentifier: "CategoryDetailSegue", sender: self)
    }
    
    
}
