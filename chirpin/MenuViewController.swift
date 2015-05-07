//
//  MenuViewController.swift
//  chirpin
//
//  Created by Mateo Garcia on 5/5/15.
//  Copyright (c) 2015 Mateo Garcia. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var storyb = UIStoryboard(name: "Main", bundle: nil)
    var hamburgerViewController: HamburgerViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: Table View
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            var cell = tableView.dequeueReusableCellWithIdentifier("ProfileCell") as! UITableViewCell
            return cell
        case 1:
            var cell = tableView.dequeueReusableCellWithIdentifier("HomeCell") as! UITableViewCell
            return cell
        default:
            var cell = tableView.dequeueReusableCellWithIdentifier("MentionsCell") as! UITableViewCell
            return cell
        }
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        switch indexPath.row {
        case 0:
            // var profileNavigationController = storyboard!.instantiateViewControllerWithIdentifier("ProfileNavigationController") as! UINavigationController
            // var profileViewController = profileNavigationController.viewControllers[0] as! ProfileViewController
            var profileViewController = storyboard!.instantiateViewControllerWithIdentifier("ProfileViewController") as! ProfileViewController
            profileViewController.user = User.currentUser
            hamburgerViewController?.contentViewController = profileViewController
        case 1:
            var homeNavigationController = storyboard!.instantiateViewControllerWithIdentifier("HomeNavigationController") as! UINavigationController
            var homeViewController = homeNavigationController.viewControllers[0] as! HomeViewController
            homeViewController.showHomeTimeline = true
            hamburgerViewController?.contentViewController = homeNavigationController
        default:
            println("poop")
            var homeNavigationController = storyboard!.instantiateViewControllerWithIdentifier("HomeNavigationController") as! UINavigationController
            var mentionsViewController = homeNavigationController.viewControllers[0] as! HomeViewController
            mentionsViewController.showHomeTimeline = false
            hamburgerViewController?.contentViewController = homeNavigationController
        }
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
