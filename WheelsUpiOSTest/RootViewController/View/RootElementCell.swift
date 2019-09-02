//
//  RootTitlesCell.swift
//  WheelsUpiOSTest
//
//  Created by Gio Lomsa on 8/30/19.
//  Copyright © 2019 Giorgi Lomsadze. All rights reserved.
//

import UIKit

class RootElementCell: UITableViewCell {

    //MARK:- IBOutlets
    @IBOutlet weak var whiteBackgroundView: UIView!
    @IBOutlet weak var titleIconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // add shadow
        self.whiteBackgroundView.layer.cornerRadius = 5.0

        self.whiteBackgroundView.layer.masksToBounds = false
        self.whiteBackgroundView.layer.shadowColor = UIColor.gray.cgColor
        self.whiteBackgroundView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        self.whiteBackgroundView.layer.shadowOpacity = 0.8

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
