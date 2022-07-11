//
//  DocumentStatusViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 11/09/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import Firebase

class DocumentStatusViewController: UIViewController,ParsingStates,UITableViewDelegate,UITableViewDataSource {
    
    var documentlistdata: DocumentListModel!
    
    var data: RegisterDriver!
    
    var ref1 = Database.database().reference()
    
     @IBOutlet weak var documentstatustable: UITableView!
    
    
    var drivercityid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyCityId)!

    
    var driverid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!
    
    
    var driverphoneno = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyPhoneno)!
    
    var driverpassword = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyPassword)!

    
     var Size = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.viewdocumentlist(CityId: drivercityid, DriverId: driverid)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.viewdocumentlist(CityId: drivercityid, DriverId: driverid)

    }
    
    
    @IBAction func backbtn(_ sender: Any) {
    
         dismissViewcontroller()
    }
    
    
    @IBAction func submitbtn_click(_ sender: Any) {
        
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.loginDriver(emailPhone: self.driverphoneno, password: self.driverpassword)
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return Size

        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = documentstatustable.dequeueReusableCell(withIdentifier: "documentcell", for: indexPath)
        
        
        let uploadstatus :UILabel = (cell.contentView.viewWithTag(2) as? UILabel)!
        
        let titlename :UILabel = (cell.contentView.viewWithTag(1) as? UILabel)!
        
        let documentverificationid = documentlistdata.msg![indexPath.row].documnetVarificationStatus
        
        titlename.text = documentlistdata.msg![indexPath.row].documentName
        
        if documentverificationid == "0"{
            
            uploadstatus.text = "Upload"
            
        }
         if documentverificationid == "1"{
            
            uploadstatus.text = "Not yet Verified"
        }
        if documentverificationid == "2"{
            
            uploadstatus.text = "Verified"
            
        }
         if documentverificationid == "3"{
            
            uploadstatus.text = "Please upload Again"
        }
        
        
        
        // let imageview : UIImageView = (cell.contentView.viewWithTag(1) as? UIImageView)!
        
        // titlename.text = mydata.msg![indexPath.row].paymentOptionName
        
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        documentstatustable.deselectRow(at: indexPath as IndexPath, animated: true)
        
        let documentverificationid = documentlistdata.msg![indexPath.row].documnetVarificationStatus
        
        
      //  let documentid = documentlistdata.msg![indexPath.row].documentId
        
       GlobalVariables.selecteddocumentId = documentlistdata.msg![indexPath.row].documentId!
        
       /* if documentid == "00"{
            
           /* let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let next: AccountDetailViewController = storyboard.instantiateViewController(withIdentifier: "AccountDetailViewController") as! AccountDetailViewController
            
            next.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            next.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(next, animated: true, completion: nil)*/
            
            
            
        }else{*/
            
            
            if documentverificationid == "0"{
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: UploadPhotoViewController = storyboard.instantiateViewController(withIdentifier: "UploadPhotoViewController") as! UploadPhotoViewController
                next.viewcontrollerself = self
               // next.movefrom = "documentphoto"
                next.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
                next.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                self.present(next, animated: true, completion: nil)
                
                
            }
            if documentverificationid == "1"{
                
                
            }
            if documentverificationid == "2"{
                
                
            }
            if documentverificationid == "3"{
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: UploadPhotoViewController = storyboard.instantiateViewController(withIdentifier: "UploadPhotoViewController") as! UploadPhotoViewController
                next.viewcontrollerself = self
               // next.movefrom = "documentphoto"
                next.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
                next.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                self.present(next, animated: true, completion: nil)
                
                
            }
            
            
       // }
        
        
        
    }
    
    
    func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
        if resultCode == 8026{
            
            documentlistdata  = data as! DocumentListModel
            
            if documentlistdata.result == 1 {
                
                if let size = self.documentlistdata.msg?.count
                {
                    
                    Size = size
                    
                }
                
                self.documentstatustable.reloadData()
                
            }else{
                
                let alert = UIAlertController(title: "", message: "No document in your city", preferredStyle: .alert)
                let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { _ in
                    
                }
                alert.addAction(action)
                self.present(alert, animated: true){}
                

                
            }
            
            
            
        }
        
        if resultCode == 44{
        
        
        
            self.data = data as! RegisterDriver
            
            
            if(self.data.result == 1){
                
                
                if(self.data.details?.detailStatus == "1"){
                    
                    
                      NsUserDefaultManager.SingeltonInstance.registerDriver(insurance: (self.data.details?.insurance!)!, rc: (self.data.details?.rc!)!, licence: (self.data.details?.license!)!, did: (self.data.details?.deviceId!)!, carModelId: (self.data.details?.carModelId!)!, otherDoc: (self.data.details?.otherDocs!)!, driverId: (self.data.details?.driverId!)!, driverImg: (self.data.details?.driverImage!)!, driverEmail: (self.data.details?.driverEmail!)!, driverName: (self.data.details?.driverName!)!, flag: (self.data.details?.flag!)!, long: (self.data.details?.currentLong!)!, cityid: (self.data.details?.cityId!)!, carNo: (self.data.details?.carNumber!)!, password: (self.data.details?.driverPassword!)!, lat: (self.data.details?.currentLat!)!, phoneNo: (self.data.details?.driverPhone!)!, carType: (self.data.details?.carTypeId!)!, onOff: (self.data.details?.onlineOffline!)!, status: (self.data.details?.status!)!, loginLogout: (self.data.details?.loginLogout!)!,driverToken: (self.data.details?.driverToken!)!,detailStatus : (self.data.details?.detailStatus)!,carmodelname : (self.data.details?.carModelName!)! , cartypename : (self.data.details?.carTypeName!)!,cityname : (self.data.details?.cityname!)!,Driverstatusimage: (self.data.details?.driverstatusimage)!,Driverstatusmessage: (self.data.details?.driverstatusmessage)!, DriverCarImage: (self.data.details?.drivercarImage)!)
                    
                    
                }else  if(self.data.details?.detailStatus == "3"){
                    
                    
                      NsUserDefaultManager.SingeltonInstance.registerDriver(insurance: (self.data.details?.insurance!)!, rc: (self.data.details?.rc!)!, licence: (self.data.details?.license!)!, did: (self.data.details?.deviceId!)!, carModelId: (self.data.details?.carModelId!)!, otherDoc: (self.data.details?.otherDocs!)!, driverId: (self.data.details?.driverId!)!, driverImg: (self.data.details?.driverImage!)!, driverEmail: (self.data.details?.driverEmail!)!, driverName: (self.data.details?.driverName!)!, flag: (self.data.details?.flag!)!, long: (self.data.details?.currentLong!)!, cityid: (self.data.details?.cityId!)!, carNo: (self.data.details?.carNumber!)!, password: (self.data.details?.driverPassword!)!, lat: (self.data.details?.currentLat!)!, phoneNo: (self.data.details?.driverPhone!)!, carType: (self.data.details?.carTypeId!)!, onOff: (self.data.details?.onlineOffline!)!, status: (self.data.details?.status!)!, loginLogout: (self.data.details?.loginLogout!)!,driverToken: (self.data.details?.driverToken!)!,detailStatus : (self.data.details?.detailStatus)!,carmodelname : (self.data.details?.carModelName!)! , cartypename : (self.data.details?.carTypeName!)!,cityname : (self.data.details?.cityname!)!,Driverstatusimage: (self.data.details?.driverstatusimage)!,Driverstatusmessage: (self.data.details?.driverstatusmessage)!, DriverCarImage: (self.data.details?.drivercarImage)!)                    
                    
                    let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let next: SignupVerifyViewController = storyboard.instantiateViewController(withIdentifier: "SignupVerifyViewController") as! SignupVerifyViewController
                    self.present(next, animated: true, completion: nil)
                    
                }
                
                
                else {
                    
                    NsUserDefaultManager.SingeltonInstance.registerDriver(insurance: (self.data.details?.insurance!)!, rc: (self.data.details?.rc!)!, licence: (self.data.details?.license!)!, did: (self.data.details?.deviceId!)!, carModelId: (self.data.details?.carModelId!)!, otherDoc: (self.data.details?.otherDocs!)!, driverId: (self.data.details?.driverId!)!, driverImg: (self.data.details?.driverImage!)!, driverEmail: (self.data.details?.driverEmail!)!, driverName: (self.data.details?.driverName!)!, flag: (self.data.details?.flag!)!, long: (self.data.details?.currentLong!)!, cityid: (self.data.details?.cityId!)!, carNo: (self.data.details?.carNumber!)!, password: (self.data.details?.driverPassword!)!, lat: (self.data.details?.currentLat!)!, phoneNo: (self.data.details?.driverPhone!)!, carType: (self.data.details?.carTypeId!)!, onOff: (self.data.details?.onlineOffline!)!, status: (self.data.details?.status!)!, loginLogout: (self.data.details?.loginLogout!)!,driverToken: (self.data.details?.driverToken!)!,detailStatus : (self.data.details?.detailStatus)!,carmodelname : (self.data.details?.carModelName!)! , cartypename : (self.data.details?.carTypeName!)!,cityname : (self.data.details?.cityname!)!,Driverstatusimage: (self.data.details?.driverstatusimage)!,Driverstatusmessage: (self.data.details?.driverstatusmessage)!, DriverCarImage: (self.data.details?.drivercarImage)!)
                    
                        print("data saved")
                    
                    let alert = UIAlertController(title: NSLocalizedString("Login Successfully", comment: ""), message:"", preferredStyle: .alert)
                    let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { _ in
                        
                        
                        
                        let Message: NSDictionary = ["ride_id": "No Ride","ride_status": "No Ride Status"]
                        
                        self.ref1.child("Activeride").child((self.data.details?.driverId!)!).setValue(Message)
                        
                       
                        
                        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let nextController: OnLineViewController = storyboard.instantiateViewController(withIdentifier: "OnLineViewController") as! OnLineViewController
                        
                        if let window = self.view.window{
                            window.rootViewController = nextController
                        }
                        
                    }
                    alert.addAction(action)
                    self.present(alert, animated: true){}
                }

              

            
            }else{
            
                    let alert = UIAlertController(title: "", message: self.data.msg! , preferredStyle: .alert)
                    let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { _ in
                        
                    }
                    alert.addAction(action)
                    self.present(alert, animated: true){}
                }

                
                
                
                
            }

        
        }
        
        

    
}
