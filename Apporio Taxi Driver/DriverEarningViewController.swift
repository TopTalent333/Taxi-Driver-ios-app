//
//  DriverEarningViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 12/06/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit

class DriverEarningViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,ParsingStates  {
    
    
    
    var tablesize = 0
    
    var toastLabel : UILabel!
    
    var mydata : DriverEarningModel!
    
    @IBOutlet weak var earningtable: UITableView!
    
    let driverid =   NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 150, y: self.view.frame.size.height-300, width: 300, height: 35))
        toastLabel.backgroundColor = UIColor.white
        toastLabel.textColor = UIColor.black
        toastLabel.textAlignment = NSTextAlignment.center;
        self.view.addSubview(toastLabel)
        toastLabel.text = "No Earning!!"
        
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.DriverEarning(self.driverid)


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backbtn(_ sender: Any) {
        
       dismissViewcontroller()
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tablesize
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = earningtable.dequeueReusableCell(withIdentifier: "DriverEarning", for: indexPath as IndexPath)
        
        
        let totalrides : UILabel = (cell.contentView.viewWithTag(1) as? UILabel)!
        let totalearning : UILabel = (cell.contentView.viewWithTag(2) as? UILabel)!
        let datelabel : UILabel = (cell.contentView.viewWithTag(3) as? UILabel)!
        
        totalrides.text = String(mydata.msg![indexPath.row].rides!)
        totalearning.text =  GlobalVariables.currencysymbol + " " + String(mydata.msg![indexPath.row].amount!)
        datelabel.text = mydata.msg![indexPath.row].rideDate
        
        
        
        return cell
        
        
        
    }
    
    
    func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
        
        
        mydata = data as! DriverEarningModel
        
        if(self.mydata.result == 419){
            
            NsUserDefaultManager.SingeltonInstance.logOut()
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let next: SplashViewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
            self.present(next, animated: true, completion: nil)
            
            
            
        }else if(mydata.result == 0){
            
            
            toastLabel.isHidden = false
            earningtable.isHidden = true
            
            
        }else{
            
            toastLabel.isHidden = true
            earningtable.isHidden = false
            
            tablesize = (mydata.msg?.count)!
            
            earningtable.reloadData()
            
        }
        
        
         }

    

   
}
