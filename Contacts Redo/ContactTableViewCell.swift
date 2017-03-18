//
//  ContactTableViewCell.swift
//  Contacts Redo
//
//  Created by Laren Sakota on 3/18/17.
//  Copyright © 2017 3..2..1..GO. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {
    
    @IBOutlet weak var editImage: UIImageView!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var phoneText: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
