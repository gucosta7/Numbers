//
//  GameViewController.swift
//  Numbers
//
//  Created by Gustavo Arthur da Costa on 26/06/14.
//  Copyright (c) 2014 Gustavo Arthur da Costa. All rights reserved.
//

import UIKit
import AVFoundation
import CoreData


var level : CGFloat = 1

class GameViewController: UIViewController, UIApplicationDelegate {
    //Creating outlets to quit game button
    @IBOutlet var QuitGame: UIButton!
    @IBOutlet var PunishLabel: UILabel!
    
    //Creating function for the quit button
    @IBAction func showOkayCancelAlert() {
        //Stop Timer
        timer.invalidate()
        
        
        //Create alert
        let title = NSLocalizedString("Quit", comment: "")
        let message = NSLocalizedString("Are you sure you want to quit?", comment: "")
        let cancelButtonTitle = NSLocalizedString("Cancel", comment: "")
        let otherButtonTitle = NSLocalizedString("OK", comment: "")
        
        var versao = UIDevice.currentDevice().systemVersion;
        
        if (versao == "8.0"){
            
            
            self.view.backgroundColor = UIColor.blackColor()
            
            var alertController = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            
            // Create the actions.
            //Create action of the cancel button
            let cancelAction = UIAlertAction(title: cancelButtonTitle, style: .Cancel) { action in
                NSLog("The \"Okay/Cancel\" alert's cancel action occured.")
                self.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTimer"), userInfo: nil, repeats: true)
                self.view.backgroundColor = UIColor.whiteColor()
            }
            //Create action of the OK button
            let OKAction = UIAlertAction(title: otherButtonTitle, style: .Default) { action in
                NSLog("The \"Okay/Cancel\" alert's other action occured.")
                self.performSegueWithIdentifier("MainScreen", sender: UIButton())
            }
            
            // Add the actions.
            alertController.addAction(cancelAction)
            alertController.addAction(OKAction)
            
            presentViewController(alertController, animated: true, completion: nil)
            
        } else {
            auxiliar = 1
            self.view.backgroundColor = UIColor.blackColor()
            var alert: UIAlertView = UIAlertView (title: title, message: message, delegate: self, cancelButtonTitle: cancelButtonTitle)
            alert.addButtonWithTitle("OK")
            alert.show()
            alert.delegate = self

        }
        
    }
    //Creating function for alert iOS - 7
    func alertView(view :UIAlertView, clickedButtonAtIndex :Int) -> Void {
        if(auxiliar == 1){
            switch clickedButtonAtIndex {
            
            case 0:
                self.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTimer"), userInfo: nil, repeats: true)
            break;
            case 1:
                self.performSegueWithIdentifier("MainScreen", sender: UIButton())
            break;
            default:
                NSLog("Default");
            break;
            
            }
        }
        else if (auxiliar == 2){
            switch clickedButtonAtIndex{
            case 0:
                performSegueWithIdentifier("MainScreen", sender: UIButton())
                break;
            case 1:
                self.performSegueWithIdentifier("MainScreen", sender: UIButton())
                break;
                
            default:
                break;
            }
        
        }
    }

    //Creating outlets for buttons and labels
    @IBOutlet var numberLabel : UILabel!
    
    @IBOutlet var progressView : UIProgressView!
    
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
    @IBOutlet var punicao: UILabel!
    
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
    
    
    //Loading buttons for the first level
    let rednumber0 = UIImage(named: "0red.png") as UIImage
    let rednumber1 = UIImage(named: "1red.png") as UIImage
    let rednumber2 = UIImage(named: "2red.png") as UIImage
    let rednumber3 = UIImage(named: "3red.png") as UIImage
    let rednumber4 = UIImage(named: "4red.png") as UIImage
    let rednumber5 = UIImage(named: "5red.png") as UIImage
    let rednumber6 = UIImage(named: "6red.png") as UIImage
    let rednumber7 = UIImage(named: "7red.png") as UIImage
    let rednumber8 = UIImage(named: "8red.png") as UIImage
    let rednumber9 = UIImage(named: "9red.png") as UIImage
    
    let purpleNumber0 = UIImage(named: "0purple.png") as UIImage
    let purpleNumber1 = UIImage(named: "1purple.png") as UIImage
    let purpleNumber2 = UIImage(named: "2purple.png") as UIImage
    let purpleNumber3 = UIImage(named: "3purple.png") as UIImage
    let purpleNumber4 = UIImage(named: "4purple.png") as UIImage
    let purpleNumber5 = UIImage(named: "5purple.png") as UIImage
    let purpleNumber6 = UIImage(named: "6purple.png") as UIImage
    let purpleNumber7 = UIImage(named: "7purple.png") as UIImage
    let purpleNumber8 = UIImage(named: "8purple.png") as UIImage
    let purpleNumber9 = UIImage(named: "9purple.png") as UIImage
    
    let blueNumber0 = UIImage(named: "0blue.png") as UIImage
    let blueNumber1 = UIImage(named: "1blue.png") as UIImage
    let blueNumber2 = UIImage(named: "2blue.png") as UIImage
    let blueNumber3 = UIImage(named: "3blue.png") as UIImage
    let blueNumber4 = UIImage(named: "4blue.png") as UIImage
    let blueNumber5 = UIImage(named: "5blue.png") as UIImage
    let blueNumber6 = UIImage(named: "6blue.png") as UIImage
    let blueNumber7 = UIImage(named: "7blue.png") as UIImage
    let blueNumber8 = UIImage(named: "8blue.png") as UIImage
    let blueNumber9 = UIImage(named: "9blue.png") as UIImage
    
    let greenNumber0 = UIImage(named: "0green.png") as UIImage
    let greenNumber1 = UIImage(named: "1green.png") as UIImage
    let greenNumber2 = UIImage(named: "2green.png") as UIImage
    let greenNumber3 = UIImage(named: "3green.png") as UIImage
    let greenNumber4 = UIImage(named: "4green.png") as UIImage
    let greenNumber5 = UIImage(named: "5green.png") as UIImage
    let greenNumber6 = UIImage(named: "6green.png") as UIImage
    let greenNumber7 = UIImage(named: "7green.png") as UIImage
    let greenNumber8 = UIImage(named: "8green.png") as UIImage
    let greenNumber9 = UIImage(named: "9green.png") as UIImage
    

    //Sequence of numbers that the user will type
    var randNumbers: [Int] = []
    //Sequence of numbers for the keypad
    var keypadNumbers: [Int] = []
    
    //number of rounds
    var RoundsCounter: CGFloat = 1
    var timer = NSTimer()
    var counter = 0
    var min = 0
    var hor = 0

    var progress :Float = 0.0
    
    var punish = 0
    var auxiliar = 0 //Variable to set which alert the program is running
    var rounds : CGFloat = 10.0 //Game Levels
    
    var keyboardColor = 1 //number to change the keyboard color
    // 1 - black, 2 - purple, 3 - blue, 4 - green
    
    
    //Initializing random sequence and keypad
    override func viewDidLoad() {
        super.viewDidLoad()
        

        //Inititilaise label
        PunishLabel.text = " "
        //Create sequence of numbers
        randNumbers.append(Int(arc4random_uniform(10)))
        numberLabel.text = String(randNumbers[randNumbers.count - 1])
            
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("updateTimer"), userInfo: nil, repeats: true)

        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        let screenWidth = screenSize.width;
        let screenHeight = screenSize.height;
        
        
        if (screenHeight < 500) {
            
            QuitGame.frame = CGRect(x: 16, y: 419 ,width: 53,height: 51);
            btnGrid11.frame = CGRect(x: 30, y: 107 ,width: 70,height: 70);
            btnGrid12.frame = CGRect(x: 119, y: 107 ,width: 70,height: 70);
            btnGrid13.frame = CGRect(x: 210, y: 107 ,width: 70,height: 70);
            
            btnGrid21.frame = CGRect(x: 30, y: 185 ,width: 70,height: 70);
            btnGrid22.frame = CGRect(x: 119, y: 185 ,width: 70,height: 70);
            btnGrid23.frame = CGRect(x: 210, y: 185 ,width: 70,height: 70);
        
            btnGrid31.frame = CGRect(x: 30, y: 265 ,width: 70,height: 70);
            btnGrid32.frame = CGRect(x: 119, y: 265 ,width: 70,height: 70);
            btnGrid33.frame = CGRect(x: 210, y: 265 ,width: 70,height: 70);
            
            btnGrid41.frame = CGRect(x: 119, y: 345 ,width: 70,height: 70);
            
            counterLabel.frame = CGRect(x: 106, y: 420 ,width: 107,height: 21);
            punicao.frame = CGRect(x: 229, y: 420 ,width: 70,height: 21);
            progressView.frame = CGRect(x: 0, y: 475 ,width: 321,height: 4);
            
        } else {
            
            QuitGame.frame = CGRect(x: 16, y: 503 ,width: 53,height: 51);

        }


        
        progressView.setProgress(progress, animated: true)
        
        //gettting user's level
        
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        
        let myEntity: NSString = "Settings"
        
        var request = NSFetchRequest(entityName: myEntity)
        request.returnsObjectsAsFaults = false
        
        var results:NSArray = context.executeFetchRequest(request, error: nil)
        
        if (results.count > 0){
            var res = results[results.count - 1] as NSManagedObject
            level = res.valueForKey("level") as CGFloat
            
        }
        
        rounds = level * 5 + 5
        
        keypadNumbers = updateKeyPad(false)

        
        //Initialise time
        InitialTime()
        
    }
    func InitialTime(){
        if(level == 1){
            counter = 12
        }
        else if(level == 2){
            counter = 20
        }
        else if(level == 3){
            counter = 25
        }
        else if(level == 4){
            counter = 30
        }
        else if(level == 5){
            counter = 40
        }
        else if(level == 6){
            counter = 40
        }
        else if(level == 7){
            counter = 45
        }
        else if(level == 8){
            counter = 47
        }
        else if(level == 9){
            counter = 45
        }
        else if(level == 10){
            counter = 45
        }
    
    }
    
    //Function to update the timer on the screen and to paint the background
    func updateTimer(){
        
        counter--
        while(counter < 0){
            if (min > 0){
                min--
                counter = 60 + counter
                
            } else {
                min = 0
                counter = 0
                timer.invalidate()
                alertTimeOut()
            }
            
        }
            
        /*if(counter == 60){
                if (min == 60){
                    hor++
                    min = 0
                    counter = 0
                    
                } else {
                    min++
                    counter = 0
                }
        
        }
        */

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
        
        
        if (RoundsCounter >= rounds){
            timer.invalidate()
            
            var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
            var context:NSManagedObjectContext = appDel.managedObjectContext!
            
            let myEntity: NSString = "Results"
            var settings = NSEntityDescription.insertNewObjectForEntityForName(myEntity, inManagedObjectContext: context) as NSManagedObject
            
            settings.setValue(level, forKey: "level")
            settings.setValue(counterLabel.text, forKey: "score")
            
            context.save(nil)

            
            //Go to the YouWon view
            self.performSegueWithIdentifier("Win", sender: UIButton())
            
        } else {
            
            if (btnNumber == numberLabel.text.toInt()) {
                randNumbers.append(Int(arc4random_uniform(10)))
                numberLabel.text = String(randNumbers[randNumbers.count - 1])
                
                RoundsCounter++
                
                var increment = Float(rounds)
                
                progress = progress + 1/(increment)
                
                progressView.setProgress(progress, animated: true)
                
                //updating the numbers of the keypad
                keypadNumbers = updateKeyPad(true)
                
            } else {
                //Error Sound Effect
                Music("beep-02", Format:"wav")
                self.view.backgroundColor = UIColor.redColor()
                punish = punish + Int(level)
                PunishLabel.text = "- \(punish) sec"
                counter = counter - Int(level)
                
                //updating the numbers of the keypad
                keypadNumbers = updateKeyPad(false)

            }
            
            
            
            
        }
        
    }
    
    //Function to generate sounds
    func Music(Name: String,  Format:String){
        var MainSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(Name , ofType: Format))
        audioPlayer = AVAudioPlayer(contentsOfURL: MainSound, error: nil)
        audioPlayer.play()
    
    }
    
    //Generate random keyboard and set the correct image to the buttons
    func updateKeyPad (correct:Bool) -> [Int]{
        var sequence: [Int] = []
        var finalSequence: [Int] = []
        var images: [UIImage] = []
        var redImages:[UIImage] = []

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
        
        if (correct == true){
            if (keyboardColor < 4){
                keyboardColor = keyboardColor + 1
            } else {
                    keyboardColor = 1
            }
            
            
            
        }
        
        for number in finalSequence {
            
            switch keyboardColor {
            case 1:
                
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
                
            case 2:
                
                switch number {
                    
                case 0 : images.append(purpleNumber0)
                case 1 : images.append(purpleNumber1)
                case 2 : images.append(purpleNumber2)
                case 3 : images.append(purpleNumber3)
                case 4 : images.append(purpleNumber4)
                case 5 : images.append(purpleNumber5)
                case 6 : images.append(purpleNumber6)
                case 7 : images.append(purpleNumber7)
                case 8 : images.append(purpleNumber8)
                case 9 : images.append(purpleNumber9)
                    
                default : println("error")
                }
                
            case 3:
                
                switch number {
                    
                case 0 : images.append(blueNumber0)
                case 1 : images.append(blueNumber1)
                case 2 : images.append(blueNumber2)
                case 3 : images.append(blueNumber3)
                case 4 : images.append(blueNumber4)
                case 5 : images.append(blueNumber5)
                case 6 : images.append(blueNumber6)
                case 7 : images.append(blueNumber7)
                case 8 : images.append(blueNumber8)
                case 9 : images.append(blueNumber9)
                    
                default : println("error")
                }
                
            case 4:
                
                switch number {
                    
                case 0 : images.append(greenNumber0)
                case 1 : images.append(greenNumber1)
                case 2 : images.append(greenNumber2)
                case 3 : images.append(greenNumber3)
                case 4 : images.append(greenNumber4)
                case 5 : images.append(greenNumber5)
                case 6 : images.append(greenNumber6)
                case 7 : images.append(greenNumber7)
                case 8 : images.append(greenNumber8)
                case 9 : images.append(greenNumber9)
                    
                default : println("error")
                }

                
                
            default : println("error")
            }
            
            
           switch number{
                case 0 : redImages.append(rednumber0)
                case 1 : redImages.append(rednumber1)
                case 2 : redImages.append(rednumber2)
                case 3 : redImages.append(rednumber3)
                case 4 : redImages.append(rednumber4)
                case 5 : redImages.append(rednumber5)
                case 6 : redImages.append(rednumber6)
                case 7 : redImages.append(rednumber7)
                case 8 : redImages.append(rednumber8)
                case 9 : redImages.append(rednumber9)
                
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
        
        println(numberLabel.text)
        
        if(level==1){
            if(finalSequence[0] == numberLabel.text.toInt()){
                btnGrid11.setBackgroundImage(redImages[0], forState: UIControlState.Normal)
            }
            else if(finalSequence[1] == numberLabel.text.toInt()){
                btnGrid12.setBackgroundImage(redImages[1], forState: UIControlState.Normal)
            }
            else if(finalSequence[2] == numberLabel.text.toInt()){
                btnGrid13.setBackgroundImage(redImages[2], forState: UIControlState.Normal)
            }
            else if(finalSequence[3] == numberLabel.text.toInt()){
                btnGrid21.setBackgroundImage(redImages[3], forState: UIControlState.Normal)
            }
            else if(finalSequence[4] == numberLabel.text.toInt()){
                btnGrid22.setBackgroundImage(redImages[4], forState: UIControlState.Normal)
            }
            else if(finalSequence[5] == numberLabel.text.toInt()){
                btnGrid23.setBackgroundImage(redImages[5], forState: UIControlState.Normal)
            }
            else if(finalSequence[6] == numberLabel.text.toInt()){
                btnGrid31.setBackgroundImage(redImages[6], forState: UIControlState.Normal)
            }
            else if(finalSequence[7] == numberLabel.text.toInt()){
                btnGrid32.setBackgroundImage(redImages[7], forState: UIControlState.Normal)
            }
            else if(finalSequence[8] == numberLabel.text.toInt()){
                btnGrid33.setBackgroundImage(redImages[8], forState: UIControlState.Normal)
            }
            else if(finalSequence[9] == numberLabel.text.toInt()){
                btnGrid41.setBackgroundImage(redImages[9], forState: UIControlState.Normal)
            }
            
        }
        
       return finalSequence
    }
    func alertTimeOut(){
    
        var versao = UIDevice.currentDevice().systemVersion;
        
        if (versao == "8.0"){
            

            var alertController = UIAlertController(title: "Time Out!", message: "You Lost!", preferredStyle: .Alert)
            
            // Create the actions.

            //Create action of the OK button
            let MainAction = UIAlertAction(title:"Main Menu" , style: .Default) { action in
                NSLog("The \"Okay/Cancel\" alert's other action occured.")
                self.performSegueWithIdentifier("MainScreen", sender: UIButton())
            }
            
            /*let TryAgainAction = UIAlertAction(title:"Try Again!" , style: .Default) { action in
                NSLog("The \"Okay/Cancel\" alert's other action occured.")
                self.performSegueWithIdentifier("NextLevel", sender: UIButton())
            */
            // Add the actions.
            //alertController.addAction(TryAgainAction)
            alertController.addAction(MainAction)
            
            presentViewController(alertController, animated: true, completion: nil)
            
        } else {
            auxiliar = 2
            var alert: UIAlertView = UIAlertView (title: "Time Out!", message: "You Lost!", delegate: self, cancelButtonTitle: nil)
            //alert.addButtonWithTitle("Try Again")
            alert.addButtonWithTitle("Main Menu")
            alert.show()
            alert.delegate = self
            
        }
    }
}
