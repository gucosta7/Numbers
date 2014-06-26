//
//  GameViewController.swift
//  Numbers
//
//  Created by Gustavo Arthur da Costa on 26/06/14.
//  Copyright (c) 2014 Gustavo Arthur da Costa. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet var counterLabel : UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var timer = NSTimer.scheduledTimerWithTimeInterval(0.4, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func update() {
        counterLabel.text = TimeRecord()
    }
    
    
    
    
    
    
    
}
