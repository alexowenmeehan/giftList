//
//  Person.swift
//  Present Helper
//
//  Created by Alex Owen-Meehan on 18/08/2016.
//  Copyright © 2016 Alex Owen-Meehan. All rights reserved.
//

import UIKit

    var personMgr: personManager = personManager()

    class Person{
    
        var name:String
        var description:String
        var presentIdeasDict:[Int: String]
        var presentLinkDict:[Int: String]
    
        init(name: String, description: String, presentIdeasDict: [Int: String], presentLinkDict: [Int: String]){
            self.name = name
            self.description = description
            self.presentIdeasDict = presentIdeasDict
            self.presentLinkDict = presentLinkDict
        }
    }

    class personManager{
    
        var people = [Person]()
    
        func addPerson(name: String, description: String){
            people.append(Person(name: name, description: description, presentIdeasDict: [0: "nil"], presentLinkDict: [0: "nil"]))
        }
    
    }
