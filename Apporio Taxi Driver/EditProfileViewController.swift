//
//  EditProfileViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 07/06/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import Firebase


class EditProfileViewController: UIViewController, ParsingStates , UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
      var data1: LogOut!
    
    var driverid: String = ""
    var OnOffData: OnLineOffline!
    
    
    var ref = Database.database().reference()
    
   
    
    var defaultdrivertoken = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverToken)!
    
    
    
    var onoffstatus = "2"

    
    var mobileNo: String = ""
    var password: String = ""
    var name: String = ""
    let imageUrl = API_URLs.imagedomain
    var data: RegisterDriver!
    var defaultdriverid = ""
    var defaultdrivername = ""
    var defaultdriverphone = ""
    var defaultdriveremail = ""
    var defaultdriverPassword = ""
    
    
    var driverdeviceid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDeviceId)!
    
    var driverimage = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverImage)!
    
    
    var driverflag = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyFlag)!
    
    var drivercartypename = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyCarName)!
    
    var drivercarmodelname = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyCarModelName)!
    
    var drivercarno = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyCarNo)!
    
    var drivercityid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyCityId)!
    
    var drivermodelid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyCarModelid)!
    
    
    var loginlogoutstatus = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyLoginLogout)!
    
    
    var cartypeid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyCarType)!
   
    @IBOutlet weak var driverProfileImage: UIImageView!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var mobileTf: UITextField!
    @IBOutlet weak var nameTf: UITextField!
    @IBOutlet weak var emailTf: UITextField!
    
    
    


    override func viewDidLoad() {
        super.viewDidLoad()

        
        defaultdriverid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!
        defaultdrivername = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDrivername)!
        defaultdriverphone = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyPhoneno)!
        defaultdriveremail = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverEmail)!
        defaultdriverPassword =  NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyPassword)!
        
        emailTf.text = defaultdriveremail
        mobileTf.text = defaultdriverphone
        nameTf.text = defaultdrivername
        passwordTf.text = defaultdriverPassword
        
       
        let image = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverImage)!
        let newUrl = imageUrl + image
        let url = URL(string: newUrl)
        driverProfileImage.af_setImage(withURL:
            url! as URL,
                                       placeholderImage: UIImage(named: "dress"),
                                       filter: nil,
                                       imageTransition: .crossDissolve(1.0))
        
        
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(EditProfileViewController.imageTapped(_:)))
        driverProfileImage.isUserInteractionEnabled = true
        driverProfileImage.addGestureRecognizer(tapGestureRecognizer)
        
        driverProfileImage.layer.cornerRadius =  driverProfileImage.frame.width/2
        driverProfileImage.clipsToBounds = true
        driverProfileImage.layer.borderWidth = 1
        driverProfileImage.layer.borderColor = UIColor.black.cgColor

        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func change_password_btn(_ sender: Any) {
        
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next: ChangePasswordViewController = storyboard.instantiateViewController(withIdentifier: "ChangePasswordViewController") as! ChangePasswordViewController
        self.present(next, animated: true, completion: nil)

    }
    
    
    
    func imageTapped(_ img: AnyObject)
    {
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            driverProfileImage.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    

    
    @IBAction func backbtn(_ sender: Any) {
        dismissViewcontroller()
    }

    @IBAction func Donebtn(_ sender: Any) {
        
        
        name = nameTf.text!
        mobileNo = mobileTf.text!
        password = passwordTf.text!
        
        if ((mobileNo.characters.count < 10) || (mobileNo.characters.count > 10 )) {
            
            let alert = UIAlertController(title: NSLocalizedString("Edit Failed!", comment: ""), message:NSLocalizedString("Mobile No. must be of 10 characters ", comment: ""), preferredStyle: .alert)
            let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
            
            
        else
        {
            let parameters = [
                "driver_id": defaultdriverid,
                "driver_name": name,
                "driver_phone": mobileNo,
                "driver_token=": defaultdrivertoken,
                "language_code":GlobalVariables.languagecode
                
            ]
            
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.uploadRequest(parameters: parameters, driverImage: self.driverProfileImage.image!)
        }

    }
    
    @IBAction func LogOutbtn(_ sender: Any) {
        
        
        let refreshAlert = UIAlertController(title:  NSLocalizedString("Log Out", comment: ""), message: NSLocalizedString("Are You Sure to Log Out ?", comment: ""), preferredStyle: UIAlertControllerStyle.alert)
        
        refreshAlert.addAction(UIAlertAction(title: NSLocalizedString("Confirm", comment: "") , style: .default, handler: { (action: UIAlertAction!) in
            
            APIManager.sharedInstance.goOnline(driverid: self.defaultdriverid, onlineOffline: "2",driverToken: self.defaultdrivertoken)
            
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.logOut(driverid: self.defaultdriverid)
            
        }))
        
        
        refreshAlert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .default, handler: { (action: UIAlertAction!) in
            
            refreshAlert .dismiss(animated: true, completion: nil)
            
            
        }))
        
        present(refreshAlert, animated: true, completion: nil)
        
        
       
    }
    
    
    func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
         if resultCode == 55{
        
        self.data = data as! RegisterDriver
        
        print(" Result is: \(self.data.result!)")
        if ( self.data.result == 1){
            
            
            NsUserDefaultManager.SingeltonInstance.registerDriver(insurance: (self.data.details?.insurance!)!, rc: (self.data.details?.rc!)!, licence: (self.data.details?.license!)!, did: (self.data.details?.deviceId!)!, carModelId: (self.data.details?.carModelId!)!, otherDoc: (self.data.details?.otherDocs!)!, driverId: (self.data.details?.driverId!)!, driverImg: (self.data.details?.driverImage!)!, driverEmail: (self.data.details?.driverEmail!)!, driverName: (self.data.details?.driverName!)!, flag: (self.data.details?.flag!)!, long: (self.data.details?.currentLong!)!, cityid: (self.data.details?.cityId!)!, carNo: (self.data.details?.carNumber!)!, password: (self.data.details?.driverPassword!)!, lat: (self.data.details?.currentLat!)!, phoneNo: (self.data.details?.driverPhone!)!, carType: (self.data.details?.carTypeId!)!, onOff: (self.data.details?.onlineOffline!)!, status: (self.data.details?.status!)!, loginLogout: (self.data.details?.loginLogout!)!,driverToken: (self.data.details?.driverToken!)!,detailStatus : (self.data.details?.detailStatus)!,carmodelname : (self.data.details?.carModelName!)! , cartypename : (self.data.details?.carTypeName!)!,cityname : (self.data.details?.cityname!)!,Driverstatusimage: (self.data.details?.driverstatusimage)!,Driverstatusmessage: (self.data.details?.driverstatusmessage)!, DriverCarImage: (self.data.details?.drivercarImage)!)
            
            
                        
            let alert = UIAlertController(title: NSLocalizedString("Profile Updated", comment: ""), message:"", preferredStyle: .alert)
            let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let nextController: OnLineViewController = storyboard.instantiateViewController(withIdentifier: "OnLineViewController") as! OnLineViewController
                
                if let window = self.view.window{
                    window.rootViewController = nextController
                }
              /* let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: OnLineViewController = storyboard.instantiateViewController(withIdentifier: "OnLineViewController") as! OnLineViewController
                self.present(next, animated: true, completion: nil)*/
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
            
        else{
            
            let alert = UIAlertController(title: NSLocalizedString("Unable to edit!", comment: ""), message:NSLocalizedString(" Email Already Exsist or Field is Incorrect", comment: ""), preferredStyle: .alert)
            let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
        
    }
    
        if resultCode == 187{
            
            self.data1 = data as! LogOut
            
            
            if(self.data1.result == 419){
                
                NsUserDefaultManager.SingeltonInstance.logOut()
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: SplashViewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
                self.present(next, animated: true, completion: nil)
                
                
                
            }else if(self.data1.result == 1){
                
                
                 UserDefaults.standard.setValue("2", forKey:"onoffline_status")
                
                let Message: NSDictionary = ["driver_id": self.defaultdriverid , "driver_name": self.defaultdrivername , "driver_phone": self.defaultdriverphone , "driver_email": self.defaultdriveremail , "driver_image": self.driverimage , "driver_password": self.defaultdriverPassword , "driver_token": self.defaultdrivertoken , "driver_device_id": self.driverdeviceid , "driver_flag": self.driverflag,"driver_rating": "" ,"driver_car_type_id": self.cartypeid ,"driver_model_id": self.drivermodelid ,"driver_number": self.drivercarno , "driver_city_id": self.drivercityid ,"driver_registration_date": "" ,"driver_lisence": "" ,"driver_rc": "" ,"driver_insurence": "" ,"driver_other_doc": "" ,"driver_last_update": "" ,"driver_last_update_date": "" ,"driver_completed_rides": "" ,"driver_rejected_rides": "" ,"driver_cancelled_rides": "" ,"driver_login_logout": "2" ,"driver_busy_status": "" ,"driver_online_offline_status": self.onoffstatus ,"driver_detail_status": "" ,"driver_admin_status": "" ,"driver_car_type_name": self.drivercartypename ,"driver_car_model_name": self.drivercarmodelname ,"driver_current_latitude": Lat ,"driver_current_longitude": Lng ,"driver_location_text": GlobalVariables.driverLocation ,"timestamp": "","bearingfactor": "0.0"]
                
                self.ref.child("Drivers_A").child(self.defaultdriverid).setValue(Message)
                
                
                NsUserDefaultManager.SingeltonInstance.logOut()
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: SplashViewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
                self.present(next, animated: true, completion: nil)
                
            }
        }
        
        if resultCode == 88 {
            self.OnOffData = data as! OnLineOffline
        }
        

        
        
        
    }

    
   
}
