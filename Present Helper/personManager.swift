//
//  Person.swift
//  Present Helper
//
//  Created by Alex Owen-Meehan on 18/08/2016.
//  Copyright © 2016 Alex Owen-Meehan. All rights reserved.
//

import UIKit

var personMgr: personManager = personManager()

class person{
    
    var name:String
    var description:String
    var presentIdeasDict:[Int: String]
    var presentLinkDict:[Int: String]
    
    init(name: String, description: String, presentIdeasDict: [Int: String], presentLinkDict: [Int: String]){
        self.name = "Default"
        self.description = "Default"
        self.presentIdeasDict = [
            0: "nil"
        ]
        self.presentLinkDict = [       //Use same key for name of present idea and link for the present
            0: "nil"
        ]
    }
}

class personManager: NSObject {
    
    var people = [person]()
    
    func addPerson(name: String, description: String){
        people.append(person(name: name, description: description, presentIdeasDict: [0: "nil"], presentLinkDict: [0: "nil"]))
    }
    
}
