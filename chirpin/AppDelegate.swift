//
//  AppDelegate.swift
//  chirpin
//
//  Created by Mateo Garcia on 4/25/15.
//  Copyright (c) 2015 Mateo Garcia. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var storyboard = UIStoryboard(name: "Main", bundle: nil)
    var hamburgerViewController: HamburgerViewController?
    
    

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        
        // Override point for customization after application launch.
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "userDidLogout", name: userDidLogoutNotification, object: nil)
        
        
        // IF USER IS LOGGED IN
        if User.currentUser != nil {
            
            // go to timeline
            println("CURRENT USER DETECTED: \(User.currentUser!.name!)")
            
            // ** SETS START VIEW **
            hamburgerViewController = storyboard.instantiateViewControllerWithIdentifier("HamburgerViewController") as? HamburgerViewController
            
            var menuViewController = storyboard.instantiateViewControllerWithIdentifier("MenuViewController") as! MenuViewController
            var homeNavigationController = storyboard.instantiateViewControllerWithIdentifier("HomeNavigationController") as! UINavigationController
            
            hamburgerViewController!.menuViewController = menuViewController
            menuViewController.hamburgerViewController = hamburgerViewController
            
            var homeViewController = homeNavigationController.viewControllers[0] as! HomeViewController
            homeViewController.showHomeTimeline = true
            hamburgerViewController!.contentViewController = homeNavigationController
            
            // does exactly the same as arrow in storyboard   ("100% parity" --Tim Lee)
            window?.rootViewController = hamburgerViewController
        }
        
        return true
    }
    
    
    
    func userDidLogout() {
        var vc = storyboard.instantiateInitialViewController() as! UIViewController
        
        
        // does exactly the same as arrow in storyboard   ("100% parity" --Tim Lee)
        window?.rootViewController = vc
    }
    
    

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    
    // assume that it was Twitter that called this (normally would have to check)
    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
        TwitterClient.sharedInstance.openURL(url)
        return true
    }
    
    
}

