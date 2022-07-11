//
//  RideFareViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 07/06/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import StarryStars
import Alamofire
class RideFareViewController: UIViewController,ParsingStates,RatingViewDelegate {
    
    var mydatapage :DoneRideModel!
    var data: RateCustomer!
    
    var checkoutProvider: OPPCheckoutProvider?
    var transaction: OPPTransaction?
    var provider: OPPPaymentProvider?
    var checkoutID : String!
    
    
    @IBOutlet weak var PaymentInfo: UILabel!
    
    @IBOutlet weak var ratingview: RatingView!
    
    @IBOutlet weak var hiddenview: UIView!
    
    @IBOutlet weak var innerviewrating: UIView!
    
    @IBOutlet weak var submitbtnview: UIView!
    
    @IBOutlet weak var pickuplocationtext: UILabel!
    
    @IBOutlet weak var droplocationtext: UILabel!
    
    @IBOutlet weak var totalpayableview: UIView!
    
    @IBOutlet weak var tripdetailsview: UIView!
    
    @IBOutlet weak var commenttext: UITextView!
    
    @IBOutlet weak var commentview: UIView!
    
    @IBOutlet weak var nighttimechargestext: UILabel!
    
    @IBOutlet weak var paektimechargestext: UILabel!
    
    @IBOutlet weak var scrollview: UIScrollView!
    
    @IBOutlet weak var totalpayableamouttext: UILabel!
    
    @IBOutlet weak var totaldistancelabel: UILabel!
    
    @IBOutlet weak var farelabeltext: UILabel!
    
    @IBOutlet weak var ridetimechargelabel: UILabel!
    
    @IBOutlet weak var waitinglabel: UILabel!
    
    @IBOutlet weak var maincouponlabel: UILabel!
    
    @IBOutlet weak var netfaretextlabel: UILabel!
    
    @IBOutlet weak var coupontextlabel: UILabel!
    
    var ratingValue: String = ""
      var rating: Float = 0.0
    
    @IBOutlet weak var donebtn: UIButton!
    
    var  defaultdriverid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!

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
        
        totalpayableview.layer.shadowColor = UIColor.gray.cgColor
        totalpayableview.layer.shadowOpacity = 1
        totalpayableview.layer.shadowOffset = CGSize(width: 0, height: 3)
        totalpayableview.layer.shadowRadius = 5
        
        
        ratingview.editable = true
        ratingview.delegate = self
        
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.ViewDoneRide(RIDEID: GlobalVariables.donerideid)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // self.mainview.frame.size.height = 700
        self.scrollview.frame = self.scrollview.bounds
        self.scrollview.contentSize.height = 650
        self.scrollview.contentSize.width = 0
        
    }
    
    func ratingView(_ ratingView: RatingView, didChangeRating newRating: Float) {
        print("newRating: \(newRating)")
        rating = newRating
        ratingValue = String(rating)
        GlobalVariables.finalRating = ratingValue
    }

    @IBAction func donebtn(_ sender: Any) {
        UserDefaults.standard.setValue("1", forKey:"firebaseride_status")
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.rateCustomer(driverid: self.defaultdriverid, customerid: GlobalVariables.custId, rating: GlobalVariables.finalRating, comment: commenttext.text!,RideId: GlobalVariables.rideid)
    }
    
    @IBAction func submit_btn_click(_ sender: Any) {
        
       self.hiddenview.isHidden = false

    }
    
    func onSuccessState(_ data: AnyObject , resultCode: Int) {
       if (resultCode == 1777){
        
            mydatapage = data as! DoneRideModel
       
            if(mydatapage.result == 1){
        
                droplocationtext.text = mydatapage.msg?.endLocation
            
                pickuplocationtext.text = mydatapage.msg?.beginLocation
            
                totalpayableamouttext.text = GlobalVariables.currencysymbol + " " + (mydatapage.msg!.totalAmount)!
            
                totaldistancelabel.text = (mydatapage.msg!.distance)!
            
                farelabeltext.text =  GlobalVariables.currencysymbol + " " + (mydatapage.msg?.amount)!
            
                ridetimechargelabel.text = GlobalVariables.currencysymbol + " " + (mydatapage.msg?.rideTimePrice)!
            
                waitinglabel.text = GlobalVariables.currencysymbol + " " + (mydatapage.msg?.waitingPrice)!
            
                maincouponlabel.text = "Coupon (" + (mydatapage.msg?.couponsCode)! + " )"
            
                coupontextlabel.text =  GlobalVariables.currencysymbol + " " + (mydatapage.msg?.couponsPrice)!
            
                netfaretextlabel.text = GlobalVariables.currencysymbol + " " + (mydatapage.msg?.totalAmount)!
                
                paektimechargestext.text = GlobalVariables.currencysymbol + " " + (mydatapage.msg?.peaktimecharges)!
                
                nighttimechargestext.text =  GlobalVariables.currencysymbol + " " + (mydatapage.msg?.nighttimecharges)!
                
                GlobalVariables.custId = (mydatapage.msg?.userid)!
                GlobalVariables.totalamount = (mydatapage.msg?.amount)!
                PaymentInfo.text = mydatapage.msg?.paymentOptionName
                let payoption = mydatapage.msg?.paymentOptionName
                print(payoption)
                if payoption != "Cash" {
                    let spinnerActivity = MBProgressHUD.showAdded(to: self.view, animated: true)
                    spinnerActivity.label.text = NSLocalizedString("Payment processing", comment: "")
                    spinnerActivity.detailsLabel.text = NSLocalizedString("Please Wait!!", comment: "")
                    spinnerActivity.isUserInteractionEnabled = false
                    self.provider = OPPPaymentProvider(mode:.live)
                    let url1 = "http://www.tyradmin.co.za/api/pay_with_token.php?amount=\((mydatapage.msg?.totalAmount)!)&currency=ZAR&paymentType=DB&rideid=\(GlobalVariables.donerideid)&shopperResultUrl=\(Config.schemeURL)://payment&notificationUrl=\(Request.notifyDomain)"
                    Request.requestTokenCheckoutID(url: url1, completion: {(result) in
                        DispatchQueue.main.async {
                            let res = result["result"]
                            let checkoutID = result["checkoutID"]
                            let brand = result["brand"]
                            let token = result["token"]
                            if res == "0" {
                                MBProgressHUD.hide(for: self.view, animated: true)
                                self.showalert(message: "Checkout ID is empty")
                                return
                            }
                            guard let transaction = self.createTransaction(checkoutID: checkoutID!,token:token!,brand:brand!) else {
                                MBProgressHUD.hide(for: self.view, animated: true)
                                self.showalert(message: "Checkout ID is empty")
                                return
                            }
                            self.provider!.submitTransaction(transaction, completionHandler: { (transaction, error) in
                                DispatchQueue.main.async {
                                    self.handleTransactionSubmission(transaction: transaction, error: error)
                                }
                            })
                            
                        }
                    })
                }
            }else{
                print("HelloRating")
            }
        }
        
         if (resultCode == 154){
            
            self.data = data as! RateCustomer
            
            if(self.data.result == 419){
                
                NsUserDefaultManager.SingeltonInstance.logOut()
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: SplashViewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
                self.present(next, animated: true, completion: nil)
                
                
                
            }else if (self.data.result == 1){
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
    func showalert(message:String)  {
        
        DispatchQueue.main.async(execute: {
            
            let alertController = UIAlertController(title:   NSLocalizedString("Alert", comment: ""), message:message, preferredStyle: .alert)
            
            
            let OKAction = UIAlertAction(title: NSLocalizedString("ok", comment: ""), style: .default) { (action) in
                
            }
            alertController.addAction(OKAction)
            
            self.present(alertController, animated: true) {
                
            }
            
            
        })
        
    }
    
    
    
    
    func createTransaction(checkoutID: String,token:String,brand:String) -> OPPTransaction? {
        do {
            let params = try OPPTokenPaymentParams(checkoutID: checkoutID,tokenID:token, paymentBrand: brand)
            return OPPTransaction.init(paymentParams: params)
        } catch let error as NSError {
            MBProgressHUD.hide(for: self.view, animated: true)
            self.showalert(message: error.localizedDescription)
            return nil
        }
    }
    
    func handleTransactionSubmission(transaction: OPPTransaction?, error: Error?) {
        guard let transaction = transaction else {
            MBProgressHUD.hide(for: self.view, animated: true)
            self.showalert(message: (error?.localizedDescription)!)
            return
        }
        
        self.transaction = transaction
        if transaction.type == .synchronous {
            // If a transaction is synchronous, just request the payment status
            self.requestPaymentStatus()
        } else if transaction.type == .asynchronous {
            // If a transaction is asynchronous, you should open transaction.redirectUrl in a browser
            // Subscribe to notifications to request the payment status when a shopper comes back to the app
            NotificationCenter.default.addObserver(self, selector: #selector(self.didReceiveAsynchronousPaymentCallback), name: Notification.Name(rawValue: Config.asyncPaymentCompletedNotificationKey), object: nil)
        } else {
            MBProgressHUD.hide(for: self.view, animated: true)
            self.showalert(message: "Invalid transaction")
        }
    }
    
    func requestPaymentStatus() {
        // You can either hard-code resourcePath or request checkout info to get the value from the server
        // * Hard-coding: "/v1/checkouts/" + checkoutID + "/payment"
        // * Requesting checkout info:
        
        guard let checkoutID = self.transaction?.paymentParams.checkoutID else {
            MBProgressHUD.hide(for: self.view, animated: true)
            self.showalert(message: "Checkout ID is invalid")
            return
        }
        self.transaction = nil
        self.provider!.requestCheckoutInfo(withCheckoutID: checkoutID) { (checkoutInfo, error) in
            DispatchQueue.main.async {
                guard let resourcePath = checkoutInfo?.resourcePath else {
                    MBProgressHUD.hide(for: self.view, animated: true)
                    self.showalert(message: "Checkout info is empty or doesn't contain resource path")
                    return
                }
                Request.requestPaymentStatus1(resourcePath: resourcePath) { (success) in
                    DispatchQueue.main.async {
                        let res = success as! [String:Any]
                        let result = res["result"] as! String
                        MBProgressHUD.hide(for: self.view, animated: true)
                        if result == "1" {
                            let spinnerActivity = MBProgressHUD.showAdded(to: self.view, animated: true)
                            spinnerActivity.label.text = NSLocalizedString("Saving data", comment: "")
                            spinnerActivity.detailsLabel.text = NSLocalizedString("Please Wait!!", comment: "")
                            spinnerActivity.isUserInteractionEnabled = false
                            
                            let amount = res["payment_amount"] as! String
                            let payment_date_time = res["payment_date_time"] as! String
                            let payment_status = res["payment_status"] as! String
                            let payid = String(describing:res["payment_id"] as! Int)
                            
                            let dic = ["order_id":GlobalVariables.donerideid,
                                       "user_id":GlobalVariables.custId,
                                       "payment_id":payid,
                                       "payment_date_time":payment_date_time,
                                       "payment_method":"Card",
                                       "payment_platform":"Ios",
                                       "payment_amount":amount,
                                       "payment_status":payment_status,
                                ] as [String : Any]
                            Alamofire.request("http://www.tyradmin.co.za/api/payment_saved.php", method: .get, parameters: dic)
                                .responseJSON { response in
                                    switch response.result
                                    {
                                        case.success:
                                            MBProgressHUD.hide(for: self.view, animated: true)
                                            self.showalert(message: "Payment successfully")
                                        case.failure:
                                            MBProgressHUD.hide(for: self.view, animated: true)
                                            self.showalert(message: "Payment successfully, but was not saved")
                                        
                                }
                            }
                            
                        } else {
                            MBProgressHUD.hide(for: self.view, animated: true)
                            self.showalert(message: "Card Payment failed")
                        }
                        
                    }
                }
            }
        }
    }
    // MARK: - Async payment callback
    
    func didReceiveAsynchronousPaymentCallback() {
        NotificationCenter.default.removeObserver(self, name: Notification.Name(rawValue: Config.asyncPaymentCompletedNotificationKey), object: nil)
        DispatchQueue.main.async {
            self.requestPaymentStatus()
        }
    }
  
}
