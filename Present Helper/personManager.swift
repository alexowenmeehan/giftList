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
        
        func addGift(giftIdea: String, giftLink: String, index: Int){
        
            let noOfIdeas = people[index].presentIdeasDict.count
            
            people[index].presentIdeasDict[noOfIdeas] = giftIdea
            people[index].presentLinkDict[noOfIdeas] = giftLink
            
        }
        
        func populatePresentList(index:Int) -> String{
            var listOfGifts:String = ""
            
            //Check if there is actually any entries in the dictionary for gift ideas, no not load if only nil value is present
            if people[index].presentIdeasDict.count >= 2 {
                for count in 1...(people[index].presentIdeasDict.count - 1){
                    listOfGifts += "\((count)). \(people[index].presentIdeasDict[count]!) (Link: \(people[index].presentLinkDict[count]!))\n"
                    
                }
            }
            
            return listOfGifts
        }
    }
