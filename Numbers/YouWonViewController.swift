//
//  YouWonViewController.swift
//  Numbers
//
//  Created by Ulisses Alves Rodrigues on 15/07/2014.
//  Copyright (c) 2014 Gustavo Arthur da Costa. All rights reserved.
//


import UIKit
import CoreData

class YouWonViewController: UIViewController, UIApplicationDelegate {
    
    //Creating Outlets for the 3 buttons
    //@IBOutlet var NextLevel: UIButton
    //@IBOutlet var Challenge: UIButton
   // @IBOutlet var MainMenu: UIButton
    
    
    @IBOutlet var Score: UILabel!
    //Outlet for the Label
    @IBOutlet var YouWon: UILabel!
    
    
        //Default Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        
        let myEntity: NSString = "Results"
        var request = NSFetchRequest(entityName: myEntity)
        request.returnsObjectsAsFaults = false
        
        var results:NSArray = context.executeFetchRequest(request, error: nil)
        
        if (results.count > 0){
            var res = results[results.count - 1] as NSManagedObject
            YouWon.text = "Level: " + String(res.valueForKey("level") as Int)
            Score.text = res.valueForKey("score") as String
            
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //other functions
    @IBAction func NextLevel(sender: UIButton){
        self.performSegueWithIdentifier("NextLevel", sender: UIButton())
        
        if (level < 5) {
            
            level = level + 1
            
            var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
            var context:NSManagedObjectContext = appDel.managedObjectContext!
            
            let myEntity: NSString = "Settings"
            var request = NSFetchRequest(entityName: myEntity)
            request.returnsObjectsAsFaults = false
            
            var results:NSArray = context.executeFetchRequest(request, error: nil)
            
            if (results.count > 0){
                var res = results[results.count - 1] as NSManagedObject
                res.setValue(level, forKey: "level")
                res.setValue(level, forKey: "levelMax")
                
                context.save(nil)
                
            }
            
        } else {
            //#ULISSES POEM A BOSTA DO POP UP AQUI FALANDO QUE O CARA JA BROCOU E GANHOU O JOGO
        }
        
    }
    
}