//
//  ViewController.swift
//  realtors
//
//  Created by Suresh.Balla on 23/03/16.
//  Copyright © 2016 sureshballa. All rights reserved.
//

import UIKit

protocol ListingSelectionDelegate: class {
    func listingSelected(newListing: Property)
}

class ListingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.propertyListings.append(Property(listingID: 1, address: "1503 Elk Forest Rd, Elkton, MD 21921", beds: 5, baths: 5, features: "Appliance: Dishwasher, Exhaust Fans, Icemaker, Dryer, Instant Hot-Water Dispenser, Microwave, Refrigerator, Six Burner Stove, Trash Compactor, Washer, Water Conditioner, Water Dispenser\nCooling: Heat Pumps\nHeating: Heat Pump\nKitchen: Gourmet, Kitchen Island, Second Kitchen, Breakfast Room\nWindow: Double Pane Windows, Palladian Windows, Recessed Lights, Screened, Six Panel Doors, Insulated Windows, Insulated Doors, Atrium Door, French Doors\nRoom Details: Living Room, Dining Room, Master Bedroom, Bedroom 4, Kitchen, Family Room, Library, Foyer, Breakfast Room, Florida/Sun Room", estimatedValue: 1594000, changeOverLastYear:  -30.02, link: "http://www.zillow.com/homedetails/1503-Elk-Forest-Rd-Elkton-MD-21921/82130373_zpid/", imageLink: "https://sample-listings.herokuapp.com/images/1.jpg"))
        
        self.propertyListings.append(Property(listingID: 2, address: "511 Ricketts Mill Rd, Elkton, MD 21921", beds: 5, baths: 4, features: "Basement: Walkout Stairs\nCooling: Zoned\nHeating: Baseboard, Forced Air, Zoned\nKitchen: Kitchen-Breakfast Bar, Eat In Kitchen", estimatedValue: 924190, changeOverLastYear:  5.78, link: "http://www.zillow.com/homedetails/511-Ricketts-Mill-Rd-Elkton-MD-21921/36675465_zpid/", imageLink: "https://sample-listings.herokuapp.com/images/2.jpg"))
        
        self.propertyListings.append(Property(listingID: 3, address: "68 Fawn Valley Dr, Elkton, MD 21921", beds: 4, baths: 5, features: "Appliance: Intercom, Trash Compactor\nBasement: Fully Finished, Heated\nHeating: 90% Forced Air\nKitchen: Second Kitchen, Family Room Off Kitchen\nRoom Details: Dining Room, Master Bedroom, Bedroom 2, Bedroom 4, Kitchen, Family Room, Finished Attic, Florida/Sun Room, In-Law/Aupair/Suite\nBasement Square Feet Range High: 1180 sq/ft\nApproximate Finished: 3964 sq ft", estimatedValue: 924100, changeOverLastYear:  5.78, link: "http://www.zillow.com/homedetails/68-Fawn-Valley-Dr-Elkton-MD-21921/82132158_zpid/", imageLink: "https://sample-listings.herokuapp.com/images/3.jpg"))
        
    }
    
    var propertyListings = [Property]()
    
    weak var delegate: ListingSelectionDelegate?
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        getListings()
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.propertyListings.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ListingCell") as! ListingCell
        
        cell.property = self.propertyListings[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedPropertyListing = self.propertyListings[indexPath.row]
        self.delegate?.listingSelected(selectedPropertyListing)
        
        if let detailViewController = self.delegate as? ListingDetailsViewController {
            splitViewController?.showDetailViewController(detailViewController, sender: nil)
        }
    }
    
    func refreshUI(){
        self.tableView.reloadData()
    }
    
    func getListings() {
        
        // Setup the session to make REST GET call.  Notice the URL is https NOT http!!
        let postEndpoint: String = "https://sample-listings.herokuapp.com/listings"
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: postEndpoint)!
        
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
                if let ipString = NSString(data:data!, encoding: NSUTF8StringEncoding) {
                    // Print what we got from the call
                    print(ipString)
                    
                    // Parse the JSON to get the IP
                    let jsonDictionary = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSArray
                    
                    for item in jsonDictionary{
                        let property = item as! NSDictionary
                        self.propertyListings.append(Property(listingID: property["listingID"] as! Int!,
                            address: property["address"] as! String,
                            beds: property["beds"] as! Int,
                            baths: property["baths"] as! Int,
                            imageLink: property["image"] as! String))
                    }
                    
                    self.performSelectorOnMainThread("refreshUI", withObject: nil, waitUntilDone: false)
                    
                    print(jsonDictionary)
                }
            } catch {
                print("bad things happened")
            }
        }).resume()
    }
    
}

