//
//  ContainerViewController.swift
//  chirpin
//
//  Created by Mateo Garcia on 5/5/15.
//  Copyright (c) 2015 Mateo Garcia. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    
    var homeVC: UINavigationController!
    var menuVC: UIViewController!
    //    var mentionsVC: UIViewController!
    //    var profileVC: UIViewController!
    
    var menuOrigin: CGPoint!
    var menuFullWidth = CGFloat(320)

    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        
        // profileVC = storyboard.instantiateViewControllerWithIdentifier("ProfileViewController") as! UIViewController
        
        homeVC = storyboard.instantiateViewControllerWithIdentifier("HomeNavigationController") as! UINavigationController
        
        // mentionsVC = storyboard.instantiateViewControllerWithIdentifier("MentionsViewController") as! UIViewController
        
        menuVC = storyboard.instantiateViewControllerWithIdentifier("MenuViewController") as! UIViewController
        
        
        containerView.frame = homeVC.view.frame
        containerView.addSubview(homeVC.view)
        
        let panGestureRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: "onMenuPanGesture:")
        panGestureRecognizer.edges = .Left
        view.addGestureRecognizer(panGestureRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: Actions
    
    // HELP: NEED TO FIGURE OUT HOW TO TRACK TRAY MOVEMENT DIRECTION, AND HOW TO MAKE IT SLIDE (i.e. does it start out AS the containerview's view? In with case it's automatically fully out?
    
    func onMenuPanGesture(sender: UIScreenEdgePanGestureRecognizer) {
        containerView.frame = menuVC.view.frame
        containerView.addSubview(menuVC.view)
        
        var point = sender.locationInView(view)
        var velocity = sender.velocityInView(view)
        var translation = sender.translationInView(view)
        
        println("Trans:\(translation)")
        if sender.state == UIGestureRecognizerState.Began {
            // menuOrigin.x = sender.locationInView(view).x
            
            println("Gesture began at: \(point)")
        } else if sender.state == UIGestureRecognizerState.Changed {
            
            // var nextHeight = menuOrigin.x + translation.x
//            if nextHeight > menuFullWidth {
//                
////                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: nil, animations: { () -> Void in
////                    
////                    self.trayView.center = CGPoint(x: self.originalTrayCenter.x, y: nextHeight)
////                    
////                    }, completion: { (finished: Bool) -> Void in
////                })
//            } else {
////                UIView.animateWithDuration(0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: nil, animations: { () -> Void in
////                    self.trayView.center = CGPoint(x: self.originalTrayCenter.x, y: self.maxTrayHeightUp -
////                        0.23*(self.maxTrayHeightUp-nextHeight))
////                    }, completion: { (finished: Bool) -> Void in
////                })
//            }
            
            println("Gesture changed at: \(point)")
        } else if sender.state == UIGestureRecognizerState.Ended {
            
        }
    }
    
    
    
    /*
    // MARK: Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
