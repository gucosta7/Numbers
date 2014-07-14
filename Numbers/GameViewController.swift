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
    
    //Loading button images
    let number0 = UIImage(named: "0.png") as UIImage
    let number1 = UIImage(named: "1.png") as UIImage
    let number2 = UIImage(named: "2.png") as UIImage
    let number3 = UIImage(named: "3.png") as UIImage
    let number4 = UIImage(named: "4.png") as UIImage
    let number5 = UIImage(named: "5.png") as UIImage
    let number6 = UIImage(named: "6.png") as UIImage
    let number7 = UIImage(named: "7.png") as UIImage
    let number8 = UIImage(named: "8.png") as UIImage
    let number9 = UIImage(named: "9.png") as UIImage

    //Sequence of numbers that the user will type
    var randNumbers: [Int] = []
    //Sequence of numbers for the keypad
    var keypadNumbers: [Int] = []
    
    //number of rounds
    var RoundsCounter: Int = 1
    var timer = NSTimer()
    var counter = 0
    var min = 0
    var hor = 0
    
    //Initializing random sequence and keypad
    override func viewDidLoad() {
        super.viewDidLoad()

        randNumbers.append(Int(arc4random_uniform(10)))
        numberLabel.text = String(randNumbers[randNumbers.count - 1])
        
        keypadNumbers = updateKeyPad()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTimer"), userInfo: nil, repeats: true)
        
    }
    
    //Function to update the timer on the screen and to paint the background
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
        
        self.view.backgroundColor = UIColor.whiteColor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Keypad Buttons being pressed
    @IBAction func btnGrid11_click(sender: UIButton){
        
        btnPressed(keypadNumbers[0])
    }
    
    @IBAction func btnGrid12_click(sender: UIButton){
        
        btnPressed(keypadNumbers[1])
    }
    
    @IBAction func btnGrid13_click(sender: UIButton){

        btnPressed(keypadNumbers[2])
    }
    
    @IBAction func btnGrid21_click(sender: UIButton){
        
        btnPressed(keypadNumbers[3])
    }
    
    @IBAction func btnGrid22_click(sender: UIButton){
        
        btnPressed(keypadNumbers[4])
    }
    
    @IBAction func btnGrid23_click(sender: UIButton){
        
        btnPressed(keypadNumbers[5])
    }
    
    @IBAction func btnGrid31_click(sender: UIButton){
        
        btnPressed(keypadNumbers[6])
    }
    
    @IBAction func btnGrid32_click(sender: UIButton){
        
        btnPressed(keypadNumbers[7])
    }
    
    @IBAction func btnGrid33_click(sender: UIButton){
        
        btnPressed(keypadNumbers[8])
    }
    
    @IBAction func btnGrid41_click(sender: UIButton){
        
        btnPressed(keypadNumbers[9])
    }
    
    
    //Updating keypad and score
    func btnPressed (btnNumber : Int){
        
        if (RoundsCounter >= 10){
            
            testResult.text = "End of game - Rounds: " + String(randNumbers.count)
            timer.invalidate()
            
        } else {
            
            if (btnNumber == numberLabel.text.toInt()) {
                testResult.text = "Correct"
                randNumbers.append(Int(arc4random_uniform(10)))
                numberLabel.text = String(randNumbers[randNumbers.count - 1])
                
                RoundsCounter++
                
                //Correct Answer Sound
                Music("button-4", Format:"wav")
                self.view.backgroundColor = UIColor.greenColor()
                
                
                //self.view.backgroundColor = UIColor.whiteColor()
                
            } else {
                testResult.text = "Error"
                
                //Error Sound Effect
                Music("beep-02", Format:"wav")
                self.view.backgroundColor = UIColor.redColor()
                
            }
            
            //updating the numbers of the keypad
            keypadNumbers = updateKeyPad()
            
            
        }
        
    }
    
    //Function to generate sounds
    func Music(Name: String,  Format:String){
        var MainSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(Name , ofType: Format))
        audioPlayer = AVAudioPlayer(contentsOfURL: MainSound, error: nil)
        audioPlayer.play()
    
    }
    
    //Generate random keyboard and set the correct image to the buttons
    func updateKeyPad () -> [Int]{
        var sequence: [Int] = []
        var finalSequence: [Int] = []
        var images: [UIImage] = []

        var number: Int!
        
        sequence.append(0)
        sequence.append(1)
        sequence.append(2)
        sequence.append(3)
        sequence.append(4)
        sequence.append(5)
        sequence.append(6)
        sequence.append(7)
        sequence.append(8)
        sequence.append(9)
        
        for (var i:UInt32 = 10; i>0;--i){
            number = Int(arc4random_uniform(i))
            finalSequence.append(sequence[number])
            sequence.removeAtIndex(number)
            
        }
        
        println(finalSequence)
        
        for number in finalSequence {
            switch number {
                
            case 0 : images.append(number0)
            case 1 : images.append(number1)
            case 2 : images.append(number2)
            case 3 : images.append(number3)
            case 4 : images.append(number4)
            case 5 : images.append(number5)
            case 6 : images.append(number6)
            case 7 : images.append(number7)
            case 8 : images.append(number8)
            case 9 : images.append(number9)
                
            default : println("error")
            }
        }
        
        btnGrid11.setBackgroundImage(images[0], forState: UIControlState.Normal)
        btnGrid12.setBackgroundImage(images[1], forState: UIControlState.Normal)
        btnGrid13.setBackgroundImage(images[2], forState: UIControlState.Normal)
        
        btnGrid21.setBackgroundImage(images[3], forState: UIControlState.Normal)
        btnGrid22.setBackgroundImage(images[4], forState: UIControlState.Normal)
        btnGrid23.setBackgroundImage(images[5], forState: UIControlState.Normal)
        
        btnGrid31.setBackgroundImage(images[6], forState: UIControlState.Normal)
        btnGrid32.setBackgroundImage(images[7], forState: UIControlState.Normal)
        btnGrid33.setBackgroundImage(images[8], forState: UIControlState.Normal)
        
        btnGrid41.setBackgroundImage(images[9], forState: UIControlState.Normal)

        
       return finalSequence
    }
    
    
}
