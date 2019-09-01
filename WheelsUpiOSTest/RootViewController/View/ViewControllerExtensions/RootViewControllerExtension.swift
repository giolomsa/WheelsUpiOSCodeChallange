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
        return self.viewModel.titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = rootTitleTableView.dequeueReusableCell(withIdentifier: "RootTitleCell", for: indexPath) as? RootTitlesCell{
            let currentTitle = self.viewModel.titles[indexPath.row]
            cell.titleIconImageView.image = UIImage(named: currentTitle.title)
            cell.titleLabel.text = currentTitle.title.capitalized
            
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedCategory = self.viewModel.titles[indexPath.row]
        performSegue(withIdentifier: "CategoryDetailSegue", sender: self)
    }
    
    
}
