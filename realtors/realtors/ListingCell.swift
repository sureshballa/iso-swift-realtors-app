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
    @IBOutlet var bedsLabel: UILabel!
    @IBOutlet var bathsLabel: UILabel!
    
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

        // Configure the view for the selected state
    }
    
    func refreshUI() {
        self.propertyTitle.text = self.property?.address
        self.bedsLabel.text = String(self.property?.beds)
        self.bathsLabel.text = String(self.property?.baths)
        self.imageView!.imageFromUrl((self.property?.imageLink)!)
        self.imageView?.contentMode = UIViewContentMode.ScaleToFill
        self.imageView?.clipsToBounds = true;
    }

}

extension UIImageView {
    public func imageFromUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(URL: url)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
                (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
                if let imageData = data as NSData? {
                    self.image = UIImage(data: imageData)
                }
            }
        }
    }
}
