//
//  StartViewController.swift
//  Tag Your Ride - Driver
//
//  Created by Piyush Kumar on 10/16/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit

class StartViewController: UIViewController,ParsingStates {

     var timer:Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       if(NsUserDefaultManager.SingeltonInstance.isloggedin()){
            
        var timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(StartViewController.myPerformeCode1), userInfo: nil, repeats: false)
        
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.sendDeviceId()
        
       }
        else {
        
            var timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(StartViewController.myPerformeCode), userInfo: nil, repeats: false)
        
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func myPerformeCode(timer : Timer) {
        
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let revealViewController = storyBoard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
        
        self.present(revealViewController, animated:true, completion:nil)

    }

    func myPerformeCode1(timer : Timer) {
        
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let revealViewController = storyBoard.instantiateViewController(withIdentifier: "OnLineViewController") as! OnLineViewController
        
        self.present(revealViewController, animated:true, completion:nil)
        
    }
    
    func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
        
    }

    
}
