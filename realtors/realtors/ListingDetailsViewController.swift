//
//  ListingDetailsViewController.swift
//  realtors
//
//  Created by Suresh.Balla on 23/03/16.
//  Copyright © 2016 sureshballa. All rights reserved.
//

import UIKit

class ListingDetailsViewController: UIViewController {
    
    var address: String! {
        didSet (newValue) {
            self.title = newValue
        }
    }

    @IBOutlet var addressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addressLabel.text = self.address

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

//Class extensions are great for separating out delegate protocols and grouping the methods together
extension ListingDetailsViewController: ListingSelectionDelegate {
    func listingSelected(newListing: String) {
        address = newListing
        self.addressLabel.text = self.address

    }
}
