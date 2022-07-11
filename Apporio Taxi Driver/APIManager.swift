//
//  APIManager.swift
//  TaxiAppDriver
//
//  Created by Rakesh kumar on 23/08/16.
//  Copyright © 2016 Apporio. All rights reserved.
//

//
//  APIManager.swift
//  TaxiAppDriver
//
//  Created by Rakesh kumar on 23/08/16.
//  Copyright © 2016 Apporio. All rights reserved.
//

import SwiftyJSON
import Alamofire


protocol ParsingStates {
    
    
    func onProgressState(_ value: Int)
    
    func onErrorsState(_ message: String)
    
    func onSuccessState(_ data: AnyObject , resultCode: Int)
    
}

class APIManager
    
{
    
    let qualityOfServiceClass = DispatchQoS.QoSClass.background
    
    
    static let sharedInstance = APIManager()
    var delegate : ParsingStates! = nil
    
    
    
//     ************************ View Car Models API Parsing *********************************
    
    
    func viewCarModels(carTypeid: String)
        
    {
             
        
        let url = (API_URLs.ViewcarModels + "\(carTypeid)&language_id=\(GlobalVariables.languageid)&language_code=\(GlobalVariables.languagecode)")
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(url, method: .post, parameters: nil)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                  self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = CarModel(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 11)
                      
                        
                        
                    }
                case.failure(let error):
                    
                     self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                    
                }
        }

        
        
    }
    
    // ************************ View CarType API Parsing *********************************
    
    func viewCarType(cityId: String)
        
    {
        
        let url = (API_URLs.Viewcars  + "\(cityId)&language_id=\(GlobalVariables.languageid)&language_code=\(GlobalVariables.languagecode)")
        
        self.delegate.onProgressState(0)
        
        print (url)
        
        Alamofire.request(url, method: .post, parameters: nil)
            
       
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = CarType(json: dataToParse)
                          self.delegate.onSuccessState(ParsedData , resultCode: 22)
                       
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                }
        }

        
    }
    
    
    
    
    func viewcityType()
        
    {
        
        let url = (API_URLs.ViewCity  + "&language_id=\(GlobalVariables.languageid)&language_code=\(GlobalVariables.languagecode)")
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(url, method: .post, parameters: nil)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = CityTypeModel(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 1003)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                }
        }

        
    }
    
    
    
    func viewdocumentlist(CityId: String,DriverId: String)
        
    {
        
        let url = (API_URLs.documentlisturl + "\(CityId)&driver_id=\(DriverId)&language_id=\(GlobalVariables.languageid)&language_code=\(GlobalVariables.languagecode)")
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(url, method: .post, parameters: nil)
            
           
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = DocumentListModel(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 8026)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                }
        }
        
        
    }
    
    
    func UploadDocumentImage(DriverId: String,Documentexpirydate: String,DocumentId: String,DocumentImage: UIImage){
        
        
        let dic = ["driver_id":DriverId,
                   "document_expiry_date":Documentexpirydate,
                   "document_id":DocumentId,
                   "language_code":GlobalVariables.languagecode
            
            ] as [String : Any]
        
        print(dic)
        
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            
            
            if  let imageData = UIImageJPEGRepresentation(DocumentImage, 0.5) {
                
                multipartFormData.append(imageData, withName: "document_image", fileName: "swift_file.jpeg", mimeType: "image/jpeg")
                
            }
            
            
            for (key, value) in dic {
                
                let value = String(describing: value)
                
                multipartFormData.append((value).data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!, withName: key)
                // multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
                
            }
        }, to: API_URLs.UploadDocumentStep)
            
            
        { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (Progress) in
                    print("Upload Progress: \(Progress.fractionCompleted)")
                })
                
                upload.responseJSON { response in
                    
                    
                    self.delegate.onProgressState(1)
                    
                    print(response.result)
                    if let responsedata = response.result.value {
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        print(dataToParse)
                        let  ParsedData = DocumentUploadModel(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 8027)
                        
                        
                    }
                }
                
            case.failure(let error):
                //self.delegate?.showFailAlert()
                print("Request failed with error: \(errno)")
            }
            
        }
        
        
        
    }
    
    

    

    
    
    
    func changeDrop(droplat: String , droplong: String , droplocation : String,  rideid : String){
        
        
        
        let dic = ["drop_lat":droplat,
                   "drop_long":droplong,
                   "drop_location":droplocation,
                   "app_id":"2",
                   "ride_id":rideid,
                   "language_code":GlobalVariables.languagecode
            
            ] as [String : Any]
        
        
        self.delegate.onProgressState(0)
        
        Alamofire.request(API_URLs.changedropLoc, method: .post, parameters: dic)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = DropChange(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 675)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                }
        }
    }
    
    

    
    // ************************ Register API Parsing *********************************
    
    
    func registerDriver(email: String , phone: String , pass: String , name: String , cartype_id: String ,  carmodelId: String , carnumber: String , cityid: String, carImage : UIImage)
    {

        
        let dic = ["driver_email":email,
                   "driver_phone":phone,
                   "driver_password":pass,
                   "driver_name":name,
                   "car_type_id":cartype_id,
                   "car_model_id":carmodelId,
                   "car_number":carnumber,
                   "city_id":cityid,
                   "language_id":GlobalVariables.languageid,
                   "language_code":GlobalVariables.languagecode
                   
            
            ] as [String : Any]
        

        print(dic)
        
        self.delegate.onProgressState(0)
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            
            
            if  let imageData = UIImageJPEGRepresentation(carImage, 0.5) {
                
                multipartFormData.append(imageData, withName: "car_image", fileName: "swift_file.jpeg", mimeType: "image/jpeg")
                
            }
            
            
            for (key, value) in dic {
                
                let value1 = String(describing: value)
                
                multipartFormData.append(value1.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!, withName: key)
                
            }
        }, to: API_URLs.Register)
        { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (Progress) in
                    print("Upload Progress: \(Progress.fractionCompleted)")
                })
                
                upload.responseJSON { response in
                    
                                      
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = RegisterDriver(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 33)
                        
                        if(ParsedData.result == 1){
                            self.sendDeviceId()
                        }else if (ParsedData.result == 0){
                            print("unable to send device id because of login state equal to 0")
                        }
                        
                    }
                }
            case.failure(let error):
                
                self.delegate.onProgressState(0)
                self.delegate.onErrorsState(error.localizedDescription)
                
                
            }
        }
        
        
    }
        
        
    
    
    func EmergencyContactMessageUrl(RideId: String,DriverId: String,UserId: String,SOSNUMBER: String,Latitude: String,Longitude: String)
    {
        
        
        let dic = ["ride_id":RideId,
                   "driver_id":DriverId,
                   "user_id":UserId,
                   "sos_number":SOSNUMBER,
                   "latitude":Latitude,
                   "longitude":Longitude,
                   "application":"1",
                   "language_id":GlobalVariables.languageid,
                   "language_code":GlobalVariables.languagecode
            
            
            ] as [String : Any]
        
        
        print(dic)
        
        
        Alamofire.request(API_URLs.emergencycontactmessage, method: .post, parameters: dic)
            
            
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    //  self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        
                        // self.protocolmain_Catagory.onSuccessParse(data: ParsedData)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                  //  self.delegate.onErrorsState(error.localizedDescription)
                    
                }
        }
        
        
    }

    
    
    
    func EmergencyContactUrl()
    {
        
        
        let url = (API_URLs.emergencycontacturl + "?language_id=\(GlobalVariables.languageid)&language_code=\(GlobalVariables.languagecode)")
        
        print(url)
        
        
        Alamofire.request(url, method: .get, parameters: nil)

            
            
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    //  self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = EmergencyResponseModel(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 8022)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                    
                }
        }
        
        
    }

    
    

    
    func demoregisterDriver(driveremail: String , driverphone: String  , drivername: String , uniquenumber: String )
    {
        
        
        
        // let url = (API_URLs.Register + "\(email)&driver_phone=\(phone)&driver_password=\(pass) + &driver_name=\(name)&car_type_id=\(cartype_id)&car_model_id=\(carmodelId)&car_number=\(carnumber)&city_id=\(cityid)&language_id=\(GlobalVariables.languageid)")
        
        
        let dic = ["driver_email":driveremail,
                   "driver_phone":driverphone,
                   "unique_number":uniquenumber,
                   "driver_name":drivername,
                   "language_code":GlobalVariables.languagecode
                   
            
            ] as [String : Any]
        
        print(dic)
        
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(API_URLs.DemoRegister, method: .get, parameters: dic)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = RegisterDriver(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 8020)
                        
                        if(ParsedData.result == 1){
                            self.sendDeviceId()
                        }else if (ParsedData.result == 0){
                            print("unable to send device id because of login state equal to 0")
                        }
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                }
        }
        
        
    }
    

    
    
    
    
    func uploaddriverdocument(driverId: String, InsuranceImage: UIImage,LicenseImage: UIImage,RCImage : UIImage,Insurancedate: String,LicenseDate: String,RcDate: String)
    {
       
        
               
        let  URL = API_URLs.register2 + "\(driverId)&license_expire=\(LicenseDate)&insurance_expire=\(Insurancedate)&rc_expire=\(RcDate)&language_id=\(GlobalVariables.languageid)&language_code=\(GlobalVariables.languagecode)"
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            
            
            
            if  let imageData = UIImageJPEGRepresentation(InsuranceImage, 0.5) {
                multipartFormData.append(imageData, withName: "insurance", fileName: "swift_file.jpeg", mimeType: "image/jpeg")
            }
            
            if  let imageData1 = UIImageJPEGRepresentation(LicenseImage, 0.5) {
                multipartFormData.append(imageData1, withName: "license", fileName: "swift_file.jpeg", mimeType: "image/jpeg")
            }
            
            
            if  let imageData2 = UIImageJPEGRepresentation(RCImage, 0.5) {
                 multipartFormData.append(imageData2, withName: "rc", fileName: "swift_file.jpeg", mimeType: "image/jpeg")
            }
            

            
           
        }, to:URL)
        { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (Progress) in
                    print("Upload Progress: \(Progress.fractionCompleted)")
                })
                
                upload.responseJSON { response in
                    
                    
                    self.delegate.onProgressState(1)
                    
                    print(response.result)
                    if let DATA = response.result.value {
                        
                       self.delegate.onSuccessState(RegisterDriver(json: JSON(DATA)), resultCode: 1004)
                        
                    }
                }
                
            case.failure(let error):
                
                self.delegate.onProgressState(0)
                self.delegate.onErrorsState(error.localizedDescription)            }
            
        }
        

        
        
        
        
    }
    
    
    
    // ************************ Login API Parsing *********************************
    
    
    
    func loginDriver(emailPhone: String , password: String)
        
    {
        
        
        let url = (API_URLs.loginMobile + "\(emailPhone)&driver_password=\(password)&language_id=\(GlobalVariables.languageid)&language_code=\(GlobalVariables.languagecode)")
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(url, method: .post, parameters: nil)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = RegisterDriver(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 44)
                        
                        if(ParsedData.result == 1){
                            self.sendDeviceId()
                        }else if (ParsedData.result == 0){
                            print("unable to send device id because of login state equal to 0")
                        }
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                }
        }

        
    }
    
    // ************************ Device Id Parsing *********************************
    
    func sendDeviceId()
    {
        
        let driverid: String  = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!
      
        let deviceid  =  UserDefaults.standard.string(forKey: "device_key")
        
        
        print(deviceid!)
        
        
        let defaultdrivertoken = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverToken)!
        
        
        let url = (API_URLs.AddDeviceID + "\(driverid)&device_id=\(deviceid!)&flag=\("1")&driver_token=\(defaultdrivertoken)&language_id=\(GlobalVariables.languageid)&language_code=\(GlobalVariables.languagecode)")
        
      //  self.delegate.onProgressState(0)
        
        
        Alamofire.request(url, method: .post, parameters: nil)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                  //  self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                      
                        print("data after executing device id API  \(dataToParse)")
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                    
                }
        }

        
    }
    
    
    func ShowAllNotification(DriverId: String){
        
        
        let dic = ["application":"2",
                   "id":DriverId,
                   "language_code":GlobalVariables.languagecode
                   
            
            
            ] as [String : Any]
        
        print(dic)
        
       self.delegate.onProgressState(0)
        
        Alamofire.request(API_URLs.NotificationUrl, method: .post, parameters: dic)
            
            
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                  self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                          let  ParsedData = NotificationModel(json: dataToParse)
                       self.delegate.onSuccessState(ParsedData, resultCode: 8025)
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                }
        }
        
        
        
    }
    
    

    
    
    // ************************ Edit Profile Parsing *********************************
    
    
    
    
    func uploadRequest(parameters: [String: String] , driverImage: UIImage)
    {
        
        
        let  URL = API_URLs.Editprofile + "&language_id=\(GlobalVariables.languageid)&language_code=\(GlobalVariables.languagecode)"
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            
            
            
          
            
             if  let imageData = UIImageJPEGRepresentation(driverImage, 0.5) {
          
                 multipartFormData.append(imageData, withName: "driver_image", fileName: "swift_file.jpeg", mimeType: "image/jpeg")
            
            }
            
            
            for (key, value) in parameters {
                
                
                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
                
            }
        }, to:URL)
        { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (Progress) in
                    print("Upload Progress: \(Progress.fractionCompleted)")
                })
                
                upload.responseJSON { response in
                    
                    
                    self.delegate.onProgressState(1)

                    print(response.result)
                    if let DATA = response.result.value {
                        print(DATA)
                          self.delegate.onSuccessState(RegisterDriver(json: JSON(DATA)), resultCode: 55)
                      
                        
                    }
                }
                
            case.failure(let error):
                self.delegate.onProgressState(0)
                self.delegate.onErrorsState(error.localizedDescription)
            }
            
        }

        
        
    }
    
    
    // ************************ Change Password Parsing *********************************
    
    
    func changePassword(driverid: String , oldPwd: String , newPwd: String)
        
    {
        
         let defaultdrivertoken = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverToken)!
        
        
        
        let url = (API_URLs.ChangePassword + "\(driverid)&old_password=\(oldPwd)&new_password=\(newPwd)&driver_token=\(defaultdrivertoken)&language_id=\(GlobalVariables.languageid)&language_code=\(GlobalVariables.languagecode)")
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(url, method: .post, parameters: nil)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = ChangePassword(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 66)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                }
        }

        
    }
    
    
    
    func forgotPassword(driveremail: String)
        
    {
        
        
        let url = (API_URLs.forgotpassword + "\(driveremail)&language_id=\(GlobalVariables.languageid)&language_code=\(GlobalVariables.languagecode)")
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(url, method: .post, parameters: nil)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = ForgotPassword(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 77)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                    
                }
        }

    }
    
    
    //   ************************ Online/Offline Parsing *********************************
    
    
    func goOnline(driverid: String , onlineOffline: String,  driverToken: String)
        
    {
        
        let url = (API_URLs.GoOnline + "\(driverid)&online_offline=\(onlineOffline)&driver_token=\(driverToken)&language_id=\(GlobalVariables.languageid)&language_code=\(GlobalVariables.languagecode)")
        
        self.delegate.onProgressState(0)
        
        print(url)
        
        
        Alamofire.request(url, method: .post, parameters: nil)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = OnLineOffline(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 88)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                    
                }
        }

        
    }
    
    
    // ************************ About US Parsing *********************************
    
    
    func aboutUs()
        
    {
        
        let url = (API_URLs.Aboutus + "language_id=\(GlobalVariables.languageid)&language_code=\(GlobalVariables.languagecode)")
        
        self.delegate.onProgressState(0)
        
        print(url)
        
        
        Alamofire.request(url, method: .post, parameters: nil)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = AboutUs(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 99)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                }
        }

        
        
    }
    
    // ************************ About US Parsing *********************************
    
    
    func tc()
        
    {
        
        
        let url = (API_URLs.TermsAndConditions + "language_id=\(GlobalVariables.languageid)&language_code=\(GlobalVariables.languagecode)")
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(url, method: .post, parameters: nil)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = TCClass(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 110)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                }
        }
        
        

        
        
    }

    
    // ************************ Document Type Parsing *********************************
    
    
    func docType()
        
    {
        
        let defaultdrivertoken = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverToken)!
        
        
        
        let url = (API_URLs.documentType + "&driver_token=\(defaultdrivertoken)&language_id=\(GlobalVariables.languageid)&language_code=\(GlobalVariables.languagecode)")
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(url, method: .post, parameters: nil)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = DocumentType(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 231)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                }
        }
        
        
        

        
    }
    
    
    // ************************ Driver Home Parsing *********************************
    
    
    func goDriverHome(driverid: String , currentLat: String , currentLong: String, currentLoc: String,driverToken: String)
        
    {
        
      //  let url = (API_URLs.DriverHome + "\(driverid)&current_lat=\(currentLat)&current_long=\(currentLong)&current_location=\(currentLoc)&driver_token=\(driverToken)&language_id=\(GlobalVariables.languageid)")
        
        
        let dic = ["driver_id":driverid,
                   "current_lat":currentLat,
                   "current_long":currentLong,
                   "current_location":currentLoc,
                   "driver_token":driverToken,
                   "language_id":GlobalVariables.languageid,
                   "language_code":GlobalVariables.languagecode
            
            
            
            ] as [String : Any]
        

        print(dic)
        
      //  self.delegate.onProgressState(0)
        
        
        Alamofire.request(API_URLs.DriverHome, method: .get, parameters: dic)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                  //  self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = DriverHome(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 121)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                }
        }
        
        

        
        
    }
    
    
    
   /* func ContactApi()-> JSON{
        
        
        var dataToParse:JSON=nil
        
        var url = ""
        if(UserDefaults.standard.object(forKey: "PreferredLanguage") as! String == "en"){

        
        url = API_URLs.callSupport + "language_id=" + "1"
        }
        else{
        
         url = API_URLs.callSupport + "language_id=" + "2"
        }
        
        var finishFlag = 0
        Alamofire.request(.GET , url)
            
            .responseJSON { response in
                
                
                if let value = response.result.value{
                    dataToParse = JSON(value)
                    finishFlag = 1
                    
                    
                    GlobalVariables.contactTelephone  =  value["details"]!!["desc"] as! String
                    
                    
                    
                }
                
        }
        
        while finishFlag == 0 {
            RunLoop.current.run(mode: RunLoopMode.defaultRunLoopMode, before: Date.distantFuture)
        }
        
        
        
        return dataToParse
        
        
        
        
    }*/
    
    
    // ************************ View UserInfo Parsing *********************************
    
    func viewUserInfo(userid: String)
        
    {
        
         let defaultdrivertoken = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverToken)!
        
        
        let url = (API_URLs.ViewUserInfo + "\(userid)&driver_token=\(defaultdrivertoken)&language_id=\(GlobalVariables.languageid)&language_code=\(GlobalVariables.languagecode)")
        
          self.delegate.onProgressState(0)
        
        
        Alamofire.request(url, method: .post, parameters: nil)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                      self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = ViewUser(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 132)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                    
                }
        }
        
        

    }
    
    
    func HeatMapMethod(DriverId: String)
        
    {
        
             
        let url = (API_URLs.heatmapurl + "\(DriverId)&language_id=\(GlobalVariables.languageid)&language_code=\(GlobalVariables.languagecode)")
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(url, method: .post, parameters: nil)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = HeatMapModel(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 8023)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                }
        }
        
        
        
    }
    
    
    
    
    // ************************ View RideInfo Parsing *********************************
    
    func viewRideInfo(rideid: String)
        
    {
        
        let defaultdrivertoken = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverToken)!
        
        let url = (API_URLs.ViewRideInfo + "\(rideid)&driver_token=\(defaultdrivertoken)&language_id=\(GlobalVariables.languageid)&language_code=\(GlobalVariables.languagecode)")
        
         print(url)
        
          self.delegate.onProgressState(0)
        
        
        Alamofire.request(url, method: .post, parameters: nil)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                      self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = ViewRide(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 143)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                }
        }

        
    }
    
    
    
    // ************************ Rate Customer Parsing *********************************
    
    func rateCustomer(driverid: String ,customerid: String , rating: String , comment: String,RideId: String)
        
    {
        let defaultdrivertoken = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverToken)!
        
        
        let url = (API_URLs.RateCustomer + "\(driverid)&user_id=\(customerid)&rating_star=\(rating)&comment=\(comment)&driver_token=\(defaultdrivertoken)&ride_id=\(RideId)&language_id=\(GlobalVariables.languageid)&language_code=\(GlobalVariables.languagecode)")
        
        let escapedString = url.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
        
        print(url)
        
          self.delegate.onProgressState(0)
        
        
        Alamofire.request(escapedString!, method: .post, parameters: nil)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                      self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = RateCustomer(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 154)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                }
        }

    }
    
    // ************************ Accept Ride Parsing *********************************
    
    func acceptRide(rideid: String , driverid: String)
        
    {
        
          let defaultdrivertoken = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverToken)!
        
               let url = (API_URLs.AcceptRide + "\(rideid)&driver_id=\(driverid)&ride_status=\("3")&driver_token=\(defaultdrivertoken)&language_id=\(GlobalVariables.languageid)&language_code=\(GlobalVariables.languagecode)")
        
         self.delegate.onProgressState(0)
        
        print(url)
        
        Alamofire.request(url, method: .post, parameters: nil)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                      self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = RideAccept(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 165)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                }
        }
        

        
    }
    
    // ************************ Reject Ride Parsing *********************************
    
    func rejectRide(rideid: String , driverid: String)
        
    {
        
        let defaultdrivertoken = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverToken)!
        
        
        let url = (API_URLs.RejectRide + "\(rideid)&driver_id=\(driverid)&ride_status=\("4")&driver_token=\(defaultdrivertoken)&language_id=\(GlobalVariables.languageid)&language_code=\(GlobalVariables.languagecode)")
        
        self.delegate.onProgressState(0)
        
        print(url)
        
        
        Alamofire.request(url, method: .post, parameters: nil)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = RideReject(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 176)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                    
                }
        }
        

        
    }
    
    
    // ************************ Logout Parsing *********************************
    
    
    
    func logOut(driverid: String)
        
    {
          let defaultdrivertoken = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverToken)!
        
        
        let url = (API_URLs.logoutDriver + "\(driverid)&driver_token=\(defaultdrivertoken)&language_id=\(GlobalVariables.languageid)&language_code=\(GlobalVariables.languagecode)")
        
        print(url)
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(url, method: .post, parameters: nil)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = LogOut(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 187)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                }
        }
        

        
    }
    
    
    
    // ************************  Driver Arrived Parsing *********************************
    
    
    
    func driverArrived(rideid: String , driverid: String)
        
    {
        
          let defaultdrivertoken = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverToken)!
             // let url = (API_URLs.DriverArrived + "\(rideid)&driver_id=\(driverid)&arrived_time=\(arrTime)&ride_status=\("5")&driver_token=\(defaultdrivertoken)&language_id=\(GlobalVariables.languageid)")
        
        
        let url = (API_URLs.DriverArrived + "\(rideid)&driver_id=\(driverid)&driver_token=\(defaultdrivertoken)&language_id=\(GlobalVariables.languageid)&language_code=\(GlobalVariables.languagecode)")

        
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(url, method: .post, parameters: nil)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = Arrived(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 198)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                }
        }


        
    }
    
    
    
    func rideEnd(rideId: String , bLat: String , bLong: String , bLocation: String , eLat: String , eLong: String , eLocation: String , eTime: String , driverid: String , dist: String,LatLongScript: String)
        
    {
        
          let defaultdrivertoken = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverToken)!
        
      
        
        
        let dic = ["ride_id":rideId,
                   
                   "begin_lat":bLat,
                   "begin_long":bLong,
                   "begin_location":bLocation,
                   "end_lat":eLat,
                   "end_long":eLong,
                   "end_location":eLocation,
                   "end_time":eTime,
                   "driver_id":driverid,
                   "distance":dist,
                   "driver_token":defaultdrivertoken,
                   "lat_long":LatLongScript,
                   "language_id":GlobalVariables.languageid,
                   "language_code":GlobalVariables.languagecode
            
            
            ] as [String : Any]

        print(dic)
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(API_URLs.RideEnd, method: .post, parameters: dic)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = RideEnd(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 209)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                }
        }
        

    

    }
    
    
    func rideBegin(rideid: String ,bLat: String , bLong: String , bLocation: String ,driverId: String)
        
    {
        
          let defaultdrivertoken = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverToken)!
        
        
        
        
        let dic = ["ride_id":rideid,
                   "begin_lat":bLat,
                   "begin_long":bLong,
                   "begin_location":bLocation,
                   "driver_id":driverId,
                   "driver_token":defaultdrivertoken,
                   "language_id":GlobalVariables.languageid,
                   "language_code":GlobalVariables.languagecode
            
            
            ] as [String : Any]
        

        print(dic)
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(API_URLs.RideBegin, method: .get, parameters: dic)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = RideBegin(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 220)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                }
        }
        

    }
    
    
    
    func ViewDoneRide(RIDEID: String){
        
        
        let url = (API_URLs.viewdonerideinfo + "\(RIDEID)&language_id=\(GlobalVariables.languageid)&language_code=\(GlobalVariables.languagecode)")
        
        self.delegate.onProgressState(0)
        
        print(url)
        
        
        Alamofire.request(url, method: .get, parameters: nil)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                     self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = DoneRideModel(json: dataToParse)
                         self.delegate.onSuccessState(ParsedData , resultCode: 1777)
                      //  self.protocolmain_Catagory.onSuccessParse(data: ParsedData)
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                    
                    
                }
        }
        
        
        
    }
    
    

    
    
    
    
    func viewProfile(_ driverid: String)
        
    {
        
        
        let url = (API_URLs.viewProfile + "\(driverid)&language_id=\(GlobalVariables.languageid)&language_code=\(GlobalVariables.languagecode)")
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(url, method: .post, parameters: nil)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = ViewProfile(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 242)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                    
                }
        }
        

        
    }

    
    // ************************ Track ride to calculate distance ****************************
    
    
    
        func trackRide(_ tripid: String , driverid: String , driverLat: String , driverLong: String)
    
        {
            
              let defaultdrivertoken = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverToken)!
            
            let url = (API_URLs.trackRide + "\(tripid)&driver_id=\(driverid)&driver_lat=\(driverLat) &driver_long=\(driverLong)&driver_token=\(defaultdrivertoken)&language_id=\(GlobalVariables.languageid)&language_code=\(GlobalVariables.languagecode)")
            
            self.delegate.onProgressState(0)
            
            
            Alamofire.request(url, method: .post, parameters: nil)
                
                /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
                 //print("Progress: \(progress.fractionCompleted)")
                 }
                 .validate { request, response, data in
                 return .success
                 }*/
                .responseJSON { response in
                    switch response.result
                    {
                        
                    case.success( _):
                        
                        self.delegate.onProgressState(1)
                        
                        if let responsedata = response.result.value
                        {
                            
                            print(responsedata)
                            let dataToParse = JSON(responsedata)
                            let  ParsedData = TrackRide(json: dataToParse)
                            self.delegate.onSuccessState(ParsedData , resultCode: 253)
                            
                            
                            
                            
                        }
                    case.failure(let error):
                        
                        self.delegate.onProgressState(0)
                        self.delegate.onErrorsState(error.localizedDescription)
                        
                        
                    }
            }

    
        }
    
    
    
    // ************************ Update driver location ****************************
    
    
    
    func updateDriverLocation(_ tripid: String , driverid: String , userid: String , driverLat: String , driverLong: String)
        
    {
          let defaultdrivertoken = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverToken)!
        
        
        let url = (API_URLs.UpdateDriverLocation + "\(tripid)&driver_id=\(driverid)&user_id=\(userid)&driver_lat=\(driverLat)&driver_long=\(driverLong)&driver_token=\(defaultdrivertoken)&language_id=\(GlobalVariables.languageid)&language_code=\(GlobalVariables.languagecode)")
        
       // self.delegate.onProgressState(0)
        
        
        Alamofire.request(url, method: .post, parameters: nil)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                 //   self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = UpdateDriverLocation(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 264)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                }
        }
        

        
    }
    
    
    
    
   /* func ShowAllRides( _ driverid: String){
        
        
          let defaultdrivertoken = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverToken)!
        
        
        
        let url = (API_URLs.yourride + "\(driverid)&driver_token=\(defaultdrivertoken)&language_id=\(GlobalVariables.languageid)")
        
        self.delegate.onProgressState(0)
        
        print(url)
        
        
        Alamofire.request(url, method: .post, parameters: nil)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = AllRides(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 1001)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                 //  self.delegate.onErrorsState(String(describing: error), errorCode: error as! Int)
                    
                    print("Request failed with error: \(error)")
                    
                    
                    
                }
        }
        
        

        

    }*/
    
    
    
    func DriverEarning( _ driverid: String){
        
          let defaultdrivertoken = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverToken)!
             let url = (API_URLs.driverearning + "\(driverid)&driver_token=\(defaultdrivertoken)&language_id=\(GlobalVariables.languageid)&language_code=\(GlobalVariables.languagecode)")
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(url, method: .post, parameters: nil)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = DriverEarningModel(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 1002)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                }
        }
        
        

        
        
    }

    
    
    func DriverEarning1( _ driverid: String){
        
       
         let url = (API_URLs.driverearning1 + "\(driverid)&language_code=\(GlobalVariables.languagecode)")
        
        
        
        print(url)
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(url, method: .post, parameters: nil)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = DriverEarningNew(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 666)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                }
        }
        
        
    }
    
    
    
    func DriverSelectDateStatement(driverid: String,Date: String){
        
        
        let url = (API_URLs.weeklystatementurl + "\(driverid)&date=\(Date)&language_code=\(GlobalVariables.languagecode)")
        
        
        
        print(url)
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(url, method: .post, parameters: nil)
            
          
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = DriverEarningNew(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 8018)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                }
        }
        
        
    }

    
    
    func Driverdaystatement( _ driverid: String , date: String){
        
        let defaultdrivertoken = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverToken)!
        let url = (API_URLs.daystatement + "\(driverid)&date=\(date)&language_code=\(GlobalVariables.languagecode)")
        //let url = (API_URLs.driverearning1 + "\(driverid)&driver_token=\(defaultdrivertoken)&language_id=\(GlobalVariables.languageid)")
        
        self.delegate.onProgressState(0)
        
        print(url)
        Alamofire.request(url, method: .post, parameters: nil)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = DayStatement(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 667)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                }
        }
        
        
    }

    func reasonCancel()
        
    {
        
        let url = (API_URLs.drivercancelreason + "language_id=\(GlobalVariables.languageid)&language_code=\(GlobalVariables.languagecode)")
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(url, method: .post, parameters: nil)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = ReasonModel(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 1005)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                }
        }
        
        

        
    }
    
    
    func CancelDriver(_ RIDEID: String){
        
        
        let url = (API_URLs.Cancelbydriver + "\(RIDEID)&ride_status=\("9")&reason_id=\(GlobalVariables.cancelId)&language_id=\(GlobalVariables.languageid)&language_code=\(GlobalVariables.languagecode)")
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(url, method: .post, parameters: nil)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = CancelRideModel(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 1006)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                }
        }
        

        
    }
    
    
    
    func RentalDriverCancel(RentalBookindId: String,DriverId: String){
        
        
        let dic = ["rental_booking_id":RentalBookindId,
                   "driver_id":DriverId,
                   "cancel_reason_id":GlobalVariables.cancelId,
                   "language_id":GlobalVariables.languageid,
                   "language_code":GlobalVariables.languagecode
            
            
            ] as [String : Any]
        
        print(dic)
        
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(API_URLs.rentaldrivercancel, method: .post, parameters: dic)
            
            
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        print(dataToParse)
                        let  ParsedData = RentalRideCancelModel(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 8021)
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                    
                    
                }
        }
        
        
        
    }
    

    
    
    func RentalDriverSync(RentalBookindId: String){
        
        
        let dic = ["rental_booking_id":RentalBookindId,
                   "app_id":"2",
                   "language_id":GlobalVariables.languageid,
                   "language_code":GlobalVariables.languagecode
            
            
            ] as [String : Any]
        
        print(dic)
        
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(API_URLs.rentalridesync, method: .post, parameters: dic)
            
            
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        print(dataToParse)
                        let  ParsedData = RentalRideSyncModel(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 8006)
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                }
        }
        
        
        
    }
    
    
    func DriverSync(_ RIDEID: String,DriverId: String){
        
        
        let url = (API_URLs.driversync + "\(RIDEID)&driver_id=\(DriverId)&language_id=\(GlobalVariables.languageid)&language_code=\(GlobalVariables.languagecode)")
        
        self.delegate.onProgressState(0)
        
        print(url)
        
        
        Alamofire.request(url, method: .post, parameters: nil)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = DriverSyncModel(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 2006)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                }
        }
        
        

        
    }
    
    
    
    
    func DriverSyncHomeScreeen(DriverId: String){
        
        
        let url = (API_URLs.driversyncurl + "\(DriverId)&language_id=\(GlobalVariables.languageid)&language_code=\(GlobalVariables.languagecode)")
        
        self.delegate.onProgressState(0)
        
        print(url)
        
        Alamofire.request(url, method: .post, parameters: nil)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = DriverSyncModel(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 8019)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                }
        }
        
        
        
        
    }

    
// 4&name=1&email=12&phone=&query=hello

    
    func CustomerSupportApi(DriverId: String,Name: String,Email: String,Phone: String,Query: String){
        
        
        let dic = ["name":Name,
                   "driver_id":DriverId,
                   "user_id":"",
                   "email":Email,
                   "phone":Phone,
                   "query":Query,
                   "application":"2",
                   "language_id":GlobalVariables.languageid,
                   "language_code":GlobalVariables.languagecode
                       
            ] as [String : Any]

        
        print(dic)
        
       // let url = (API_URLs.customersupport + "\(DriverId)&name=\(Name)&email=\(Email)&phone=\(Phone)&query=\(Query)")
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(API_URLs.customersupport, method: .post, parameters: dic)
            
            /* .downloadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
             //print("Progress: \(progress.fractionCompleted)")
             }
             .validate { request, response, data in
             return .success
             }*/
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = CustomerSupportModel(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 5555)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                }
        }
        
        

    }
    
    
    
    func DriverReportUrl(DriverId: String){
        
        
           let defaultdrivertoken = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverToken)!
        
        let dic = ["driver_id":DriverId,
                   "driver_token":defaultdrivertoken,
                    "language_id":GlobalVariables.languageid,
                    "language_code":GlobalVariables.languagecode
            
            ] as [String : Any]
        
        
        print(dic)
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(API_URLs.driverreport, method: .post, parameters: dic)
            
          
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                    let  ParsedData = DriverReportModel(json: dataToParse)
                    self.delegate.onSuccessState(ParsedData , resultCode: 8024)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                }
        }
        
        
        
    }
    

    
    
    
    func RentalRideInfo(RentalBookindId: String){
        
        
        let dic = ["rental_booking_id":RentalBookindId,
                   "language_id":GlobalVariables.languageid,
                   "language_code":GlobalVariables.languagecode
            
            
            ] as [String : Any]
        
        print(dic)
        
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(API_URLs.rentalrideinfo, method: .post, parameters: dic)
            
            
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        print(dataToParse)
                        let  ParsedData = RentalRideInfoModel(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 8007)
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                    
                    
                }
        }
        
        
        
    }
    
    
    func RentalRideAccept(RentalBookindId: String,DriverId: String,DriverToken: String){
        
        
        let dic = ["rental_booking_id":RentalBookindId,
                   "driver_id":DriverId,
                   "driver_token":DriverToken,
                   "language_id":GlobalVariables.languageid,
                   "language_code":GlobalVariables.languagecode
            
            
            ] as [String : Any]
        
        
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(API_URLs.rentalrideaccept, method: .post, parameters: dic)
            
            
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        print(dataToParse)
                        let  ParsedData = RentalRideAcceptModel(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 8008)
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                    
                }
        }
        
        
        
    }
    
    
    func RentalRideReject(RentalBookindId: String,DriverId: String,DriverToken: String){
        
        
        let dic = ["rental_booking_id":RentalBookindId,
                   "driver_id":DriverId,
                   "driver_token":DriverToken,
                   "language_id":GlobalVariables.languageid,
                   "language_code":GlobalVariables.languagecode
            
            
            ] as [String : Any]
        
        print(dic)
        
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(API_URLs.rentalridereject, method: .post, parameters: dic)
            
            
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        print(dataToParse)
                        let  ParsedData = RentalRideRejectModel(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 8009)
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                    
                    
                }
        }
        
        
        
    }
    
    
    
    
    func RentalRideArrive(RentalBookindId: String,DriverId: String,DriverToken: String){
        
        
        let dic = ["rental_booking_id":RentalBookindId,
                   "driver_id":DriverId,
                   "driver_token":DriverToken,
                   "language_id":GlobalVariables.languageid,
                   "language_code":GlobalVariables.languagecode
            
            
            ] as [String : Any]
        
        print(dic)
        
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(API_URLs.rentalridearrive, method: .post, parameters: dic)
            
            
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        print(dataToParse)
                        let  ParsedData = RentalDriverArriveModel(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 8010)
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                    
                }
        }
        
        
        
    }
    
    
    
    func RentalRideStart(RentalBookindId: String,DriverId: String,DriverToken: String,bLat: String , bLong: String , bLocation: String ,ReadingImage: UIImage,ReadingValue:String){
        
        print(GlobalVariables.languageid)
        
        let dic = ["rental_booking_id":RentalBookindId,
                   "driver_id":DriverId,
                   "driver_token":DriverToken,
                   "meter_reading":ReadingValue,
                   "begin_lat":bLat,
                   "begin_long":bLong,
                   "begin_location":bLocation,
                   "language_id":GlobalVariables.languageid,
                   "language_code":GlobalVariables.languagecode
            
            
            
            
            ] as! [String : Any]
        
        print(dic)
        
        print(GlobalVariables.meterimage)
        
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            
            
            if  let imageData = UIImageJPEGRepresentation(ReadingImage, 0.5) {
                
                multipartFormData.append(imageData, withName: "meter_reading_image", fileName: "swift_file.jpeg", mimeType: "image/jpeg")
                
            }
            
            
            for (key, value) in dic {
                
                
                let value = String(describing: value)
                
                multipartFormData.append((value).data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!, withName: key)
                
            }
        }, to: API_URLs.rentalridestart)
            
            
        { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (Progress) in
                    print("Upload Progress: \(Progress.fractionCompleted)")
                })
                
                upload.responseJSON { response in
                    
                    
                    self.delegate.onProgressState(1)
                    
                    print(response.result)
                    if let responsedata = response.result.value {
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        print(dataToParse)
                        let  ParsedData = RentalDriverStartModel(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 8011)
                        
                        
                    }
                }
                
            case.failure(let error):
                //self.delegate?.showFailAlert()
                self.delegate.onProgressState(0)
                self.delegate.onErrorsState(error.localizedDescription)
            }
            
        }
        
        
        
    }
    
    
    
    
    func RentalRideEnd(RentalBookindId: String,DriverId: String,DriverToken: String,ELat: String , ELong: String , ELocation: String ,ReadingImage: UIImage,ReadingValue:String){
        
        
        let dic = ["rental_booking_id":RentalBookindId,
                   "driver_id":DriverId,
                   "driver_token":DriverToken,
                   "meter_reading":ReadingValue,
                   "end_lat":ELat,
                   "end_long":ELong,
                   "end_location":ELocation,
                   "language_id":GlobalVariables.languageid,
                   "language_code":GlobalVariables.languagecode
            
            
            ] as! [String : Any]
        
        print(dic)
        
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.upload(multipartFormData: { (multipartFormData) in
            
            
            if  let imageData = UIImageJPEGRepresentation(ReadingImage, 0.5) {
                
                multipartFormData.append(imageData, withName: "meter_reading_image", fileName: "swift_file.jpeg", mimeType: "image/jpeg")
                
            }
            
            
            for (key, value) in dic {
                
                let value = String(describing: value)
                
                multipartFormData.append((value).data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue))!, withName: key)
                // multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
                
            }
        }, to: API_URLs.rentalrideend)
            
            
        { (result) in
            switch result {
            case .success(let upload, _, _):
                
                upload.uploadProgress(closure: { (Progress) in
                    print("Upload Progress: \(Progress.fractionCompleted)")
                })
                
                upload.responseJSON { response in
                    
                    
                    self.delegate.onProgressState(1)
                    
                    print(response.result)
                    if let responsedata = response.result.value {
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        print(dataToParse)
                        let  ParsedData = RentalDriverEndModel(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 8012)
                        
                        
                    }
                }
                
            case.failure(let error):
                //self.delegate?.showFailAlert()
                self.delegate.onProgressState(0)
                self.delegate.onErrorsState(error.localizedDescription)
            }
            
        }
        
        
        
    }
    
    
    
    
    func RentalCancelReason(){
        
        
        let dic = ["app_id":"2",
                   "language_id":GlobalVariables.languageid,
                   "language_code":GlobalVariables.languagecode
            
            
            ] as [String : Any]
        
        print(dic)
        
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(API_URLs.rentalcancelreason, method: .post, parameters: dic)
            
            
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        print(dataToParse)
                        let  ParsedData = RentalCancelReasonModel(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 8013)
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                }
        }
        
        
        
    }
    
    
    func ShowAllRides(driverid: String){
        
        
        
        let dic = ["driver_id":driverid,
                   "language_id":GlobalVariables.languageid,
                   "language_code":GlobalVariables.languagecode
            
            
            ] as [String : Any]
        
        print(dic)
        
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(API_URLs.yourride, method: .post, parameters: dic)
            
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = AllRides(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 1001)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                    
                }
        }
        
    }
    
    func RentalviewRideInfo(BookingId: String,RideMode: String)
        
    {
        
        let dic = ["ride_mode":RideMode,
                   "booking_id":BookingId,
                   "language_id":GlobalVariables.languageid,
                   "language_code":GlobalVariables.languagecode
            
            
            ] as [String : Any]
        
        print(dic)
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(API_URLs.RentalViewRideInfo, method: .post, parameters: dic)
            
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = ViewRideModel(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 8015)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                }
        }
        
        
    }
    
    
    func NormalviewRideInfo(BookingId: String,RideMode: String)
        
    {
        
        let dic = ["ride_mode":RideMode,
                   "booking_id":BookingId,
                   "language_id":GlobalVariables.languageid,
                   "language_code":GlobalVariables.languagecode
            
            
            ] as [String : Any]
        
        print(dic)
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(API_URLs.RentalViewRideInfo, method: .post, parameters: dic)
            
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        let  ParsedData = NormalViewRideInfoModel(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 8014)
                        
                        
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                }
        }
        
        
    }
    
    
    
    func RentalRideFare(RentalBookindId: String){
        
        
        let dic = ["rental_booking_id":RentalBookindId,
                   "language_id":GlobalVariables.languageid,
                   "language_code":GlobalVariables.languagecode
            
            
            ] as [String : Any]
        
        print(dic)
        
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(API_URLs.Rentalridefareinfo, method: .post, parameters: dic)
            
            
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        print(dataToParse)
                        let  ParsedData = RentalRideFareModel(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 8016)
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                    
                }
        }
        
        
        
    }
    
    
    func RentalRatingApi(RentalBookindId: String,RatingValue: String,DriverId: String,UserId: String,Comment: String){
        
        
        let dic = ["rental_booking_id":RentalBookindId,
                   "rating_star":RatingValue,
                   "comment":Comment,
                   "user_id":UserId,
                   "driver_id":DriverId,
                   "app_id":"2",
                   "language_id":GlobalVariables.languageid,
                   "language_code":GlobalVariables.languagecode
            
            
            ] as [String : Any]
        
        print(dic)
        
        
        self.delegate.onProgressState(0)
        
        
        Alamofire.request(API_URLs.Rentalratinginfo, method: .post, parameters: dic)
            
            
            .responseJSON { response in
                switch response.result
                {
                    
                case.success( _):
                    
                    self.delegate.onProgressState(1)
                    
                    if let responsedata = response.result.value
                    {
                        
                        print(responsedata)
                        let dataToParse = JSON(responsedata)
                        print(dataToParse)
                        let  ParsedData = RentalRateCustomerModel(json: dataToParse)
                        self.delegate.onSuccessState(ParsedData , resultCode: 8017)
                        
                        
                    }
                case.failure(let error):
                    
                    self.delegate.onProgressState(0)
                    self.delegate.onErrorsState(error.localizedDescription)
                    
                    
                    
                }
        }
        
        
        
    }
    
   
    
    
    
    
    
    
    
    
    
    
    


    
    
    
    
    
}
