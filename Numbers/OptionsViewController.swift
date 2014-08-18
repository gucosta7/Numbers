//
//  OptionsViewController.swift
//  Numbers
//
//  Created by Gustavo Arthur da Costa on 26/06/14.
//  Copyright (c) 2014 Gustavo Arthur da Costa. All rights reserved.
//

import UIKit
import CoreData

//levelmaximo - deletar depois

var levelmax = 5
class OptionsViewController: UIViewController, UIApplicationDelegate, FBLoginViewDelegate {

    
    //Creating Outlet for facebook login/logout
 
    @IBOutlet var fbLoginView: FBLoginView!
    //Creating Outlets for the Effect and Volume Buttons
    @IBOutlet var Effects: UISwitch!
    //Change Level Button

    @IBOutlet var ChangeLevel: UIButton!
    var musicOn:Bool!
    
    
    //Default Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
        
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        
        var request = NSFetchRequest(entityName: "Settings")
        request.returnsObjectsAsFaults = false
        
        var results:NSArray = context.executeFetchRequest(request, error: nil)
        
        if (results.count > 0){
            var res = results[results.count - 1] as NSManagedObject
            musicOn = res.valueForKey("music") as Bool

            Effects.setOn(musicOn, animated: true)
            
        }
        //Facebook Login
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
    }

    //Facebook Functions
    func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
        println("User Logged In")
    }
    
    func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser) {
        println("User: \(user)")
        println("User ID: \(user.objectID)")
        println("User Name: \(user.name)")
        var userEmail = user.objectForKey("email") as String
        println("User Email: \(userEmail)")
    }
    
    func loginViewShowingLoggedOutUser(loginView : FBLoginView!) {
        println("User Logged Out")
    }
    
    func loginView(loginView : FBLoginView!, handleError:NSError) {
        println("Error: \(handleError.localizedDescription)")
    }
    
    //End of Facebook functions
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Function for Change Level Button
    @IBAction func ChangeLevel(sender: UIButton){
    
    //Display Alert
        
        
        //Create alert
        let title = NSLocalizedString("Quit", comment: "")
        let message = NSLocalizedString("Please, choose one level /n You can't choose a level you haven't played", comment: "")
        let level1 = NSLocalizedString("Level 1", comment: "")
        let level2 = NSLocalizedString("Level 2", comment: "")
        let level3 = NSLocalizedString("Level 3", comment: "")
        let level4 = NSLocalizedString("Level 4", comment: "")
        let level5 = NSLocalizedString("Level 5", comment: "")
        var versao = UIDevice.currentDevice().systemVersion;
        
        if (versao == "8.0"){
            
            
            var alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            
            // Create the actions.
            //Create action of the cancel button
            let level1action = UIAlertAction(title: level1, style: .Default) { action in
                level = 1
            }
            let level2action = UIAlertAction(title: level2, style: .Default) { action in
                if(levelmax >= 2){
                    level = 2
                }
            }
            let level3action = UIAlertAction(title: level3, style: .Default) { action in
                if(levelmax >= 2){
                    level = 3
                }
            }
            let level4action = UIAlertAction(title: level4, style: .Default) { action in
            }
            let level5action = UIAlertAction(title: level5, style: .Default) { action in
            }
            //Create action of the OK button
            let OKAction = UIAlertAction(title: "Cancel", style: .Cancel) { action in
            }
            
            // Add the actions.
            alertController.addAction(level1action)
            alertController.addAction(level2action)
            alertController.addAction(level3action)
            alertController.addAction(level4action)
            alertController.addAction(level5action)
            
            
            presentViewController(alertController, animated: true, completion: nil)
            
        } else {
            self.view.backgroundColor = UIColor.blackColor()
            var alert: UIAlertView = UIAlertView (title: title, message: message, delegate: self, cancelButtonTitle: "Cancel")
            alert.addButtonWithTitle("OK")
            alert.show()
            alert.delegate = self
            
        }
        
        
        
    }
    //Creating function for alert iOS - 7
    func alertView(view :UIAlertView, clickedButtonAtIndex :Int) -> Void {
        switch clickedButtonAtIndex {
            
        case 0:
            break;
        case 1:
            break;
        default:
            break;
        }
    }
    

    //Function for the Effect Button
    @IBAction func EffectsSwitch(sender: AnyObject){
        
        //DeleteAllRows()
        
        if (Effects.on == false) {
            
            audioPlayer.volume = 0
            BGaudioPlayer.volume = 0
            
            var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
            var context:NSManagedObjectContext = appDel.managedObjectContext!
            
            
            //var settings = NSEntityDescription.insertNewObjectForEntityForName("Settings", inManagedObjectContext: context) as NSManagedObject
            
            var request = NSFetchRequest(entityName: "Settings")
            request.returnsObjectsAsFaults = false
            
            var results:NSArray = context.executeFetchRequest(request, error: nil)
            
            if (results.count > 0){
                var res = results[results.count - 1] as NSManagedObject
                res.setValue(false, forKey: "music")
                
                context.save(nil)
                
            }

            
            //settings.setValue(false, forKey: "music")
            
            //context.save(nil)
            
        } else {
            audioPlayer.volume = 0.5
            BGaudioPlayer.volume = 0.5
            
            var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
            var context:NSManagedObjectContext = appDel.managedObjectContext!
            
            
            //var settings = NSEntityDescription.insertNewObjectForEntityForName("Settings", inManagedObjectContext: context) as NSManagedObject
            
            //settings.setValue(true, forKey: "music")
            
            //context.save(nil)
            
            var request = NSFetchRequest(entityName: "Settings")
            request.returnsObjectsAsFaults = false
            
            var results:NSArray = context.executeFetchRequest(request, error: nil)
            
            if (results.count > 0){
                var res = results[results.count - 1] as NSManagedObject
                res.setValue(true, forKey: "music")
                
                context.save(nil)
                
            }
        }
        
        
        
        
    }
    
    /*func DeleteAllRows() {
        
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        
        var request = NSFetchRequest(entityName: "Settings")
        request.returnsObjectsAsFaults = false
        
        var results:NSArray = context.executeFetchRequest(request, error: nil)
        
        if (results.count > 0){
            var res : NSManagedObject!
            for (var i = 0; i<results.count; ++i) {
            res = results[i] as NSManagedObject
            context.deleteObject(res)
                
            }
            
        } else {
            println("vazio")
        }
        
    }*/
    
    
}
