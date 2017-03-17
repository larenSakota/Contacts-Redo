//
//  DetailViewController.swift
//  Contacts Redo
//
//  Created by Laren Sakota on 3/16/17.
//  Copyright © 2017 3..2..1..GO. All rights reserved.
//

import UIKit
import os.log


class DetailViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set image to round
        photo.layer.cornerRadius = photo.frame.size.width/2
        photo.clipsToBounds = true
        
        // Populate label fields
        if let contact = self.contact {
            self.nameLabel.text = contact.name
            self.phoneLabel.text = contact.number
            self.photo.image = contact.photo
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

