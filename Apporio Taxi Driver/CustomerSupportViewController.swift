//
//  CustomerSupportViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 12/06/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit

class CustomerSupportViewController: UIViewController,ParsingStates  {
    
    @IBOutlet weak var entername: UITextField!
    
    @IBOutlet weak var enteremail: UITextField!
    
    
    @IBOutlet weak var scrollview: UIScrollView!
    
    var data: CustomerSupportModel!
    @IBOutlet weak var nameview: UIView!
    
    @IBOutlet weak var emailview: UIView!
    
    @IBOutlet weak var enterphone: UITextField!
    
    @IBOutlet weak var queryview: UIView!
    
    @IBOutlet weak var enterquerytext: UITextView!
    @IBOutlet weak var phoneview: UIView!
    
    var driverid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameview.layer.borderWidth = 1.0
        self.nameview.layer.cornerRadius = 4
        self.emailview.layer.borderWidth = 1.0
        self.emailview.layer.cornerRadius = 4
        self.phoneview.layer.borderWidth = 1.0
        self.phoneview.layer.cornerRadius = 4
        self.queryview.layer.borderWidth = 1.0
        self.queryview.layer.cornerRadius = 4

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.scrollview.frame = self.scrollview.bounds
        self.scrollview.contentSize.height =  500
        self.scrollview.contentSize.width = 0
    }

    
    @IBAction func backbtn(_ sender: AnyObject) {
        
        dismissViewcontroller()
        
        //self.presentingViewController!.presentingViewController!.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    @IBAction func sendbtn(_ sender: AnyObject) {
        
        if entername.text!.characters.count < 2
        {
            self.showAlertMessage("", Message: NSLocalizedString("Please Check Your Name", comment: ""));
            
        }
        else if enteremail.text!.characters.count < 2{
            
            self.showAlertMessage("", Message: NSLocalizedString("Please Check Your Email", comment: ""));
            
        }
        else if (!enteremail.text!.contains("@"))
        {
            let alert = UIAlertController(title: NSLocalizedString("", comment: ""), message:NSLocalizedString(" Wrong Email format ", comment: ""), preferredStyle: .alert)
            let action = UIAlertAction(title:  NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
            
        else if (enteremail.text!.contains(" "))
        {
            let alert = UIAlertController(title: "", message:NSLocalizedString(" Email id must not contain space ", comment: ""), preferredStyle: .alert)
            let action = UIAlertAction(title:  NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        } else if enterquerytext.text!.characters.count < 1{
            
            self.showAlertMessage("", Message: NSLocalizedString("Please Check Your Query is blank", comment: ""));
            
        }
        
        else{
            
            
            
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.CustomerSupportApi(DriverId: self.driverid, Name: self.entername.text!, Email: self.enteremail.text!, Phone: self.enterphone.text!, Query: self.enterquerytext.text!)
        }
        
        
        
    }
    
    func showAlertMessage(_ title:String,Message:String){
        
        let alert = UIAlertController(title: title, message: Message, preferredStyle: .alert)
        let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { _ in
            
        }
        alert.addAction(action)
        self.present(alert, animated: true){}
    }
    
    
    func showalert(message:String)  {
        
        DispatchQueue.main.async(execute: {
            
            let alertController = UIAlertController(title:   NSLocalizedString("Alert", comment: ""), message:message, preferredStyle: .alert)
            
            
            let OKAction = UIAlertAction(title: NSLocalizedString("ok", comment: ""), style: .default) { (action) in
                
                self.dismissViewcontroller()
                
            }
            alertController.addAction(OKAction)
            
            self.present(alertController, animated: true) {
                
            }
            
            
        })
        
    }

    
    
    
    func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
        if (resultCode == 5555){
            self.data = data as! CustomerSupportModel
            if(self.data.result == 1){
                
               
                self.showalert(message: (self.data.msg!))
                
                
            }else{
                self.showAlertMessage("", Message: (self.data.msg!))
                
                
            }
            
        }
    }
    

    

   

}
