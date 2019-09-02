//
//  CategoryDetailCell.swift
//  WheelsUpiOSTest
//
//  Created by Gio Lomsa on 8/30/19.
//  Copyright © 2019 Giorgi Lomsadze. All rights reserved.
//

import UIKit

class CategoryDetailCell: UITableViewCell {
    
    //MARK:- IBOutlets
    @IBOutlet weak var initialsBackgroundView: UIView!
    @IBOutlet weak var initialsLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        let arrow = UIImage(named: "disclosure_caret")
        self.accessoryType = .disclosureIndicator
        self.accessoryView = UIImageView(image: arrow!)

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
