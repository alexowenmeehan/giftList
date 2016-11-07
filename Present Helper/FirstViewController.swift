//
//  FirstViewController.swift
//  Present Helper
//
//  Created by Alex Owen-Meehan on 16/08/2016.
//  Copyright © 2016 Alex Owen-Meehan. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    @IBOutlet weak var tblPeople: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Repopulate the table and show newly added cells after a new person has been added
    override func viewWillAppear(animated: Bool) {
        tblPeople.reloadData()
    }
    
    //Find the number of cells the table needs to show
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return personMgr.people.count
    }
    
    //Add delete function to names, currently swipe left button, consider changing to alternate view from top right edit button
   func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
        //If delete button is touched, remove instance of class from that index in the table view, reload data
        if (editingStyle == UITableViewCellEditingStyle.Delete){
            personMgr.people.removeAtIndex(indexPath.row)
            tblPeople.reloadData()
        }
    }
    
    //Function for generating the table view
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        //Declare the variable used for cells on the table view, specifies the font and style of the data in cells
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as!
            TableViewCell
        
        //Display each person's name in a label on the cell
        cell.txtName.text = personMgr.people[indexPath.row].name
        
        //Make the tag on the button the same as the index path row value from the table
        cell.btnShare.tag = indexPath.row
        
        //Add an action and type of button press control for the button on the cell
        cell.btnShare.addTarget(self, action: "shareAction", forControlEvents: .TouchUpInside)
        
        return cell
    }

    //Function for transfering to other view controller responsible for adding present ideas
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        self.performSegueWithIdentifier("showGifts", sender: self)
    }
    
    //Function for share button press
    @IBAction func shareAction(sender: UIButton) {
        
        //Send the person's name to the share event (Will add dictionary for presents at a later date
        let titleString = personMgr.people[sender.tag].name
        
        let firstActivityItem = "\(titleString)"
        
        let activityViewController : UIActivityViewController = UIActivityViewController(activityItems: [firstActivityItem], applicationActivities: nil)
        
        self.presentViewController(activityViewController, animated: true, completion: nil)
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        //If the identifier for moving to other view controller is the same as view controller for adding presents
        if (segue.identifier == "showGifts")
        {
            //Set the view controller to come up next to be the view controller for adding presents
            let upcoming: AddGiftViewController = segue.destinationViewController as! AddGiftViewController
            
            //Find the index path selected when the user presses a cell on the table
            let indexPath = tblPeople.indexPathForSelectedRow!
            
            //Send any relevant information to the next view controller, including name, description and present ideas
            upcoming.nameString = personMgr.people[indexPath.row].name
            upcoming.descString = personMgr.people[indexPath.row].description
            upcoming.giftIdeas = personMgr.people[indexPath.row].presentIdeas
            upcoming.giftLinks = personMgr.people[indexPath.row].presentLinks
            upcoming.personArrayIndex = indexPath.row
            
            self.tblPeople.deselectRowAtIndexPath(indexPath, animated: true)
        }
        
    }

}

