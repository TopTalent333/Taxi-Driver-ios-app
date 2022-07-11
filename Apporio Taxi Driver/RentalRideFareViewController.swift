//
//  RentalRideFareViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 05/07/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import StarryStars

class RentalRideFareViewController: UIViewController,ParsingStates,RatingViewDelegate {
    
    var rentalridefaredata: RentalRideFareModel!
    
    var rentalratecustomerdata: RentalRateCustomerModel!
    
    
    @IBOutlet weak var tripdetailsview: UIView!
    
    @IBOutlet weak var totalpayableamountview: UIView!
    
    @IBOutlet weak var bottomview: UIView!
    
    
    @IBOutlet weak var pickuplocationtext: UILabel!
    
    @IBOutlet weak var dropofflocationtext: UILabel!
    
    
    @IBOutlet weak var initialmeterreadingtext: UILabel!
    
    @IBOutlet weak var finalmeterreadingtext: UILabel!
    
    
    @IBOutlet weak var totalpaymenttextbold: UILabel!
    
    @IBOutlet weak var totaldistancetraveltext: UILabel!
    
    @IBOutlet weak var totaltimetext: UILabel!
    
    @IBOutlet weak var packageprice: UILabel!
    
    @IBOutlet weak var packagetext: UILabel!
    
    
    @IBOutlet weak var extradistanctraveltext: UILabel!
    
    @IBOutlet weak var extradistancetravelprice: UILabel!
    
    @IBOutlet weak var extraestimatedtimetext: UILabel!
    
    @IBOutlet weak var extraestimatedtimeprice: UILabel!
    
    @IBOutlet weak var totalprice: UILabel!
    
    
    @IBOutlet weak var couponappliedtext: UILabel!
    
    @IBOutlet weak var couponappliedprice: UILabel!
    
    @IBOutlet weak var ratingview: RatingView!
    
    @IBOutlet weak var totalpayableamount: UILabel!
    
    
    @IBOutlet weak var hiddenview: UIView!
    
    
    @IBOutlet weak var commenttext: UITextView!
    
    @IBOutlet weak var commentview: UIView!

    @IBOutlet weak var innerviewrating: UIView!
    
      @IBOutlet weak var donebtn: UIButton!
    
    var ratingValue: String = ""
    var rating: Float = 0.0
    
  
    
     var  defaultdriverid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!
    
    var userid = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.commentview.layer.borderWidth = 1.0
        self.commentview.layer.cornerRadius = 4
        
        self.hiddenview.isHidden = true
        
        self.donebtn.layer.borderWidth = 1.0
        self.donebtn.layer.cornerRadius = 4
        self.donebtn.layer.backgroundColor = UIColor.lightGray.cgColor

        
        
        tripdetailsview.layer.shadowColor = UIColor.gray.cgColor
        tripdetailsview.layer.shadowOpacity = 1
        tripdetailsview.layer.shadowOffset = CGSize(width: 0, height: 3)
        tripdetailsview.layer.shadowRadius = 5
        
        totalpayableamountview.layer.shadowColor = UIColor.gray.cgColor
        totalpayableamountview.layer.shadowOpacity = 1
        totalpayableamountview.layer.shadowOffset = CGSize(width: 0, height: 3)
        totalpayableamountview.layer.shadowRadius = 5
        
        
        ratingview.editable = true
        ratingview.delegate = self
        
       APIManager.sharedInstance.delegate = self
       APIManager.sharedInstance.RentalRideFare(RentalBookindId: GlobalVariables.rideid)


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return 0
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
        
        return cell
        
    }

    
    func ratingView(_ ratingView: RatingView, didChangeRating newRating: Float) {
        print("newRating: \(newRating)")
        rating = newRating
        ratingValue = String(rating)
        GlobalVariables.finalRating = ratingValue
    }

    
    
    @IBAction func submit_btn_click(_ sender: Any) {
        
      self.hiddenview.isHidden = false
        
    }
    
     @IBAction func donebtn(_ sender: Any) {
        
         UserDefaults.standard.setValue("10", forKey:"firebaseride_status")
        
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.RentalRatingApi(RentalBookindId: GlobalVariables.rideid, RatingValue: GlobalVariables.finalRating, DriverId: self.defaultdriverid, UserId: self.userid,Comment: commenttext.text!)
        
    }
   
    
    func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
        if (resultCode == 8016){
            
            rentalridefaredata = data as! RentalRideFareModel
            
            
            if(rentalridefaredata.status == 1){
                
               
               
                
                userid = (rentalridefaredata.details?.userId)!
                
                
                pickuplocationtext.text = rentalridefaredata.details?.beginLocation
                dropofflocationtext.text = rentalridefaredata.details?.endLocation
                initialmeterreadingtext.text = rentalridefaredata.details?.startMeterReading
                finalmeterreadingtext.text = rentalridefaredata.details?.endMeterReading
                
                
                               
               totalpaymenttextbold.text = GlobalVariables.currencysymbol + " " + (rentalridefaredata.details?.finalBillAmount)!
                
                
                
                totaldistancetraveltext.text = (rentalridefaredata.details?.totalDistanceTravel)! 
                totaltimetext.text = rentalridefaredata.details?.totalTimeTravel
                packagetext.text = "Package (" + (rentalridefaredata.details?.rentalPackageDistance)! + " for " + (rentalridefaredata.details?.rentalPackageHours)! + " hrs.)"
                
                packageprice.text = GlobalVariables.currencysymbol + " " + (rentalridefaredata.details?.rentalPackagePrice)!
                
                extradistanctraveltext.text = "Extra Distance Travel (" + (rentalridefaredata.details?.extraDistanceTravel)! + " )"
                
                extradistancetravelprice.text = GlobalVariables.currencysymbol + " " + (rentalridefaredata.details?.extraDistanceTravelCharge)!
                
               extraestimatedtimetext.text = "Extra Estimated time (" + (rentalridefaredata.details?.extraHoursTravel)! + "hrs.)"
                extraestimatedtimeprice.text = GlobalVariables.currencysymbol + " " + (rentalridefaredata.details?.extraHoursTravelCharge)!
                
               totalprice.text = GlobalVariables.currencysymbol + " " + (rentalridefaredata.details?.totalamount)!
                
                couponappliedtext.text = "Coupon Applied( " + (rentalridefaredata.details?.couponcode)! + " )"
                
                couponappliedprice.text = GlobalVariables.currencysymbol + " " + (rentalridefaredata.details?.couponprice!)!
                
                totalpayableamount.text = GlobalVariables.currencysymbol + " " + (rentalridefaredata.details?.finalBillAmount)!
                

                
                
            }else{
                
                print("HelloRating")
                
            }
            
            
        }
        
        
      if (resultCode == 8017){
            
            
            self.rentalratecustomerdata = data as! RentalRateCustomerModel
            
            if(self.rentalratecustomerdata.status == 419){
                
                NsUserDefaultManager.SingeltonInstance.logOut()
                
               // NsUserDefaultManager.SingeltonInstance.logOut()
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: SplashViewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
                self.present(next, animated: true, completion: nil)
                
                
                
            }else if (self.rentalratecustomerdata.status == 1){
               /* let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: OnLineViewController = storyboard.instantiateViewController(withIdentifier: "OnLineViewController") as! OnLineViewController
                self.present(next, animated: true, completion: nil)*/
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let nextController: OnLineViewController = storyboard.instantiateViewController(withIdentifier: "OnLineViewController") as! OnLineViewController
                
                if let window = self.view.window{
                    window.rootViewController = nextController
                }
            }
            
        }

        
        
    }
    
    


}
