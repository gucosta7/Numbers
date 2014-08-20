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

var levelmax = 1
class OptionsViewController: UIViewController, UIApplicationDelegate, FBLoginViewDelegate {

    
    //Creating Outlet for facebook login/logout
 
    @IBOutlet var fbLoginView: FBLoginView!
    //Creating Outlets for the Effect and Volume Buttons
    @IBOutlet var Effects: UISwitch!
    @IBOutlet var backbutton: UIButton!
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
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        let screenWidth = screenSize.width;
        let screenHeight = screenSize.height;
        
        if (screenHeight < 500) {
            
            backbutton.frame = CGRect(x: 14, y: 399 ,width: 106,height: 64);
            ChangeLevel.frame = CGRect(x: 0, y: 370 ,width: 320,height: 30);
        } else {
            
            backbutton.frame = CGRect(x: 10, y: 484 ,width: 106,height: 64);
            
        }
        
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
        let title = NSLocalizedString("Change Level - You are on level: \(Int(level))" , comment: "")
        let message = NSLocalizedString("Please, choose one level to play", comment: "")
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
            let cancel = UIAlertAction(title: "Cancel", style: .Cancel) { action in
            }
            let level1action = UIAlertAction(title: level1, style: .Default) { action in
                level = 1
            }
            let level2action = UIAlertAction(title: level2, style: .Default) { action in
                level = 2

            }
            let level3action = UIAlertAction(title: level3, style: .Default) { action in
                level = 3

            }
            let level4action = UIAlertAction(title: level4, style: .Default) { action in
                level = 4

            }
            let level5action = UIAlertAction(title: level5, style: .Default) { action in
                level = 5
            }
            //Create action of the OK button
            let OKAction = UIAlertAction(title: "Cancel", style: .Cancel) { action in
            }
            
            // Add the actions
            alertController.addAction(cancel)

            alertController.addAction(level1action)
            if(levelmax>=2){
                alertController.addAction(level2action)
            }
            if(levelmax>=3){
                alertController.addAction(level3action)
            }
            if(levelmax>=4){
                alertController.addAction(level4action)
                }
            if(levelmax>=5){
                alertController.addAction(level5action)
                }
            
            
            presentViewController(alertController, animated: true, completion: nil)
            
        } else {
            self.view.backgroundColor = UIColor.blackColor()
            var alert: UIAlertView = UIAlertView (title: title, message: message, delegate: self, cancelButtonTitle: "Cancel")
            alert.addButtonWithTitle("Level 1")
            if(levelmax>=2){
                alert.addButtonWithTitle("Level 2")
            }
            if(levelmax>=3){
                alert.addButtonWithTitle("Level 3")
            }
            if(levelmax>=4){
                alert.addButtonWithTitle("Level 4")
            }
            if(levelmax>=5){
                alert.addButtonWithTitle("Level 5")
            }
            alert.show()
            alert.delegate = self
            
        }
    }

    //Creating function for alert iOS - 7
    func alertView(view :UIAlertView, clickedButtonAtIndex :Int) -> Void {
        switch clickedButtonAtIndex {
        case 1:
            level = 1
            break;
        case 2:
            level = 2
            break;
        case 3:
            level = 3
            break;
        case 4:
            level = 4
            break;
        case 5:
            level = 5
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
