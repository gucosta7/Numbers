//
//  FBViewController.swift
//  Numbers
//
//  Created by Ulisses Alves Rodrigues on 05/08/2014.
//  Copyright (c) 2014 Gustavo Arthur da Costa. All rights reserved.
//

//
//  ViewController.swift
//  SwiftBook
//
//  Created by Brian Coleman on 2014-07-07.
//  Copyright (c) 2014 Brian Coleman. All rights reserved.
//

import UIKit

import UIKit

class FBViewController: UIViewController, FBLoginViewDelegate {
    

    
    @IBOutlet var fbLoginView: FBLoginView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.fbLoginView.delegate = self
        self.fbLoginView.readPermissions = ["public_profile", "email", "user_friends"]
        
    }
    
    // Facebook Delegate Methods
    
    func loginViewShowingLoggedInUser(loginView : FBLoginView!) {
        println("User Logged In")
    }
    
    func loginViewFetchedUserInfo(loginView : FBLoginView!, user: FBGraphUser) {
        println("User: \(user)")
        println("User ID: \(user.objectID)")
        println("User Name: \(user.name)")
        var userEmail = user.objectForKey("email") as String
        println("User Email: \(userEmail)")
    }
    
    func loginViewShowingLoggedOutUser(loginView : FBLoginView!) {
        println("User Logged Out")
    }
    
    func loginView(loginView : FBLoginView!, handleError:NSError) {
        println("Error: \(handleError.localizedDescription)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}