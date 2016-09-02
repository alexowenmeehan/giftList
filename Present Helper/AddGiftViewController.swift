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
    
    //Variables in global scope to inherit from First View Controller
    var nameString: String = ""
    var descString: String = ""
    var giftIdeasDict:[Int: String]!
    var giftLinksDict:[Int: String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Load the name and description of the person the user has selected and load all of the presents and links associated
        txtName!.text = nameString
        txtDesc.text = descString
        populateList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func populateList(){
        
        var listOfGifts:String = ""
        
        //Check if there is actually any entries in the dictionary for gift ideas, no not load if only nil value is present
        if giftIdeasDict.count >= 2 {
            for index in 1...giftIdeasDict.count{
                listOfGifts += "\((index)). \(giftIdeasDict![index]) \(giftLinksDict![index])\n"
            }
        }
        
        //Show all gift ideas and links in the UI text view
        txtPresents_and_Links.text = listOfGifts
    }
    
    @IBAction func addGiftIdeas (){
        
        //Check to see if the field for gift ideas is null. Ignore if nil, add to dictionary if not
        if txtGiftIdea.text != "" {
            let index = giftIdeasDict.count
            giftIdeasDict[index] = txtGiftIdea.text
            
            if txtGiftLink.text != "" {
                    giftLinksDict[index] = txtGiftLink.text
            }
            
            //Repopilate the text view
            populateList()
            
        }
        
    }

}
