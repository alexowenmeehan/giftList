//
//  SecondViewController.swift
//  Present Helper
//
//  Created by Alex Owen-Meehan on 16/08/2016.
//  Copyright © 2016 Alex Owen-Meehan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    //Variables for the text boxes used for entering Names and Descriptions
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtDescription: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Code for add button, adds new person to the array of classes in personManager
    @IBAction func addPersonToClass(sender: UIButton){
        
        //Checks to see if the name and description are not null values
        let name :String = txtName.text!
        let description :String = txtDescription.text!
        if (name != ""){
            if (description != ""){
                
                // if both fields have text and button is pressed, call the method for adding a person in the personMgr class
                personMgr.addPerson(name, description: description)
            }
        }
        
        //Prevent text box editing
        self.view.endEditing(true)
        
        //Change the value in the text boxes to become empty again
        txtName.text = ""
        txtDescription.text = ""
        
        //Return to the first view controller, primarily for convenience
        self.tabBarController!.selectedIndex = 0
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
}

