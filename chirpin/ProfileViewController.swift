//
//  ProfileViewController.swift
//  chirpin
//
//  Created by Mateo Garcia on 5/5/15.
//  Copyright (c) 2015 Mateo Garcia. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var user: User!
    
    @IBOutlet weak var profileBannerImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screennameLabel: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var tweetCountLabel: UILabel!
    @IBOutlet weak var followingCountLabel: UILabel!
    @IBOutlet weak var followerCountLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        println(user.bannerImageUrl)

        if let bannerImageUrl = user.bannerImageUrl {
            profileBannerImageView.setImageWithURL(NSURL(string: user.bannerImageUrl!)!)
        }
        
        profileImageView.setImageWithURL(NSURL(string: user.profileImageUrl!)!)
        profileImageView.layer.cornerRadius = 3
        profileImageView.clipsToBounds = true
        
        nameLabel.text = user.name!
        screennameLabel.text = "@" + user.screenname!
        taglineLabel.text = user.tagline
        tweetCountLabel.text = "\(user.tweetCount!)"
        followingCountLabel.text = "\(user.followingCount!)"
        followerCountLabel.text = "\(user.followersCount!)"
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
