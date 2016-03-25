//
//  ListingCell.swift
//  realtors
//
//  Created by Suresh.Balla on 24/03/16.
//  Copyright © 2016 sureshballa. All rights reserved.
//

import UIKit

class ListingCell: UITableViewCell {
    
    
    @IBOutlet var propertyImage: UIImageView!
    @IBOutlet var propertyTitle: UILabel!
    @IBOutlet var summaryLabel: UILabel!
    
    var property: Property? {
        didSet (newPropertyValue) {
            refreshUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func refreshUI() {
        self.propertyTitle.text = self.property?.address
        self.summaryLabel?.text = "Beds: " + (self.property?.beds.stringValue)! + ", Baths: " +  (self.property?.baths.stringValue)!
        self.propertyImage!.imageFromUrl((self.property?.imageLink)!)
        self.propertyImage?.contentMode = UIViewContentMode.ScaleAspectFill
    }
}