//
//  YouWonViewController.swift
//  Numbers
//
//  Created by Ulisses Alves Rodrigues on 15/07/2014.
//  Copyright (c) 2014 Gustavo Arthur da Costa. All rights reserved.
//


import UIKit

class YouWonViewController:
    
UIViewController {
    
    //Creating Outlets for the 3 buttons
    @IBOutlet var NextLevel: UIButton
    @IBOutlet var Challenge: UIButton
    @IBOutlet var MainMenu: UIButton
    
    //Outlet for the Label
    @IBOutlet var YouWon: UILabel
        //Default Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}