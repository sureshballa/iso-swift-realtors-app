//
//  ListingDetailsViewController.swift
//  realtors
//
//  Created by Suresh.Balla on 23/03/16.
//  Copyright © 2016 sureshballa. All rights reserved.
//

import UIKit

class ListingDetailsViewController: UIViewController {
    
    var property: Property?
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var summaryLabel: UILabel!
    @IBOutlet var featuresTextView: UITextView!
    @IBOutlet var propertyImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(self.property != nil){
            self.getPropertyDetails()
        }
        
        self.addressLabel.text = ""
        self.summaryLabel.text = ""
        self.featuresTextView.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshUI() {
        self.addressLabel.text = self.property?.address
        self.featuresTextView.text = self.property?.features
        self.summaryLabel.text = "Beds: " + (self.property?.beds.stringValue)! + ", Baths: " +  (self.property?.baths.stringValue)! + ", $" + (self.property?.estimatedValue!.stringValue)! + ", " + (self.property?.changeOverLastYear!.stringValue)!
        self.propertyImage!.imageFromUrl((self.property?.imageLink)!)
    }
    
    func getPropertyDetails() {
        
        // Setup the session to make REST GET call.  Notice the URL is https NOT http!!
        let propertyEndpoint: String = "https://sample-listings.herokuapp.com/listings/" + (self.property?.listingID.stringValue)!
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: propertyEndpoint)!
        
        // Make the POST call and handle it in a completion handler
        session.dataTaskWithURL(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            // Make sure we get an OK response
            guard let realResponse = response as? NSHTTPURLResponse where
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    return
            }
            
            // Read the JSON
            do {
                if let rawResponse = NSString(data:data!, encoding: NSUTF8StringEncoding) {
                    // Print what we got from the call
                    print(rawResponse)
                    
                    // Parse the JSON
                    let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    
                    let changeOverLastYear = jsonDictionary["changeOverLastYear"] as! Double!
                    let estimatedValue = jsonDictionary["estimatedValue"] as! Double!
                    let features = jsonDictionary["features"] as! String!
                    let imageLink = "https://sample-listings.herokuapp.com" + (jsonDictionary["image"] as! String!)
                    let link = jsonDictionary["link"] as! String!
                    
                    self.property = Property(listingID: (self.property?.listingID)!, address: (self.property?.address)!, beds: (self.property?.beds)!, baths: (self.property?.baths)!, features: features, estimatedValue: estimatedValue, changeOverLastYear: changeOverLastYear, link: link, imageLink: imageLink)
                    
                    self.performSelectorOnMainThread("refreshUI", withObject: nil, waitUntilDone: false)
                    
                    print(jsonDictionary)
                }
            } catch {
                print("bad things happened")
            }
        }).resume()
    }

}

//Class extensions are great for separating out delegate protocols and grouping the methods together
extension ListingDetailsViewController: ListingSelectionDelegate {
    func listingSelected(newListing: Property) {
        self.property = newListing
        self.getPropertyDetails()
    }
}
