//
//  Contact.swift
//  Contacts Redo
//
//  Created by Laren Sakota on 3/17/17.
//  Copyright © 2017 3..2..1..GO. All rights reserved.
//

import UIKit
import os.log


class Contact: NSObject, NSCoding {
    
    // MARK: Properties
    
    var name: String?
    var number: String?
    var photo: UIImage?
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("contacts")
    
    //MARK: Types
    
    struct Person {
        static let name = "name"
        static let number = "number"
        static let photo = "photo"
    }
    
    // MARK: Initialization
    
    init(name: String? = nil, number: String? = nil, photo: UIImage? = nil) {
        self.name = name
        self.number = number
        self.photo = photo
        super.init()
    }
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: Person.name)
        aCoder.encode(number, forKey: Person.number)
        aCoder.encode(photo, forKey: Person.photo)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        
        // Because all properties are optional for Contact, just use conditional cast.
        let name = aDecoder.decodeObject(forKey: Person.name) as? String
        let number = aDecoder.decodeObject(forKey: Person.number) as? String
        let photo = aDecoder.decodeObject(forKey: Person.photo) as? UIImage
        
        // Must call designated initializer.
        self.init(name: name, number: number, photo: photo)
        
    }


}
