//
//  ProfileCell.swift
//  chirpin
//
//  Created by Mateo Garcia on 5/5/15.
//  Copyright (c) 2015 Mateo Garcia. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var screennameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        setUpCell()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    // MARK: Setup
    
    func setUpCell() {
        // println(User.currentUser!.profileImageUrl!)
        profileImageView.setImageWithURL(NSURL(string: "http://pbs.twimg.com/profile_images/500680582515675138/wLuHYhOu_bigger.jpeg")!)
        // self.profileImageView.setImageWithURL(NSURL(string: User.currentUser!.profileImageUrl!)!)
        self.nameLabel.text = User.currentUser!.name
        self.screennameLabel.text = "@" + User.currentUser!.screenname!
    }

}
