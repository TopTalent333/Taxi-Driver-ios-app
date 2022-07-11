//
//  NsUserDefaultManager.swift
//  TaxiAppDriver
//
//  Created by Rakesh kumar on 23/08/16.
//  Copyright © 2016 Apporio. All rights reserved.
//

import Foundation

public class NsUserDefaultManager {
    
    
    internal static let KeyInsurance = "insurance"
    internal static let KeyRegisteration = "rc"
    internal static let KeyLicence = "license"
    internal static let KeyDeviceId = "deviceId"
    internal static let KeyCarModelid = "carModelId"
    internal static let KeyOtherDoc = "otherDocs"
    internal static let KeyDriverid = "driverId"
    internal static let KeyDriverImage = "driverImage"
    internal static let KeyDriverEmail = "driverEmail"
    internal static let KeyDrivername = "driverName"
    internal static let KeyFlag = "flag"
    internal static let KeyCurrentLong = "currentLong"
    internal static let KeyCityId = "cityId"
    internal static let KeyCarNo = "carNumber"
    internal static let KeyPassword = "driverPassword"
    internal static let KeyCurrentLat = "currentLat"
    internal static let KeyPhoneno = "driverPhone"
    internal static let KeyCarType = "carTypeId"
    internal static let KeyOnOff = "onlineOffline"
    internal static let KeyStatus = "status"
    internal static let KeyLoginState = "LoginState"
    internal static let KeyDriverToken = "driverToken"
    internal static let KeyDetailStatus = "detailStatus"
    internal static let KeyLoginLogout = "loginLogout"
    internal static let KeyCarName = "cartypename"
    internal static let KeyCarModelName = "carmodelname"
    internal static let KeyCityName = "cityname"
    internal static let KeyDriverCarImage = "CarImage"
    internal static let keydriverstatusimage = "driver_status_image"
    internal static let keydriverstatusmessage = "driver_status_message"
    
   // internal static let keyonlineofflinestatus = "onofflinestatus"
    
    internal static let SingeltonInstance  = NsUserDefaultManager()
    
    
    func registerDriver(insurance : String  , rc : String  ,  licence : String , did : String , carModelId : String , otherDoc : String , driverId : String , driverImg : String , driverEmail : String  , driverName: String ,  flag : String  ,  long : String , cityid : String , carNo : String , password : String , lat : String , phoneNo : String , carType : String , onOff : String , status : String , loginLogout : String,driverToken : String,detailStatus : String,carmodelname : String , cartypename : String ,cityname : String, Driverstatusimage: String,Driverstatusmessage: String, DriverCarImage : String){
        
        UserDefaults.standard.setValue(insurance, forKey: "insurance")
        UserDefaults.standard.setValue(rc, forKey: "rc")
        UserDefaults.standard.setValue(licence, forKey: "license")
        UserDefaults.standard.setValue(did, forKey: "deviceId")
        
        UserDefaults.standard.setValue(carModelId, forKey: "carModelId")
        UserDefaults.standard.setValue(otherDoc, forKey: "otherDocs")
        UserDefaults.standard.setValue(driverId, forKey: "driverId")
        UserDefaults.standard.setValue(driverImg, forKey: "driverImage")
        UserDefaults.standard.setValue(driverEmail, forKey: "driverEmail")
        UserDefaults.standard.setValue(driverName, forKey: "driverName")
        UserDefaults.standard.setValue(flag, forKey: "flag")
        UserDefaults.standard.setValue(long, forKey: "currentLong")
        UserDefaults.standard.setValue(cityid, forKey: "cityId")
        UserDefaults.standard.setValue(carNo, forKey: "carNumber")
        UserDefaults.standard.setValue(password, forKey: "driverPassword")
        UserDefaults.standard.setValue(lat, forKey: "currentLat")
        UserDefaults.standard.setValue(phoneNo, forKey: "driverPhone")
        UserDefaults.standard.setValue(carType, forKey: "carTypeId")
        UserDefaults.standard.setValue(onOff, forKey: "onlineOffline")
        UserDefaults.standard.setValue(status, forKey: "status")
        UserDefaults.standard.setValue(loginLogout, forKey: "loginLogout")
        UserDefaults.standard.setValue(driverToken, forKey: "driverToken")
        UserDefaults.standard.setValue(detailStatus, forKey: "detailStatus")
        UserDefaults.standard.setValue(cartypename, forKey: "carmodelname")
        UserDefaults.standard.setValue(carmodelname, forKey: "cartypename")
        UserDefaults.standard.setValue(cityname, forKey: "cityname")
         UserDefaults.standard.setValue(DriverCarImage, forKey: "CarImage")
        UserDefaults.standard.setValue(Driverstatusimage, forKey: "driver_status_image")
         UserDefaults.standard.setValue(Driverstatusmessage, forKey: "driver_status_message")
        UserDefaults.standard.set(true, forKey:"LoginState")
        
        //
        print("data saved")
        
    }
    
    
  

    
    func RideAccept(DriverId: String,RideId: String,PickUpLoc: String,CustId: String,PickUpLat: String,PickUpLong: String,TrackUserName: String,TrackUserMobile: String,TrackDropLocation: String,TrackRideStatus: String,DropLat: String,DropLong: String,DropLocation: String){
    
    
         UserDefaults.standard.setValue(DriverId, forKey: "acceptdriverid")
          UserDefaults.standard.setValue(RideId, forKey: "acceptrideid")
          UserDefaults.standard.setValue(PickUpLoc, forKey: "acceptpickuploc")
          UserDefaults.standard.setValue(CustId, forKey: "acceptcustid")
          UserDefaults.standard.setValue(PickUpLat, forKey: "acceptpickuplat")
          UserDefaults.standard.setValue(PickUpLong, forKey: "acceptpickuplong")
          UserDefaults.standard.setValue(TrackUserName, forKey: "accepttrackusername")
          UserDefaults.standard.setValue(TrackUserMobile, forKey: "accepttrackusermobile")
          UserDefaults.standard.setValue(TrackDropLocation, forKey: "accepttrackdroplocation")
          UserDefaults.standard.setValue(TrackRideStatus, forKey: "accepttrackridestatus")
          UserDefaults.standard.setValue(DropLat, forKey: "acceptdroplat")
          UserDefaults.standard.setValue(DropLong, forKey: "acceptdroplong")
          UserDefaults.standard.setValue(DropLocation, forKey: "acceptdroplocation")
        
    }
    
    
  
    
    func RentalRideAccept(DriverId: String,RideId: String,PickUpLoc: String,CustId: String,PickUpLat: String,PickUpLong: String,TrackUserName: String,TrackUserMobile: String,TrackRideStatus: String){
        
        
        UserDefaults.standard.setValue(DriverId, forKey: "rentaldriverid")
        UserDefaults.standard.setValue(RideId, forKey: "rentalrideid")
        UserDefaults.standard.setValue(PickUpLoc, forKey: "rentalpickuploc")
        UserDefaults.standard.setValue(CustId, forKey: "rentalcustid")
        UserDefaults.standard.setValue(PickUpLat, forKey: "rentalpickuplat")
        UserDefaults.standard.setValue(PickUpLong, forKey: "rentalpickuplong")
        UserDefaults.standard.setValue(TrackUserName, forKey: "rentaltrackusername")
        UserDefaults.standard.setValue(TrackUserMobile, forKey: "rentaltrackusermobile")
        UserDefaults.standard.setValue(TrackRideStatus, forKey: "rentaltrackridestatus")
       
        
    }
    
    
    func isloggedin() -> Bool{
        
        let  loginstate  = UserDefaults.standard.bool(forKey: "LoginState")
        
        if loginstate  {
            return true
        }else{
            return false
        }
    }
    
    func logOut(){
        
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "insurance")
        defaults.removeObject(forKey: "rc")
        defaults.removeObject(forKey: "license")
        defaults.removeObject(forKey: "deviceId")
        defaults.removeObject(forKey: "loginLogout")
        defaults.removeObject(forKey: "carModelId")
        defaults.removeObject(forKey: "otherDocs")
        defaults.removeObject(forKey: "driverId")
        defaults.removeObject(forKey: "driverImage")
        defaults.removeObject(forKey: "driverEmail")
        defaults.removeObject(forKey: "driverName")
        defaults.removeObject(forKey: "flag")
        defaults.removeObject(forKey: "currentLong")
        defaults.removeObject(forKey: "cityId")
        defaults.removeObject(forKey: "carNumber")
        defaults.removeObject(forKey: "driverPassword")
        defaults.removeObject(forKey: "currentLat")
        defaults.removeObject(forKey: "driverPhone")
        defaults.removeObject(forKey: "carTypeId")
        defaults.removeObject(forKey: "onlineOffline")
        defaults.removeObject(forKey: "status")
        defaults.removeObject(forKey: "driverToken")
        defaults.removeObject(forKey: "cartypename")
        defaults.removeObject(forKey: "carmodelname")
        defaults.removeObject(forKey: "cityname")
        defaults.removeObject(forKey: "driver_status_image")
        defaults.removeObject(forKey: "driver_status_message")
        
               
        defaults.set(false, forKey:"LoginState")
    }
    
    func getuserdetails (key : String)-> String?
    {
        
        return UserDefaults.standard.string(forKey: key)!
    }
    
//    func saveImage(image: String){
//        NSUserDefaults.standardUserDefaults().setValue(image, forKey: "proImage")
//    }
    
    
}
