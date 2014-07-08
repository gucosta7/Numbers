//
//  GameViewController.swift
//  Numbers
//
//  Created by Gustavo Arthur da Costa on 26/06/14.
//  Copyright (c) 2014 Gustavo Arthur da Costa. All rights reserved.
//

import UIKit
import AVFoundation


class GameViewController: UIViewController {
    //Creating Sound Variables
    var audioPlayer = AVAudioPlayer()
    
    //Creating outlets for buttons and labels
    @IBOutlet var numberLabel : UILabel!
    @IBOutlet var testResult : UILabel!
    
    @IBOutlet var btnGrid11 : UIButton!
    @IBOutlet var btnGrid12 : UIButton!
    @IBOutlet var btnGrid13 : UIButton!
    @IBOutlet var btnGrid21 : UIButton!
    @IBOutlet var btnGrid22 : UIButton!
    @IBOutlet var btnGrid23 : UIButton!
    @IBOutlet var btnGrid31 : UIButton!
    @IBOutlet var btnGrid32 : UIButton!
    @IBOutlet var btnGrid33 : UIButton!
    @IBOutlet var btnGrid41 : UIButton!

    
    var randNumbers: [Int] = []
    var RoundsCounter: Int = 1;
    
    //Initializing random sequence and grid
    override func viewDidLoad() {
        super.viewDidLoad()

        randNumbers.append(Int(arc4random_uniform(10)))
        numberLabel.text = String(randNumbers[randNumbers.count - 1])
        
        btnGrid11.setTitle("1", forState: UIControlState.Normal)
        btnGrid12.setTitle("2", forState: UIControlState.Normal)
        btnGrid13.setTitle("3", forState: UIControlState.Normal)
        btnGrid21.setTitle("4", forState: UIControlState.Normal)
        btnGrid22.setTitle("5", forState: UIControlState.Normal)
        btnGrid23.setTitle("6", forState: UIControlState.Normal)
        btnGrid31.setTitle("7", forState: UIControlState.Normal)
        btnGrid32.setTitle("8", forState: UIControlState.Normal)
        btnGrid33.setTitle("9", forState: UIControlState.Normal)
        btnGrid41.setTitle("0", forState: UIControlState.Normal)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Grid Buttons being pressed
    @IBAction func btnGrid11_click(sender: UIButton){
        
        updateGrid(btnGrid11.titleLabel.text.toInt()!)
    }
    
    @IBAction func btnGrid12_click(sender: UIButton){
        
        updateGrid(btnGrid12.titleLabel.text.toInt()!)
    }
    
    @IBAction func btnGrid13_click(sender: UIButton){

        updateGrid(btnGrid13.titleLabel.text.toInt()!)
    }
    
    @IBAction func btnGrid21_click(sender: UIButton){
        
        updateGrid(btnGrid21.titleLabel.text.toInt()!)
    }
    
    @IBAction func btnGrid22_click(sender: UIButton){
        
        updateGrid(btnGrid22.titleLabel.text.toInt()!)
    }
    
    @IBAction func btnGrid23_click(sender: UIButton){
        
        updateGrid(btnGrid23.titleLabel.text.toInt()!)
    }
    
    @IBAction func btnGrid31_click(sender: UIButton){
        
        updateGrid(btnGrid31.titleLabel.text.toInt()!)
    }
    
    @IBAction func btnGrid32_click(sender: UIButton){
        
        updateGrid(btnGrid32.titleLabel.text.toInt()!)
    }
    
    @IBAction func btnGrid33_click(sender: UIButton){
        
        updateGrid(btnGrid33.titleLabel.text.toInt()!)
    }
    
    @IBAction func btnGrid41_click(sender: UIButton){
        
        updateGrid(btnGrid41.titleLabel.text.toInt()!)
    }
    
    
    //Updating grid and score
    func updateGrid (btnNumber : Int){
        
        if (RoundsCounter >= 10){
            
            testResult.text = "End of game - Rounds: " + String(randNumbers.count)
            
        } else {
            
            if (btnNumber == numberLabel.text.toInt()) {
                testResult.text = "Correct"
                randNumbers.append(Int(arc4random_uniform(10)))
                numberLabel.text = String(randNumbers[randNumbers.count - 1])
                
                RoundsCounter  = RoundsCounter + 1
                //Correct Answer Sound
                Music("button-4", Format:"wav")
            } else {
                testResult.text = "Error"
                
                //Error Sound Effect
                Music("beep-02", Format:"wav")
                
            }
            
            
        }
        
    }
    
    //Function to generate sounds
    func Music(Name: String,  Format:String){
        var MainSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(Name , ofType: Format))
        audioPlayer = AVAudioPlayer(contentsOfURL: MainSound, error: nil)
        audioPlayer.play()
    
    }
    
    
}
