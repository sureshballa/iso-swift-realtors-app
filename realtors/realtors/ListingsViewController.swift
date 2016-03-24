//
//  ViewController.swift
//  realtors
//
//  Created by Suresh.Balla on 23/03/16.
//  Copyright © 2016 sureshballa. All rights reserved.
//

import UIKit

protocol ListingSelectionDelegate: class {
    func listingSelected(newListing: String)
}

class ListingsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var array = ["Item1", "Item2", "Item3"];
    
    weak var delegate: ListingSelectionDelegate?
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ListingCell") as! ListingCell
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedListing = self.array[indexPath.row]
        self.delegate?.listingSelected(selectedListing)
        
        if let detailViewController = self.delegate as? ListingDetailsViewController {
            splitViewController?.showDetailViewController(detailViewController, sender: nil)
        }
    }
    
}

