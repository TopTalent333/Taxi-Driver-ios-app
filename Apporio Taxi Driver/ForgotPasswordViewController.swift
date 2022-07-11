//
//  ForgotPasswordViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 12/06/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController,ParsingStates  {
    
    var driverEmail: String = ""
    var data: ForgotPassword!
    
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var submitbtn: CustomButton!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backbtn(_ sender: Any) {
        dismissViewcontroller()
    }
    
    
    @IBAction func submitbtn(_ sender: Any) {
        
        driverEmail = emailField.text!
        if (driverEmail.contains(" "))
        {
            let alert = UIAlertController(title: "", message:NSLocalizedString(" Email id must not contain space ", comment: ""), preferredStyle: .alert)
            let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
            
        else{
            
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.forgotPassword(driveremail: driverEmail)
            
        }

    }
    
    
    func showalert(message:String)  {
        
        DispatchQueue.main.async(execute: {
            
            let alertController = UIAlertController(title:   NSLocalizedString("Alert", comment: ""), message:message, preferredStyle: .alert)
            
            
            let OKAction = UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .default) { (action) in
                
            }
            alertController.addAction(OKAction)
            
            self.present(alertController, animated: true) {
                
            }
            
            
        })
        
    }
    
    func showalert1(message:String)  {
        
        DispatchQueue.main.async(execute: {
            
            let alertController = UIAlertController(title:   NSLocalizedString("Alert", comment: ""), message:message, preferredStyle: .alert)
            
            
            let OKAction = UIAlertAction(title: NSLocalizedString("Ok", comment: ""), style: .default) { (action) in
                
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let revealViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                
                self.present(revealViewController, animated:true, completion:nil)
                
            }
            alertController.addAction(OKAction)
            
            self.present(alertController, animated: true) {
                
            }
            
            
        })
        
    }
    
    
    func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
        self.data = data as! ForgotPassword
        if(self.data.result == 1){
            
            showalert1(message: "Your password has been sent to registered mail.")

        }
        else{
            
            self.showalert(message: self.data.msg!)

        }
        
    }


    

}
