//
//  SignupVerifyViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 11/09/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit

class SignupVerifyViewController: UIViewController {
    
    
    @IBOutlet weak var showimage: UIImageView!
    
    @IBOutlet weak var textview: UITextView!
    
      let imageUrl = API_URLs.imagedomain
    
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var driverstatusimage = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.keydriverstatusimage)!
        
        
        var driverstatusmessage = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.keydriverstatusmessage)!
        
        
        if driverstatusimage == ""{
         showimage.image = UIImage(named: "applogodriver") as UIImage?
        }else{
        let newUrl = imageUrl + driverstatusimage
        let url = URL(string: newUrl)
        showimage.af_setImage(withURL:
            url! as URL,
                                       placeholderImage: UIImage(named: "dress"),
                                       filter: nil,
                                       imageTransition: .crossDissolve(1.0))
        }
        
        textview.text = driverstatusmessage


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backbtnclick(_ sender: Any) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next: SplashViewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
        self.present(next, animated: true, completion: nil)
    }

 

}
