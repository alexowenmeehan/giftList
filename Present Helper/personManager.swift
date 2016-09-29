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
    
        //Initialise all members in Person class
        init(name: String, description: String, presentIdeasDict: [Int: String], presentLinkDict: [Int: String]){
            self.name = name
            self.description = description
            self.presentIdeasDict = presentIdeasDict
            self.presentLinkDict = presentLinkDict
        }
    }

    class personManager{
    
        var people = [Person]()
    
        //Method for adding a persom from the Second View Controller, when adding a name and description
        func addPerson(name: String, description: String){
            
            //Present Ideas and Links are set to nil, but first entry in each dict is ignored when displaying links and presents
            people.append(Person(name: name, description: description, presentIdeasDict: [0: "nil"], presentLinkDict: [0: "nil"]))
        }
        
        //Method for adding a gift idea and possible gift link to the dictionary for a specific person
        func addGift(giftIdea: String, giftLink: String, index: Int){
        
            //Checks to see the number of ideas so new gift ideas and links do not overwrite any old ideas or links accidentally
            let noOfIdeas = people[index].presentIdeasDict.count
            
            people[index].presentIdeasDict[noOfIdeas] = giftIdea
            people[index].presentLinkDict[noOfIdeas] = giftLink
            
        }
        
        //Method for displaying all of the gifts and links that a person has associated with them
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
        
        func deletePresentFromList(sender: UIAlertAction){
            
            //Find relevant item in dictionary and remove from present dictionary and link dictionary
            
        }
        
        func reorganiseDictionary(){
            
            //Re-arrange dictionary after item has been deleted so that there are no missing numbers in the indexes
        
        }
    }