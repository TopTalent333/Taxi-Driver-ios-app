//
//  FullDetailsViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 12/06/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import StarryStars

class FullDetailsViewController: UIViewController,ParsingStates {
    
    
   // var mydatapage: ViewRide!
    
    var rentalridedata: ViewRideModel!
    
    var normalridedata: NormalViewRideInfoModel!

    
    var ridestausvalue = ""
    var datetimedata = ""
    var rideid = ""
     var ridemode = ""
    
    var currentstatusvalue = ""
    
    let imageUrl = API_URLs.imagedomain
    

    
    @IBOutlet weak var toplabeltext: UILabel!
    
    
    @IBOutlet weak var bottomview: UIView!
    
    @IBOutlet weak var scrollview: UIScrollView!
    
    
    @IBOutlet weak var completeuserimage: UIImageView!
   
    @IBOutlet weak var completeusernmae: UILabel!
    
    @IBOutlet weak var completeuserphone: UILabel!
    
    @IBOutlet weak var completestatusview: UIView!
    
    @IBOutlet weak var completeratingview: RatingView!
    
    @IBOutlet weak var completecoupontext: UILabel!
    
    @IBOutlet weak var completecouponprice: UILabel!
    @IBOutlet weak var completepricelabel: UILabel!
    
    @IBOutlet weak var completedistancelabel: UILabel!
    
    @IBOutlet weak var completetimelabel: UILabel!
    
    @IBOutlet weak var completedroplocationtimelabel: UILabel!
    
    @IBOutlet weak var completepickuplocationtimelabel: UILabel!
    
    @IBOutlet weak var completedroplocation: UILabel!
    
    @IBOutlet weak var completepickuplocation: UILabel!
    
    
    @IBOutlet weak var completedistancetravel: UILabel!
    
    @IBOutlet weak var completedistancefare: UILabel!
    
    
    @IBOutlet weak var completeridetimecharge: UILabel!
    
    @IBOutlet weak var completewaitingcharge: UILabel!
    
    @IBOutlet weak var completenighttimechargestext: UILabel!
    
    @IBOutlet weak var completepeaktimechargestext: UILabel!
    
    
    @IBOutlet weak var totalbilllabel: UILabel!
    
    @IBOutlet weak var paymentmethodtext: UILabel!
    
    @IBOutlet weak var paymentamounttext: UILabel!
    
    
    @IBOutlet weak var anotherstatusview: UIView!
    
    @IBOutlet weak var anotherusername: UILabel!
    
    @IBOutlet weak var anotheruserimage: UIImageView!
    
    @IBOutlet weak var anotheruserphone: UILabel!
    
    @IBOutlet weak var anotherratingview: RatingView!
    
    @IBOutlet weak var anotherdroplocationtimelabel: UILabel!
    
    @IBOutlet weak var anotherpickuplocationtimelabel: UILabel!
    
    @IBOutlet weak var anotherdroplocation: UILabel!
    
    @IBOutlet weak var anotherpickuplocation: UILabel!
    
    
    @IBOutlet weak var normalcompleteview: UIView!
    
    @IBOutlet weak var rentalcompleteview: UIView!
    
    
    @IBOutlet weak var rentaldistancetravel: UILabel!
    
    @IBOutlet weak var rentaltotaltime: UILabel!
    
    @IBOutlet weak var rentalpackagetext: UILabel!
    
    @IBOutlet weak var rentalpackageprice: UILabel!
    
    @IBOutlet weak var rentalextratimetraveltext: UILabel!
    
    @IBOutlet weak var rentalextratimetravelprice: UILabel!
    
    @IBOutlet weak var rentalextraestimatetimetext: UILabel!
    
    @IBOutlet weak var rentalestimatetimeprice: UILabel!
    
    
    @IBOutlet weak var rentaltotalpricetext: UILabel!
    
    @IBOutlet weak var rentalcouponcodetext: UILabel!
    
    @IBOutlet weak var rentaltotalpayableamout: UILabel!
    
    @IBOutlet weak var rentalcouponcodeprice: UILabel!
    
    
    @IBOutlet weak var rentaltotalpayableamounttext: UILabel!

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        completeratingview.isUserInteractionEnabled = false
        anotherratingview.isUserInteractionEnabled = false
        
        if ridemode == "2"{
            
            
            
            if ridestausvalue == "16" {
                completestatusview.isHidden = false
                anotherstatusview.isHidden = true
                normalcompleteview.isHidden = true
                rentalcompleteview.isHidden = false
                bottomview.isHidden = true
                
                
            }
            
            if ridestausvalue == "10" {
                
                completestatusview.isHidden = true
                anotherstatusview.isHidden = false
                bottomview.isHidden = false
                
                
            }
            
            if ridestausvalue == "15" {
                
                completestatusview.isHidden = true
                anotherstatusview.isHidden = false
                bottomview.isHidden = true
                
                
            }
            
            if ridestausvalue == "13" {
                
                completestatusview.isHidden = true
                anotherstatusview.isHidden = false
                bottomview.isHidden = false
                
                
                
            }
            
            if ridestausvalue == "14" {
                
                completestatusview.isHidden = true
                anotherstatusview.isHidden = false
                bottomview.isHidden = true
                
                
                
            }
            
            if ridestausvalue == "12" {
                
                completestatusview.isHidden = true
                anotherstatusview.isHidden = false
                bottomview.isHidden = false
                
                
            }
            
            if ridestausvalue == "11" {
                
                completestatusview.isHidden = true
                anotherstatusview.isHidden = false
                bottomview.isHidden = false
                
                
            }
            
            if ridestausvalue == "19" {
                
                completestatusview.isHidden = true
                anotherstatusview.isHidden = false
                bottomview.isHidden = true
                
                
            }
            
            
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.RentalviewRideInfo(BookingId: rideid, RideMode: ridemode)
            
            
            
        }else{

            if ridestausvalue == "7" {
                completestatusview.isHidden = false
                anotherstatusview.isHidden = true
                normalcompleteview.isHidden = false
                rentalcompleteview.isHidden = true
                bottomview.isHidden = true
                
                
            }
            
            if ridestausvalue == "1" {
                
                completestatusview.isHidden = true
                anotherstatusview.isHidden = false
                bottomview.isHidden = false
                
                
            }
            
            if ridestausvalue == "2" {
                
                completestatusview.isHidden = true
                anotherstatusview.isHidden = false
                bottomview.isHidden = true
                
                
            }
            
            if ridestausvalue == "6" {
                
                completestatusview.isHidden = true
                anotherstatusview.isHidden = false
                bottomview.isHidden = false
                
                
                
            }
            
            if ridestausvalue == "4" {
                
                completestatusview.isHidden = true
                anotherstatusview.isHidden = false
                bottomview.isHidden = true
                
                
                
            }
            
            if ridestausvalue == "5" {
                
                completestatusview.isHidden = true
                anotherstatusview.isHidden = false
                bottomview.isHidden = false
                
                
            }
            
            if ridestausvalue == "3" {
                
                completestatusview.isHidden = true
                anotherstatusview.isHidden = false
                bottomview.isHidden = false
                
                
            }
            
            if ridestausvalue == "8" {
                
                completestatusview.isHidden = true
                anotherstatusview.isHidden = false
                bottomview.isHidden = true
                
            }
            
            if ridestausvalue == "9" {
                
                completestatusview.isHidden = true
                anotherstatusview.isHidden = false
                bottomview.isHidden = true
                
            }
            
            if ridestausvalue == "17" {
                
                completestatusview.isHidden = true
                anotherstatusview.isHidden = false
                bottomview.isHidden = true
                
                
            }
            
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.NormalviewRideInfo(BookingId: rideid, RideMode: ridemode)
            
            
        }
        


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.scrollview.frame = self.scrollview.bounds
        self.scrollview.contentSize.height =  700
        self.scrollview.contentSize.width = 0
    }

    
    @IBAction func backbtn(_ sender: Any) {
       dismissViewcontroller()
    }

    @IBAction func gotoyourcurrentride_btn(_ sender: Any) {
        
        
        if ridemode == "2"{
            
            
            
            GlobalVariables.checkbackstatusfromfullride = 1
            
            GlobalVariables.driverid = (self.rentalridedata.details?.driverId)!
            GlobalVariables.rideid = (self.rentalridedata.details?.rentalBookingId)!
            GlobalVariables.pickupLoc = (self.rentalridedata.details?.pickupLocation)!
            GlobalVariables.custId = (self.rentalridedata.details?.userId)!
            GlobalVariables.pickupLat = (self.rentalridedata.details?.pickupLat)!
            GlobalVariables.pickupLong = (self.rentalridedata.details?.pickupLong)!
            
            GlobalVariables.trackusername = (self.rentalridedata.details?.userName)!
            GlobalVariables.trackusermobile = (self.rentalridedata.details?.userPhone)!
            
            GlobalVariables.trackridestatus = (self.rentalridedata.details?.bookingStatus)!
            
            
             NsUserDefaultManager.SingeltonInstance.RentalRideAccept(DriverId: (self.rentalridedata.details?.driverId)!, RideId: (self.rentalridedata.details?.rentalBookingId)!, PickUpLoc: (self.rentalridedata.details?.pickupLocation)!, CustId: (self.rentalridedata.details?.userId)!, PickUpLat: (self.rentalridedata.details?.pickupLat)!, PickUpLong: (self.rentalridedata.details?.pickupLong)!, TrackUserName: (self.rentalridedata.details?.userName)!, TrackUserMobile: (self.rentalridedata.details?.userPhone)!, TrackRideStatus: (self.rentalridedata.details?.bookingStatus)!)
            
            
            
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let next: RentalTrackRideViewController = storyboard.instantiateViewController(withIdentifier: "RentalTrackRideViewController") as! RentalTrackRideViewController
            
            self.present(next, animated: true, completion: nil)
            
            
            
            
        }else{
            
            
            GlobalVariables.checkbackstatusfromfullride = 1
            
            GlobalVariables.driverid = (self.normalridedata.details?.driverId)!
            GlobalVariables.rideid = (self.normalridedata.details?.rideId)!
            GlobalVariables.pickupLoc = (self.normalridedata.details?.pickupLocation)!
            GlobalVariables.custId = (self.normalridedata.details?.userId)!
            GlobalVariables.pickupLat = (self.normalridedata.details?.pickupLat)!
            GlobalVariables.pickupLong = (self.normalridedata.details?.pickupLong)!
            
            GlobalVariables.trackusername = (self.normalridedata.details?.userName)!
            GlobalVariables.trackusermobile = (self.normalridedata.details?.userPhone)!
            GlobalVariables.trackdroplocation = (self.normalridedata.details?.dropLocation)!
            GlobalVariables.trackridestatus = (self.normalridedata.details?.rideStatus)!
            
            GlobalVariables.dropLat = (self.normalridedata.details?.dropLat)!
            GlobalVariables.dropLong = (self.normalridedata.details?.dropLong)!
            GlobalVariables.dropLocation = (self.normalridedata.details?.dropLocation)!
            
            
             NsUserDefaultManager.SingeltonInstance.RideAccept(DriverId: (self.normalridedata.details?.driverId)!, RideId: (self.normalridedata.details?.rideId)!, PickUpLoc: (self.normalridedata.details?.pickupLocation)!, CustId: (self.normalridedata.details?.userId)!, PickUpLat: (self.normalridedata.details?.pickupLat)!, PickUpLong: (self.normalridedata.details?.pickupLong)!, TrackUserName: (self.normalridedata.details?.userName)!, TrackUserMobile: (self.normalridedata.details?.userPhone)!, TrackDropLocation: (self.normalridedata.details?.dropLocation)!, TrackRideStatus: (self.normalridedata.details?.rideStatus)!, DropLat: (self.normalridedata.details?.dropLat)!, DropLong: (self.normalridedata.details?.dropLong)!, DropLocation: (self.normalridedata.details?.dropLocation)!)
            
            
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let next: TrackRideViewController = storyboard.instantiateViewController(withIdentifier: "TrackRideViewController") as! TrackRideViewController
            
            self.present(next, animated: true, completion: nil)
        }
        

        
      

        
    }
    
    func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
        if (resultCode == 8015){
            
            
            rentalridedata = data as! ViewRideModel
            
            if(rentalridedata.status == 1){
                
                currentstatusvalue = (rentalridedata.details?.bookingStatus)!
                
                if currentstatusvalue == "16"{
                    
                    completepickuplocation.text = rentalridedata.details!.pickupLocation
                    
                    
                    completedroplocation.text  = rentalridedata.details!.endLocation
                    
                    
                    print(currentstatusvalue)
                    
                    
                    completeusernmae.text = rentalridedata.details!.userName
                    completeuserphone.text = rentalridedata.details!.userPhone
                    completepricelabel.text = GlobalVariables.currencysymbol + " " + (rentalridedata.details?.finalBillAmount)!
                    completedistancelabel.text = (rentalridedata.details?.totalDistanceTravel)!
                    completetimelabel.text = rentalridedata.details?.totalTimeTravel
                    
                    completedroplocationtimelabel.text = rentalridedata.details?.endTime
                    completepickuplocationtimelabel.text = rentalridedata.details?.beginTime
                    
                    rentaldistancetravel.text = (rentalridedata.details?.totalDistanceTravel)!
                    rentaltotaltime.text = rentalridedata.details?.totalTimeTravel
                    rentalpackagetext.text = "Package (" + (rentalridedata.details?.rentalPackageDistance)! + " for " + (rentalridedata.details?.rentalPackageHours)! + " hrs.)"
                    
                    rentalpackageprice.text = GlobalVariables.currencysymbol + " " + (rentalridedata.details?.rentalPackagePrice)!
                    
                    rentalextratimetraveltext.text = "Extra Distance Travel (" + (rentalridedata.details?.extraDistanceTravel)! + " )"
                    
                    rentalextratimetravelprice.text = GlobalVariables.currencysymbol + " " + (rentalridedata.details?.extraDistanceTravelCharge)!
                    
                    rentalextraestimatetimetext.text = "Extra Estimated time (" + (rentalridedata.details?.extraHoursTravel)! + "hrs.)"
                    rentalestimatetimeprice.text = GlobalVariables.currencysymbol + " " + (rentalridedata.details?.extraHoursTravelCharge)!
                    
                    rentaltotalpricetext.text = GlobalVariables.currencysymbol + " " + (rentalridedata.details?.finalBillAmount)!
                    
                    rentalcouponcodetext.text = "Coupon Applied( " + (rentalridedata.details?.couponcode)! + " )"
                    
                    rentalcouponcodeprice.text = GlobalVariables.currencysymbol + " " + (rentalridedata.details?.couponprice!)!
                    
                    rentaltotalpayableamout.text = GlobalVariables.currencysymbol + " " + (rentalridedata.details?.finalBillAmount)!
                    
                    rentaltotalpayableamounttext.text = "Total Payable Amount ( " + (rentalridedata.details?.paymentname)! + " )"
                    
                    
                    
                    
                  
                    
                }else{
                    
                    anotherusername.text = rentalridedata.details?.userName
                    anotherpickuplocation.text = rentalridedata.details?.pickupLocation
                    anotheruserphone.text = rentalridedata.details?.userPhone
                    anotherdroplocation.text = rentalridedata.details?.endLocation
                    
                    anotherdroplocationtimelabel.text = rentalridedata.details?.endTime
                    anotherpickuplocationtimelabel.text = rentalridedata.details?.beginTime
                    
                }
                
                let driverratingvalue = rentalridedata.details!.driverratingstar
                
                if driverratingvalue == ""{
                    print("hjjk")
                }else{
                    
                    completeratingview.rating = Float(driverratingvalue!)!
                    anotherratingview.rating = Float(driverratingvalue!)!
                }
                
                
                
                let drivertypeimage = rentalridedata.details!.userImage
                
                print(drivertypeimage!)
                
                if(drivertypeimage == ""){
                    completeuserimage.image = UIImage(named: "profileeee") as UIImage?
                    anotheruserimage.image = UIImage(named: "profileeee") as UIImage?
                    print("No Image")
                }else{
                    
                    
                    // let url = "http://apporio.co.uk/apporiotaxi/\(drivertypeimage!)"
                    // print(url)
                    
                    let url = imageUrl + drivertypeimage!
                    
                    let url1 = URL(string: url)
                    completeuserimage!.af_setImage(withURL:
                        url1! as URL,
                                                   placeholderImage: UIImage(named: "dress"),
                                                   filter: nil,
                                                   imageTransition: .crossDissolve(1.0))
                    anotheruserimage!.af_setImage(withURL:
                        url1! as URL,
                                                  placeholderImage: UIImage(named: "dress"),
                                                  filter: nil,
                                                  imageTransition: .crossDissolve(1.0))            }
                
                
                
            }else{
                
                print("hello")
            }
            
        }
        
        if (resultCode == 8014){
            
            normalridedata = data as! NormalViewRideInfoModel
            
            
            if(normalridedata.status == 1){
                
                currentstatusvalue = (normalridedata.details?.rideStatus)!
                
                if currentstatusvalue == "7"{
                    
                    completepickuplocation.text = normalridedata.details!.pickupLocation
                    
                    
                    
                    completedroplocation.text  = normalridedata.details!.dropLocation
                    
                    
                    print(currentstatusvalue)
                    
                    
                    completeusernmae.text = normalridedata.details!.userName
                    completeuserphone.text = normalridedata.details!.userPhone
                    completepricelabel.text = GlobalVariables.currencysymbol + " " + (normalridedata.details?.totalAmount)!
                    completedistancelabel.text = (normalridedata.details?.distance)!
                    completetimelabel.text = normalridedata.details?.time
                    
                    completedroplocationtimelabel.text = normalridedata.details?.endTime
                    completepickuplocationtimelabel.text = normalridedata.details?.beginTime
                    
                    completecoupontext.text = "Coupon Applied( " + (normalridedata.details?.couponCode)! + " )"
                    
                    completecouponprice.text = GlobalVariables.currencysymbol + " " + (normalridedata.details?.coupanPrice)!
                        
                        
                    completepeaktimechargestext.text = GlobalVariables.currencysymbol + " " + (normalridedata.details?.peaktimecharges)!
                    
                    
                    completenighttimechargestext.text = GlobalVariables.currencysymbol + " " + (normalridedata.details?.nighttimecharges)!

                    
                    completedistancetravel.text = (normalridedata.details?.distance)!
                    completedistancefare.text = GlobalVariables.currencysymbol + " " + (normalridedata.details?.totalAmount)!
                    
                    completeridetimecharge.text = GlobalVariables.currencysymbol + " " + (normalridedata.details?.rideTimePrice)!
                    
                    completewaitingcharge.text = GlobalVariables.currencysymbol + " " + (normalridedata.details?.waitingPrice)!
                    
                    paymentmethodtext.text = normalridedata.details?.paymentname
                    
                    paymentamounttext.text =  GlobalVariables.currencysymbol + " " + (normalridedata.details?.totalAmount)!
                    
                    totalbilllabel.text = GlobalVariables.currencysymbol + " " + (normalridedata.details?.totalAmount)!
                    
                }else{
                    
                    anotherusername.text = normalridedata.details?.userName
                    anotherpickuplocation.text = normalridedata.details?.pickupLocation
                    anotheruserphone.text = normalridedata.details?.userPhone
                    anotherdroplocation.text = normalridedata.details?.dropLocation
                    
                    anotherdroplocationtimelabel.text = normalridedata.details?.endTime
                    anotherpickuplocationtimelabel.text = normalridedata.details?.beginTime
                    
                }
                
                let driverratingvalue = normalridedata.details!.driverratingstar
                
                if driverratingvalue == ""{
                    print("hjjk")
                }else{
                    
                    completeratingview.rating = Float(driverratingvalue!)!
                    anotherratingview.rating = Float(driverratingvalue!)!
                }
                
                
                
                let drivertypeimage = normalridedata.details!.userImage
                
                print(drivertypeimage!)
                
                if(drivertypeimage == ""){
                    completeuserimage.image = UIImage(named: "profileeee") as UIImage?
                    anotheruserimage.image = UIImage(named: "profileeee") as UIImage?
                    print("No Image")
                }else{
                    
                    
                    // let url = "http://apporio.co.uk/apporiotaxi/\(drivertypeimage!)"
                    // print(url)
                    
                    let url = imageUrl + drivertypeimage!
                    
                    let url1 = URL(string: url)
                    completeuserimage!.af_setImage(withURL:
                        url1! as URL,
                                                   placeholderImage: UIImage(named: "dress"),
                                                   filter: nil,
                                                   imageTransition: .crossDissolve(1.0))
                    anotheruserimage!.af_setImage(withURL:
                        url1! as URL,
                                                  placeholderImage: UIImage(named: "dress"),
                                                  filter: nil,
                                                  imageTransition: .crossDissolve(1.0))            }
                
                
                
            }else{
                
                print("hello")
            }
            
            
            
            
        }
        
    }
    
}
