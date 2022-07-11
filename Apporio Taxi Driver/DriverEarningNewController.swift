//
//  DriverEarningNewController.swift
//  Apporio Taxi Driver
//
//  Created by Nitu on 15/07/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit

class DriverEarningNewController: UIViewController,ParsingStates  {
    
    
    
    var tablesize = 0
    
    var toastLabel : UILabel!
    
    var mydata : DriverEarningNew!
   
    @IBOutlet weak var totalPayoutLabel: UILabel!
    @IBOutlet weak var totalOutstandingLabel: UILabel!
    
    //@IBOutlet weak var currentBalLabel: UILabel!
    let driverid =   NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func back_click(_ sender: Any) {
        dismissViewcontroller()
    }
    
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.scrollView.frame = self.scrollView.bounds
        self.scrollView.contentSize.height =  600
        self.scrollView.contentSize.width = 0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 150, y: self.view.frame.size.height-300, width: 300, height: 35))
//        toastLabel.backgroundColor = UIColor.white
//        toastLabel.textColor = UIColor.black
//        toastLabel.textAlignment = NSTextAlignment.center;
//        self.view.addSubview(toastLabel)
//        toastLabel.text = "No Earning!!"
        
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.DriverEarning1(self.driverid)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
}

    @IBAction func view_full_summary_click(_ sender: Any) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next: WeeklyStatementController = storyboard.instantiateViewController(withIdentifier: "WeeklyStatementController") as! WeeklyStatementController
        next.newdata = self.mydata
        self.present(next, animated: true, completion: nil)
    }
    
    func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
        if resultCode == 666{
        
        self.mydata = data as! DriverEarningNew
        
        if(self.mydata.result == 419){
            
            NsUserDefaultManager.SingeltonInstance.logOut()
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let next: SplashViewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
            self.present(next, animated: true, completion: nil)
            
            
            
        }else if(mydata.result == 0){
            
//            
//            toastLabel.isHidden = false
//            earningtable.isHidden = true
//            
            
        }else{
            
           totalPayoutLabel.text = GlobalVariables.currencysymbol + " " + String(self.mydata.weeklyAmount!)
            //currentBalLabel.text = self.mydata.companyCut!
            totalOutstandingLabel.text = GlobalVariables.currencysymbol + " " + self.mydata.totalPaymentEraned!
        }
        
        }
    }

}

