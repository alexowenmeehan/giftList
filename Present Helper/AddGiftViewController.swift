//
//  AddGiftViewController.swift
//  Present Helper
//
//  Created by Alex Owen-Meehan on 24/08/2016.
//  Copyright © 2016 Alex Owen-Meehan. All rights reserved.
//

import UIKit

class AddGiftViewController: UIViewController {
    
    @IBOutlet weak var txtName: UILabel?
    @IBOutlet weak var txtDesc: UILabel!
    @IBOutlet weak var txtPresents_and_Links: UITextView!
    @IBOutlet weak var txtGiftIdea: UITextField!
    @IBOutlet weak var txtGiftLink: UITextField!
    @IBOutlet weak var btnAddGift: UIButton!
    @IBOutlet weak var btnDeleteGift: UIButton!
    
    //Variables in global scope to inherit from First View Controller
    var nameString: String = ""
    var descString: String = ""
    var giftIdeasDict:[Int: String] = [0: "nil"]
    var giftLinksDict:[Int: String] = [0: "nil"]
    var personArrayIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Load the name and description of the person the user has selected and load all of the presents and links associated
        txtName!.text = nameString
        txtDesc.text = descString
        txtPresents_and_Links.text = personMgr.populatePresentList(personArrayIndex)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addGiftIdeas (){
        
        //Check to see if the field for gift ideas is null. Ignore if nil, add to dictionary if not
        if txtGiftIdea.text != "" {
            personMgr.addGift(txtGiftIdea.text!, giftLink: txtGiftLink.text!, index: personArrayIndex)
            
            txtGiftIdea.text = ""
            txtGiftLink.text = ""
            
            //Repopilate the text view
            txtPresents_and_Links.text = personMgr.populatePresentList(personArrayIndex)
            
        }
        
    }
    
    // Function for deleting present from a list. Brings up an action sheet displaying all presents so far
    
    @IBAction func deleteGift(){
        
        // Creates the alert controller
        
        let alertController = UIAlertController(title:nil, message: "Select the Present you Want to Remove", preferredStyle: .ActionSheet)

        // Loop to add all the presents as actions in the Action Sheet and delete any presents specified, sent to method in personMgr
        
        if (personMgr.people[personArrayIndex].presentIdeasDict.count >= 1){
            for noOfGifts in 1...(personMgr.people[personArrayIndex].presentIdeasDict.count - 1){
                alertController.addAction(UIAlertAction(title: "\(personMgr.people[personArrayIndex].presentIdeasDict[noOfGifts]!)", style: .Default, handler: {(alert: UIAlertAction!) in personMgr.deletePresentFromList()}))
            }
            
            // Create a cancel action and add it to the list
            let defaultAction = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            
        }
        
        // Show the Action Sheet to the user
        presentViewController(alertController, animated: true, completion: nil)
        
    }

}
