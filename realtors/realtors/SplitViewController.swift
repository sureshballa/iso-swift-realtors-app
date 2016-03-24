//
//  SplitViewController.swift
//  realtors
//
//  Created by Suresh.Balla on 24/03/16.
//  Copyright © 2016 sureshballa. All rights reserved.
//

import UIKit

class SplitViewController: UISplitViewController, UISplitViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController:UIViewController, ontoPrimaryViewController primaryViewController:UIViewController) -> Bool {
////        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
////        guard let topAsDetailController = secondaryAsNavController.topViewController as? ListingDetailsViewController else { return false }
////        if topAsDetailController.address == nil {
////            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
////            return true
////        }
////        return false
//        return true
//    }

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
