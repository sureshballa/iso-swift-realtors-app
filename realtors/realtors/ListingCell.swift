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

        // Configure the view for the selected state
    }
    
    func refreshUI() {
        self.propertyTitle.text = self.property?.address
        self.summaryLabel?.text = "Beds: " + (self.property?.beds.stringValue)! + ", Baths: " +  (self.property?.baths.stringValue)!
        self.propertyImage!.imageFromUrl((self.property?.imageLink)!)

        
        self.propertyImage?.contentMode = UIViewContentMode.ScaleAspectFill
    }
    
    
}

extension Int {
    var stringValue:String {
        return "\(self)"
    }
}

extension Double {
    var stringValue: String {
        return String(format: "%.1f",self)
    }
}

extension UIImageView {
    public func imageFromUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(URL: url)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
                (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
                if let imageData = data as NSData? {
                    //self.image = self.imageWithImage(UIImage(data: imageData)!, scaledToSize: CGSizeMake(100, 100*(2/3)))
                    self.image = UIImage(data: imageData)
                }
            }
        }
    }
    
    func imageWithImage(image:UIImage, scaledToSize newSize:CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0);
        image.drawInRect(CGRectMake(0, 0, newSize.width, newSize.height))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }

}
