//
//  OptionsViewController.swift
//  Numbers
//
//  Created by Gustavo Arthur da Costa on 26/06/14.
//  Copyright (c) 2014 Gustavo Arthur da Costa. All rights reserved.
//

import UIKit
import CoreData

class OptionsViewController: UIViewController, UIApplicationDelegate, FBLoginViewDelegate {

    
    //Creating Outlet for facebook login/logout
 
    @IBOutlet var fbLoginView: FBLoginView!
    //Creating Outlets for the Effect and Volume Buttons
    @IBOutlet var Effects: UISwitch!
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
