//
//  OptionsViewController.swift
//  Numbers
//
//  Created by Gustavo Arthur da Costa on 26/06/14.
//  Copyright (c) 2014 Gustavo Arthur da Costa. All rights reserved.
//

import UIKit

class OptionsViewController:

UIViewController {

    //Creating Outlets for the Effect and Volume Buttons
    @IBOutlet var Effects: UISwitch
    @IBOutlet var Volume: UISlider

    
    //Default Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Function for the Effect Button
    @IBAction func EffectsSwitch(sender: AnyObject){
        audioPlayer.volume = 0
        firstTime = false
    }
    
    //Function for the Volume Button
    @IBAction func Volume(sender: AnyObject){
        BGaudioPlayer.volume = Float(Volume.value)
        firstTime = false
    }
    
}
