//
//  UploadDocumentViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 06/06/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import Firebase

class UploadDocumentViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate,ParsingStates {
    
    var data: RegisterDriver!
    
     var ref1 = Database.database().reference()
    
    @IBOutlet weak var insurance_btn: CustomButton!
    //   @IBOutlet weak var other_btn: CustomButton!
    @IBOutlet weak var rc_btn: CustomButton!
    @IBOutlet weak var licence_btn: CustomButton!
    
    @IBOutlet weak var rcimage: UIImageView!
    
    @IBOutlet weak var insuranceimage: UIImageView!
    
    @IBOutlet weak var licenseimage: UIImageView!
    
    
    @IBOutlet weak var textview: UITextView!
    
    @IBOutlet weak var Insurancelabel: UILabel!
    
    @IBOutlet weak var Licencelabel: UILabel!
    
    @IBOutlet weak var RClabel: UILabel!
    
    @IBOutlet weak var insurancedatelabel: UILabel!
    
    @IBOutlet weak var rcdatelabel: UILabel!
    
    @IBOutlet weak var licensedatelabel: UILabel!
    
    
    var defaultdriverid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!

    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if GlobalVariables.movefromcalender == 1{
        insurancedatelabel.text = GlobalVariables.insurancdocumentdate
            GlobalVariables.movefromcalender = 0
        
        }else if GlobalVariables.movefromcalender == 2{
            licensedatelabel.text = GlobalVariables.licensedocumentdate
            GlobalVariables.movefromcalender = 0
        
        }else if GlobalVariables.movefromcalender == 3{
            rcdatelabel.text = GlobalVariables.rcdocumentdate
            GlobalVariables.movefromcalender = 0
        
        }else{
        
        
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back_btn(_ sender: Any) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next: SplashViewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
        self.present(next, animated: true, completion: nil)

    }
    
    
    
    @IBAction func insurance_btn_click(_ sender: Any) {
        
        GlobalVariables.i = 0
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)

    }
    
    @IBAction func license_btn_click(_ sender: Any) {
        GlobalVariables.i = 1
        
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)

    }
    
    @IBAction func rc_btn_click(_ sender: Any) {
        
        GlobalVariables.i = 2
        
        
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)

    }
    
    
    @IBAction func selectinsurancdate_btn(_ sender: Any) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next: CalenderViewController = storyboard.instantiateViewController(withIdentifier: "CalenderViewController") as! CalenderViewController
          next.checkmovefrom = "uploaddocument"
        GlobalVariables.movefromcalender = 1
        self.present(next, animated: true, completion: nil)
        
        
    }
  
    @IBAction func selectlicensedate_btn(_ sender: Any) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next: CalenderViewController = storyboard.instantiateViewController(withIdentifier: "CalenderViewController") as! CalenderViewController
        next.checkmovefrom = "uploaddocument"
          GlobalVariables.movefromcalender = 2
        self.present(next, animated: true, completion: nil)
    }
    
    
    
    @IBAction func selectrcdatebtn(_ sender: Any) {
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next: CalenderViewController = storyboard.instantiateViewController(withIdentifier: "CalenderViewController") as! CalenderViewController
          next.checkmovefrom = "uploaddocument"
          GlobalVariables.movefromcalender = 3
        self.present(next, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        if(GlobalVariables.i == 0){
            
            insuranceimage.image =  self.RBResizeImage(image, targetSize: CGSize(width: self.view.frame.size.width/3,height: 70))
            
            GlobalVariables.insurance = self.RBResizeImage(image, targetSize: CGSize(width: self.view.frame.size.width/3,height: 70))
            
            
            
        }
        else if(GlobalVariables.i == 1){
            
           
            licenseimage.image = self.RBResizeImage(image, targetSize: CGSize(width: self.view.frame.size.width/3,height:70))
            
            GlobalVariables.license = self.RBResizeImage(image, targetSize: CGSize(width: self.view.frame.size.width/3,height: 70))
            
            
        }
        else if(GlobalVariables.i == 2){
            
          
            rcimage.image = self.RBResizeImage(image, targetSize: CGSize(width: self.view.frame.size.width/3,height: 70))
            
            
            GlobalVariables.registration = self.RBResizeImage(image, targetSize: CGSize(width: self.view.frame.size.width/3,height: 70))
            
        }
        else{
            GlobalVariables.otherDocument = image
          
            
        }
        
        
        
        dismiss(animated: true, completion: nil)
        
    }
    
    

    
    @IBAction func Done_btn_click(_ sender: Any) {
        
        if GlobalVariables.insurance.isEqual("") {
            let alert = UIAlertController(title: NSLocalizedString("Upload Documents", comment: ""), message: NSLocalizedString("Please upload insurance copy ", comment: ""), preferredStyle: .alert)
            let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
            
        }
        else  if GlobalVariables.license.isEqual(""){
            let alert = UIAlertController(title:  NSLocalizedString("Upload Documents", comment: ""), message: NSLocalizedString("Please upload licence copy ", comment: ""), preferredStyle: .alert)
            let action = UIAlertAction(title:  NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
            
        }
            
        else  if GlobalVariables.registration.isEqual(""){
            let alert = UIAlertController(title:  NSLocalizedString("Upload Documents", comment: ""), message: NSLocalizedString("Please upload rc copy ", comment: ""), preferredStyle: .alert)
            let action = UIAlertAction(title:  NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
            
        }
        else if GlobalVariables.insurancdocumentdate == "Expiry Date" {
            let alert = UIAlertController(title:  NSLocalizedString("Upload Documents", comment: ""), message: NSLocalizedString("Please enter Insurance Expiration Date", comment: ""), preferredStyle: .alert)
            let action = UIAlertAction(title:  NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
            
        }
        else if GlobalVariables.licensedocumentdate == "Expiry Date" {
            let alert = UIAlertController(title:  NSLocalizedString("Upload Documents", comment: ""), message: NSLocalizedString("Please enter License Expiration Date", comment: ""), preferredStyle: .alert)
            let action = UIAlertAction(title:  NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
            
        }
        else if GlobalVariables.rcdocumentdate == "Expiry Date" {
            let alert = UIAlertController(title:  NSLocalizedString("Upload Documents", comment: ""), message: NSLocalizedString("Please enter Rc Expiration Date", comment: ""), preferredStyle: .alert)
            let action = UIAlertAction(title:  NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
            
        }
            
                 else {
            
            
            
            APIManager.sharedInstance.delegate = self
            APIManager.sharedInstance.uploaddriverdocument(driverId: defaultdriverid, InsuranceImage: GlobalVariables.insurance, LicenseImage: GlobalVariables.license, RCImage: GlobalVariables.registration,Insurancedate: GlobalVariables.insurancdocumentdate,LicenseDate: GlobalVariables.licensedocumentdate,RcDate: GlobalVariables.rcdocumentdate)
            
         
        }

    }
    

    func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
        
        self.data = data as! RegisterDriver
        
        
        
        if(self.data.result == 419){
            
            NsUserDefaultManager.SingeltonInstance.logOut()
            let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let next: SplashViewController = storyboard.instantiateViewController(withIdentifier: "SplashViewController") as! SplashViewController
            self.present(next, animated: true, completion: nil)
            
            
        }else if(self.data.result == 1){
            
            NsUserDefaultManager.SingeltonInstance.registerDriver(insurance: (self.data.details?.insurance!)!, rc: (self.data.details?.rc!)!, licence: (self.data.details?.license!)!, did: (self.data.details?.deviceId!)!, carModelId: (self.data.details?.carModelId!)!, otherDoc: (self.data.details?.otherDocs!)!, driverId: (self.data.details?.driverId!)!, driverImg: (self.data.details?.driverImage!)!, driverEmail: (self.data.details?.driverEmail!)!, driverName: (self.data.details?.driverName!)!, flag: (self.data.details?.flag!)!, long: (self.data.details?.currentLong!)!, cityid: (self.data.details?.cityId!)!, carNo: (self.data.details?.carNumber!)!, password: (self.data.details?.driverPassword!)!, lat: (self.data.details?.currentLat!)!, phoneNo: (self.data.details?.driverPhone!)!, carType: (self.data.details?.carTypeId!)!, onOff: (self.data.details?.onlineOffline!)!, status: (self.data.details?.status!)!, loginLogout: (self.data.details?.loginLogout!)!,driverToken: (self.data.details?.driverToken!)!,detailStatus : (self.data.details?.detailStatus)!,carmodelname : (self.data.details?.carModelName!)! , cartypename : (self.data.details?.carTypeName!)!,cityname : (self.data.details?.cityname!)!,Driverstatusimage: (self.data.details?.driverstatusimage)!,Driverstatusmessage: (self.data.details?.driverstatusmessage)!, DriverCarImage: (self.data.details?.drivercarImage)!)
            
            
            let alert = UIAlertController(title:  NSLocalizedString("Registration Successfully", comment: ""), message:"", preferredStyle: .alert)
            let action = UIAlertAction(title:  NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
                
                let Message: NSDictionary = ["ride_id": "No Ride","ride_status": "No Ride Status"]
                
                self.ref1.child("Activeride").child((self.data.details?.driverId!)!).setValue(Message)
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let nextController: OnLineViewController = storyboard.instantiateViewController(withIdentifier: "OnLineViewController") as! OnLineViewController
                
                if let window = self.view.window{
                    window.rootViewController = nextController
                }
                
              /*  let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let revealViewController:OnLineViewController = storyBoard.instantiateViewController(withIdentifier: "OnLineViewController") as! OnLineViewController
                
                self.present(revealViewController, animated:true, completion:nil)*/
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
        else{
            
            let alert = UIAlertController(title:  NSLocalizedString("Unable to register!", comment: ""), message: self.data.msg!, preferredStyle: .alert)
            let action = UIAlertAction(title:  NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
        
    }
    
    
    
}


extension UploadDocumentViewController
{
    
    
    func RBResizeImage(_ image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let heightInPoints = newImage?.size.height
        let heightInPixels = heightInPoints! * (newImage?.scale)!
        print(heightInPixels)
        
        let widthInPoints = newImage?.size.width
        let widthInPixels = widthInPoints! * (newImage?.scale)!
        print(widthInPixels)
        
        
        return newImage!
    }
}
