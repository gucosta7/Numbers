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
    
    @IBOutlet var counterLabel: UILabel!

    
    var randNumbers: [Int] = []
    var RoundsCounter: Int = 1
    var timer = NSTimer()
    var counter = 0
    var min = 0
    var hor = 0
    
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
        
        //counterLabel.text = String(hor) + ":" + String(min) + ":" + String(counter)
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTimer"), userInfo: nil, repeats: true)
        
    }
    
    func updateTimer(){
        counter++
        
        if (counter == 60){
            if (min == 60){
                hor++
                min = 0
                counter = 0
                
            } else {
                min++
                counter = 0
            }
            
        }
        if (hor < 10){
            if (min < 10){
                if(counter < 10){
                        counterLabel.text = "0" + String(hor) + ":0" + String(min) + ":0" + String(counter)
                } else{
                    counterLabel.text = "0" + String(hor) + ":0" + String(min) + ":" + String(counter)
                }
            } else {
                counterLabel.text = "0" + String(hor) + ":" + String(min) + ":" + String(counter)
            }
            
        } else {
            counterLabel.text = String(hor) + ":" + String(min) + ":" + String(counter)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Grid Buttons being pressed
    @IBAction func btnGrid11_click(sender: UIButton){
        
        btnPressed(btnGrid11.titleLabel.text.toInt()!)
    }
    
    @IBAction func btnGrid12_click(sender: UIButton){
        
        btnPressed(btnGrid12.titleLabel.text.toInt()!)
    }
    
    @IBAction func btnGrid13_click(sender: UIButton){

        btnPressed(btnGrid13.titleLabel.text.toInt()!)
    }
    
    @IBAction func btnGrid21_click(sender: UIButton){
        
        btnPressed(btnGrid21.titleLabel.text.toInt()!)
    }
    
    @IBAction func btnGrid22_click(sender: UIButton){
        
        btnPressed(btnGrid22.titleLabel.text.toInt()!)
    }
    
    @IBAction func btnGrid23_click(sender: UIButton){
        
        btnPressed(btnGrid23.titleLabel.text.toInt()!)
    }
    
    @IBAction func btnGrid31_click(sender: UIButton){
        
        btnPressed(btnGrid31.titleLabel.text.toInt()!)
    }
    
    @IBAction func btnGrid32_click(sender: UIButton){
        
        btnPressed(btnGrid32.titleLabel.text.toInt()!)
    }
    
    @IBAction func btnGrid33_click(sender: UIButton){
        
        btnPressed(btnGrid33.titleLabel.text.toInt()!)
    }
    
    @IBAction func btnGrid41_click(sender: UIButton){
        
        btnPressed(btnGrid41.titleLabel.text.toInt()!)
    }
    
    
    //Updating grid and score
    func btnPressed (btnNumber : Int){
        
        if (RoundsCounter >= 10){
            
            testResult.text = "End of game - Rounds: " + String(randNumbers.count)
            timer.invalidate()
            
        } else {
            
            if (btnNumber == numberLabel.text.toInt()) {
                testResult.text = "Correct"
                randNumbers.append(Int(arc4random_uniform(10)))
                numberLabel.text = String(randNumbers[randNumbers.count - 1])
                
                RoundsCounter  = RoundsCounter + 1
                
                //Correct Answer Sound
                Music("button-4", Format:"wav")
                self.view.backgroundColor = UIColor.greenColor()
                
                NSThread.sleepForTimeInterval(1)
                
                self.view.backgroundColor = UIColor.whiteColor()
                
            } else {
                testResult.text = "Error"
                
                //Error Sound Effect
                Music("beep-02", Format:"wav")
                self.view.backgroundColor = UIColor.redColor()
                
            }
            
            updateGrid()
            
            
        }
        
    }
    
    //Function to generate sounds
    func Music(Name: String,  Format:String){
        var MainSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(Name , ofType: Format))
        audioPlayer = AVAudioPlayer(contentsOfURL: MainSound, error: nil)
        audioPlayer.play()
    
    }
    
    //Generate random keyboard
    func updateGrid () -> [Int]{
        var sequence: [Int] = []
        var anterior: Int!
        var atual: Int!
        anterior = Int(arc4random_uniform(10))
        println(anterior)
        sequence.append(anterior)
        
        for (var i = 0; i<9;++i){
            atual = Int(arc4random_uniform(10))
            while (atual == anterior){
                    atual = Int(arc4random_uniform(10))
                
            }
            anterior = atual
            println(atual)
            sequence.append(atual)
        }
        
       return sequence
    }
    
    
}
