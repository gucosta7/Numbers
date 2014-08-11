//
//  ViewController.swift
//  Numbers
//
//  Created by Gustavo Arthur da Costa on 26/06/14.
//  Copyright (c) 2014 Gustavo Arthur da Costa. All rights reserved.
//
//

import UIKit
import AVFoundation
import CoreData

//Creating Sound Variables
var BGaudioPlayer = AVAudioPlayer() // BackGround Audio Player
var audioPlayer = AVAudioPlayer()

class ViewController: UIViewController, UIApplicationDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        var musicOn: Bool
        // Do any additional setup after loading the view, typically from a nib.
        //BackGround Sound
        
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        
        var request = NSFetchRequest(entityName: "Settings")
        request.returnsObjectsAsFaults = false
        
        var results:NSArray = context.executeFetchRequest(request, error: nil)
        
        if (results.count > 0){
           var res = results[results.count - 1] as NSManagedObject
           musicOn = res.valueForKey("music") as Bool
            
            if (musicOn == true){
                    BackGroundMusic("WahWah", Format: "wav", Volume: 0.5)
            } else {
                BackGroundMusic("WahWah", Format: "wav", Volume: 0.0)

            }
            
        } else {
            
            var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
            var context:NSManagedObjectContext = appDel.managedObjectContext!
            
            
            var settings = NSEntityDescription.insertNewObjectForEntityForName("Settings", inManagedObjectContext: context) as NSManagedObject
            
            settings.setValue(true, forKey: "music")
            settings.setValue(1, forKey: "level")
            
            context.save(nil)

            
        }
        
        
        InitialSound("button-4", Format:"wav")

    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Two functions that initialise the sound variables as soon as the program starts

    //Initialise BackGroundMusic
    func BackGroundMusic(Name: String,  Format:String, Volume: Float){
        var MainSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(Name , ofType: Format))
        BGaudioPlayer = AVAudioPlayer(contentsOfURL: MainSound, error: nil)
        BGaudioPlayer.numberOfLoops = -1
        BGaudioPlayer.volume = Volume
        BGaudioPlayer.play()
        
    }
    
    //Initialise effects sound
    func InitialSound(Name: String,  Format:String){
        var MainSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(Name , ofType: Format))
        audioPlayer = AVAudioPlayer(contentsOfURL: MainSound, error: nil)
        
    }
}

