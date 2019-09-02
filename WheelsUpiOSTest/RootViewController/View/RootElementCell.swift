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
        let shadowSize : CGFloat = 2.0
        let shadowPath = UIBezierPath(rect: CGRect(x: -shadowSize / 2,
                                                   y: -shadowSize / 2,
                                                   width: self.whiteBackgroundView.frame.size.width + shadowSize,
                                                   height: self.whiteBackgroundView.frame.size.height + shadowSize))
        self.whiteBackgroundView.layer.masksToBounds = false
        self.whiteBackgroundView.layer.shadowColor = UIColor.gray.cgColor
        self.whiteBackgroundView.layer.shadowOffset = CGSize(width: 0.8, height: 0.8)
        self.whiteBackgroundView.layer.shadowOpacity = 0.8
        self.whiteBackgroundView.layer.shadowPath = shadowPath.cgPath

        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
