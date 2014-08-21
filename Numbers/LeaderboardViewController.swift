//
//  LeaderboardViewController.swift
//  Numbers
//
//  Created by Gustavo Arthur da Costa on 15/07/14.
//  Copyright (c) 2014 Gustavo Arthur da Costa. All rights reserved.
//

import UIKit
import CoreData

class LeaderboardViewController: UIViewController , UIApplicationDelegate{
    
    @IBOutlet var lblLevel1: UILabel!
    @IBOutlet var lblLevel2: UILabel!
    @IBOutlet var lblLevel3: UILabel!
    @IBOutlet var lblLevel4: UILabel!
    @IBOutlet var lblLevel5: UILabel!
    @IBOutlet var lblLevel6: UILabel!
    @IBOutlet var lblLevel7: UILabel!
    @IBOutlet var lblLevel8: UILabel!
    @IBOutlet var lblLevel9: UILabel!
    @IBOutlet var lblLevel10: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        var level1:String = ""
        var level2:String = ""
        var level3:String = ""
        var level4:String = ""
        var level5:String = ""
        var level6:String = ""
        var level7:String = ""
        var level8:String = ""
        var level9:String = ""
        var level10:String = ""
        
        var auxiliar:String = ""
        var scores: [Int] = []
        
        // Do any additional setup after loading the view.
        
        for (var i : Int = 1; i<=10; i++){
            
            println(i)
            
            var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
            var context:NSManagedObjectContext = appDel.managedObjectContext!
            
            let myEntity: NSString = "Results"
            var request = NSFetchRequest(entityName: myEntity)
            request.returnsObjectsAsFaults = false
            request.predicate = NSPredicate(format: "level = %@", String(i))
            
            var results:NSArray = context.executeFetchRequest(request, error: nil)
            
            if (results.count > 0){
                
                for (var c:Int = 0; c<results.count; c++){
                    var res = results[c] as NSManagedObject
                    auxiliar = res.valueForKey("score") as String
                    var sec = auxiliar.substringFromIndex(advance(auxiliar.startIndex, 6))
                    
                    scores.append(sec.toInt()!)
                }
                
                switch i {
                    
                    case 1 : level1 = String(scores.reduce(Int.min, { max($0, $1) }))
                    case 2 : level2 = String(scores.reduce(Int.min, { max($0, $1) }))
                    case 3 : level3 = String(scores.reduce(Int.min, { max($0, $1) }))
                    case 4 : level4 = String(scores.reduce(Int.min, { max($0, $1) }))
                    case 5 : level5 = String(scores.reduce(Int.min, { max($0, $1) }))
                    case 6 : level6 = String(scores.reduce(Int.min, { max($0, $1) }))
                    case 7 : level7 = String(scores.reduce(Int.min, { max($0, $1) }))
                    case 8 : level8 = String(scores.reduce(Int.min, { max($0, $1) }))
                    case 9 : level9 = String(scores.reduce(Int.min, { max($0, $1) }))
                    case 10 : level10 = String(scores.reduce(Int.min, { max($0, $1) }))
                    
                    default: println("error")
                    
                }
                
                
                
                println(scores)
                scores.removeAll(keepCapacity: false)

                
            }
            
        }
        
        lblLevel1.text = "Level 1 : " + formatLevel(level1)
        lblLevel2.text = "Level 2 : " + formatLevel(level2)
        lblLevel3.text = "Level 3 : " + formatLevel(level3)
        lblLevel4.text = "Level 4 : " + formatLevel(level4)
        lblLevel5.text = "Level 5 : " + formatLevel(level5)
        lblLevel6.text = "Level 6 : " + formatLevel(level6)
        lblLevel7.text = "Level 7 : " + formatLevel(level7)
        lblLevel8.text = "Level 8 : " + formatLevel(level8)
        lblLevel9.text = "Level 9 : " + formatLevel(level9)
        lblLevel10.text = "Level 10 : " + formatLevel(level10)
        
        
        let screenSize: CGRect = UIScreen.mainScreen().bounds
        
        let screenWidth = screenSize.width;
        let screenHeight = screenSize.height;
        
        if (screenHeight < 500) {
            

            
            
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func formatLevel (timeLevel: String) -> String {
        var result:String!
        if (timeLevel.isEmpty) {
                result = "Not Played"
        } else {
            if (timeLevel.utf16Count == 1) {
                result = "00:00:0" + timeLevel
            } else {
                result = "00:00:" + timeLevel
            }
        }
        
      return result
    }

    
    
}
