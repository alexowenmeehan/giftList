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

}
