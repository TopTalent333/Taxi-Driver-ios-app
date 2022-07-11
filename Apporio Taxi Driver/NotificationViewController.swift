//
//  NotificationViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 04/09/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,ParsingStates {
    
    
    
    
    var notificationdata: NotificationModel!
    
    let imageUrl = API_URLs.imagedomain
    var size = 0
    
    @IBOutlet weak var newnotificationtable: UITableView!
    
    var toastLabel : UILabel!

    
    var driverid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 150, y: self.view.frame.size.height-300, width: 300, height: 35))
        toastLabel.backgroundColor = UIColor.white
        toastLabel.textColor = UIColor.black
        toastLabel.textAlignment = NSTextAlignment.center;
        self.view.addSubview(toastLabel)
        toastLabel.text =  NSLocalizedString("No Notification!!", comment: "")
        
        toastLabel.isHidden = true

        
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.ShowAllNotification(DriverId: self.driverid)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func backbtn(_ sender: Any) {
        self.dismissViewcontroller()
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return size
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "notificationcell", for: indexPath)
        
       let imageview1 : UIImageView = (cell.contentView.viewWithTag(1) as? UIImageView)!
        
             let label : UILabel = (cell.contentView.viewWithTag(2) as? UILabel)!
        
        let labelheading : UILabel = (cell.contentView.viewWithTag(3) as? UILabel)!

        labelheading.text = notificationdata.details![indexPath.row].pushMessageHeading
        
        label.text = notificationdata.details![indexPath.row].pushMessage
        
        
        let newString = notificationdata.details![indexPath.row].pushImage!
        
        
        if newString == ""{
            
            
            
        }else{
            
            
            let url = imageUrl + newString
            
            let url1 = NSURL(string: url)
            
            imageview1.af_setImage(withURL:
                url1! as URL,
                                        placeholderImage: UIImage(named: "dress"),
                                        filter: nil,
                                        imageTransition: .crossDissolve(1.0))
            
            
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        newnotificationtable.deselectRow(at: indexPath, animated: true)
        let row = indexPath.row
        print("Row: \(row)")
        
        if (notificationdata.details![indexPath.row].pushWebUrl == "")
        {
            
            
        }else{
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let myModalViewController = storyboard.instantiateViewController(withIdentifier: "WebViewController")as! WebViewController
            myModalViewController.weblinkurl = notificationdata.details![indexPath.row].pushWebUrl!
            self.present(myModalViewController, animated: true, completion: nil)
        }
        
        
    }
    

    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableViewAutomaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    

    
    func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
         if resultCode == 8025{
        
        notificationdata = data as! NotificationModel
        if(notificationdata.status == 1){
            
            toastLabel.isHidden = true
            newnotificationtable.isHidden = false
            
            
            
            if(notificationdata.status == 0){
                
                size = 0
                
            }else{
                size = (notificationdata.details?.count)!
                
            }
            
            newnotificationtable.reloadData()
            
        }else{
            
            toastLabel.isHidden = false
            newnotificationtable.isHidden = true
            
            
            
        }
        
            
        }

        
    }
    

   

}
