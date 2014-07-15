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

//Creating Sound Variables
var BGaudioPlayer = AVAudioPlayer() // BackGround Audio Player
var audioPlayer = AVAudioPlayer()
var firstTime = true

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //BackGround Sound
        BackGroundMusic("WahWah", Format: "wav")
        
        var testObject = PFObject(className:"TestObject")
        testObject["foo"] = "bar"
        testObject.saveInBackground()    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func BackGroundMusic(Name: String,  Format:String){
        var MainSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(Name , ofType: Format))
        BGaudioPlayer = AVAudioPlayer(contentsOfURL: MainSound, error: nil)
        BGaudioPlayer.numberOfLoops = -1
        BGaudioPlayer.volume = 0.5
        if(BGaudioPlayer.playing == false){
            if(firstTime==true){
                BGaudioPlayer.volume = 0.5
            }
            BGaudioPlayer.play()
        }
        
    }
}

