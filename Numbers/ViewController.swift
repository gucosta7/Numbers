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
    
    @IBOutlet var play : UIButton!
    @IBOutlet var leaderboard : UIButton!
    @IBOutlet var options : UIButton!
    
    @IBOutlet var image : UIImageView!
    
    @IBOutlet var lblPlay : UILabel!
    @IBOutlet var lblLeaderboard : UILabel!
    @IBOutlet var lblOptions : UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        var musicOn: Bool
        // Do any additional setup after loading the view, typically from a nib.
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        let screenWidth = screenSize.width;
        let screenHeight = screenSize.height;
        
        if (screenHeight < 500) {
            
            
            image.frame = CGRect(x: 0, y: 0 ,width: 320,height: 480);
            image.image = UIImage(named: "background.png")
            
            play.frame = CGRect(x: 113, y: 42 ,width: 90,height: 89);
            leaderboard.frame = CGRect(x: 113, y: 190 ,width: 90,height: 84);
            options.frame = CGRect(x: 114, y: 327 ,width: 90,height: 84);
            
            lblPlay.frame = CGRect(x: 0, y: 19 ,width: 320,height: 21);
            lblLeaderboard.frame = CGRect(x: 0, y: 167 ,width: 320,height: 21);
            lblOptions.frame = CGRect(x: 0, y: 307 ,width: 320,height: 21);
           
        } else {
            
            image.frame = CGRect(x: 0, y: 0 ,width: 320,height: 568);
            image.image = UIImage(named: "R4background.png")
            
            play.frame = CGRect(x: 113, y: 82 ,width: 90,height: 89);
            leaderboard.frame = CGRect(x: 113, y: 230 ,width: 90,height: 84);
            options.frame = CGRect(x: 114, y: 370 ,width: 90,height: 84);
        }
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

