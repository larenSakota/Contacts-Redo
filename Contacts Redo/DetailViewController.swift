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
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var doneBtn: UIBarButtonItem!
    
    var contact: Contact?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set image to round
        photo.layer.cornerRadius = photo.frame.size.width/2
        photo.clipsToBounds = true
        
        // Populate label fields
        if let contact = self.contact {
            self.nameText.text = contact.name
            self.phoneText.text = contact.number
            self.photo.image = contact.photo
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Navigation
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
        let isPresentingInAddContactMode = presentingViewController is UINavigationController
        
        if isPresentingInAddContactMode {
            dismiss(animated: true, completion: nil)
        }
        else if let owningNavigationController = navigationController{
            owningNavigationController.popViewController(animated: true)
        }
        else {
            fatalError("The DetailViewController is not inside a navigation controller.")
        }
    }
    
    //MARK: Private Methods
    
    private func updateDoneButtonState() {
        // Disable the Done button if the text field is empty.
        let text = nameText.text ?? ""
        doneBtn.isEnabled = !text.isEmpty
    }


}

