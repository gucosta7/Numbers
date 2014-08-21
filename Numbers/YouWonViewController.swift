//
//  YouWonViewController.swift
//  Numbers
//
//  Created by Ulisses Alves Rodrigues on 15/07/2014.
//  Copyright (c) 2014 Gustavo Arthur da Costa. All rights reserved.
//


import UIKit
import CoreData

class YouWonViewController: UIViewController, UIApplicationDelegate {
    
    //Creating Outlets for the 3 buttons
    //@IBOutlet var NextLevel: UIButton
    //@IBOutlet var Challenge: UIButton
   // @IBOutlet var MainMenu: UIButton
    
    
    @IBOutlet var Score: UILabel!
    //Outlet for the Label
    @IBOutlet var YouWon: UILabel!
    
    
        //Default Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        
        let myEntity: NSString = "Results"
        var request = NSFetchRequest(entityName: myEntity)
        request.returnsObjectsAsFaults = false
        
        var results:NSArray = context.executeFetchRequest(request, error: nil)
        
        if (results.count > 0){
            var res = results[results.count - 1] as NSManagedObject
            YouWon.text = "Level: " + String(res.valueForKey("level") as Int)
            Score.text = res.valueForKey("score") as String
            
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //other functions
    @IBAction func NextLevel(sender: UIButton){
        

        if(level >= 10) {
            
            var versao = UIDevice.currentDevice().systemVersion;
            if(versao == "8.0"){
                var alertController = UIAlertController(title: title, message: "You Won All the Levels!", preferredStyle: .Alert)
                
                // Create the actions.
                //Create action of the cancel button
                
                let OKaction = UIAlertAction(title: "OK", style: .Default) { action in
                    self.performSegueWithIdentifier("NextLevel", sender: UIButton())
                }

                
                // Add the actions
                
                alertController.addAction(OKaction)
                
                
                
                presentViewController(alertController, animated: true, completion: nil)
            }
            else{
                var alert: UIAlertView = UIAlertView (title: "Congratulations!", message: "You Won All the Levels", delegate: self, cancelButtonTitle: "Cancel")
                alert.addButtonWithTitle("OK")
                alert.show()
                alert.delegate = self
            
            }
        }

        
        else{
            
            level = level + 1
            
            var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
            var context:NSManagedObjectContext = appDel.managedObjectContext!
            
            let myEntity: NSString = "Settings"
            var request = NSFetchRequest(entityName: myEntity)
            request.returnsObjectsAsFaults = false
            
            var results:NSArray = context.executeFetchRequest(request, error: nil)
            
            if (results.count > 0){
                var res = results[results.count - 1] as NSManagedObject
                res.setValue(level, forKey: "level")
                res.setValue(level, forKey: "levelMax")
                
                context.save(nil)
                
            }
            self.performSegueWithIdentifier("NextLevel", sender: UIButton())
        }
    }
    func alertView(view :UIAlertView, clickedButtonAtIndex :Int) -> Void {
        switch clickedButtonAtIndex {
        case 1:
            self.performSegueWithIdentifier("NextLevel", sender: UIButton())
            break;
        default:
            break;
        }
    }

    
}