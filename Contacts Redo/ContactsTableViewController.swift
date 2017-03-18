//
//  ContactsTableViewController.swift
//  Contacts Redo
//
//  Created by Laren Sakota on 3/16/17.
//  Copyright © 2017 3..2..1..GO. All rights reserved.
//

import UIKit
import os.log
import Contacts
import ContactsUI

class ContactsTableViewController: UITableViewController {

    var contacts = [Contact]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        
        loadSampleContacts()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.contacts.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactList", for: indexPath)
        
        let contact = contacts[indexPath.row]

        if let name = contact.name {
            cell.textLabel?.text = name
        }

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "AddItem":
            os_log("Adding a new contact.", log: OSLog.default, type: .debug)
            
        case "ShowDetail":
            let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)!
            let contact = self.contacts[indexPath.row]
            let destination = segue.destination as! DetailViewController
            destination.contact = contact
            
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)!
//        let contact = self.contacts[indexPath.row]
//        let destination = segue.destination as! DetailViewController
//        destination.contact = contact
//    }
    
    //MARK: Private Methods
    
    private func loadSampleContacts() {
        
        let photo1 = UIImage(named: "contact1")
        
        let contact1 = Contact(name: "Sheilla Sakota", number: "123-456-7890", photo: photo1)
        
        contacts += [contact1]
    }
    
    private func saveContacts() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(contacts, toFile: Contact.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Contacts successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save contacts...", log: OSLog.default, type: .error)
        }
    }
    
    private func loadContacts() -> [Contact]?  {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Contact.ArchiveURL.path) as? [Contact]
    }


}
