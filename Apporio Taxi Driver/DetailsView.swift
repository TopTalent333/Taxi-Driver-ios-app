//
//  Details.swift
//
//  Created by Rakesh kumar on 19/12/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class DetailsView: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.

    internal let kDetailsRcKey: String = "rc"
    internal let kDetailsInsuranceKey: String = "insurance"
    internal let kDetailsLastUpdateKey: String = "last_update"
    internal let kDetailsRejectRidesKey: String = "reject_rides"
    internal let kDetailsRatingKey: String = "rating"
    internal let kDetailsDriverEmailKey: String = "driver_email"
    internal let kDetailsDriverImageKey: String = "driver_image"
    internal let kDetailsCarModelNameKey: String = "car_model_name"
    internal let kDetailsFlagKey: String = "flag"
    internal let kDetailsDriverNameKey: String = "driver_name"
    internal let kDetailsCancelledRidesKey: String = "cancelled_rides"
    internal let kDetailsDeviceIdKey: String = "device_id"
    internal let kDetailsLoginLogoutKey: String = "login_logout"
    internal let kDetailsCompletedRidesKey: String = "completed_rides"
    internal let kDetailsStatusKey: String = "status"
    internal let kDetailsBusyKey: String = "busy"
    internal let kDetailsCarModelIdKey: String = "car_model_id"
    internal let kDetailsCarTypeNameKey: String = "car_type_name"
    internal let kDetailsCurrentLocationKey: String = "current_location"
    internal let kDetailsDriverIdKey: String = "driver_id"
    internal let kDetailsDetailStatusKey: String = "detail_status"
    internal let kDetailsCarNumberKey: String = "car_number"
    internal let kDetailsLicenseKey: String = "license"
    internal let kDetailsLastUpdateDateKey: String = "last_update_date"
    internal let kDetailsDriverTokenKey: String = "driver_token"
    internal let kDetailsRegisterDateKey: String = "register_date"
    internal let kDetailsCurrentLatKey: String = "current_lat"
    internal let kDetailsCurrentLongKey: String = "current_long"
    internal let kDetailsDriverPhoneKey: String = "driver_phone"
    internal let kDetailsOnlineOfflineKey: String = "online_offline"
    internal let kDetailsCarTypeIdKey: String = "car_type_id"
    internal let kDetailsCityIdKey: String = "city_id"
    internal let kDetailsDriverPasswordKey: String = "driver_password"
    internal let kDetailsOtherDocsKey: String = "other_docs"
    
    
    // MARK: Properties
    public var rc: String?
    public var insurance: String?
    public var lastUpdate: String?
    public var rejectRides: String?
    public var rating: String?
    public var driverEmail: String?
    public var driverImage: String?
    public var carModelName: String?
    public var flag: String?
    public var driverName: String?
    public var cancelledRides: String?
    public var deviceId: String?
    public var loginLogout: String?
    public var completedRides: String?
    public var status: String?
    public var busy: String?
    public var carModelId: String?
    public var carTypeName: String?
    public var currentLocation: String?
    public var driverId: String?
    public var detailStatus: String?
    public var carNumber: String?
    public var license: String?
    public var lastUpdateDate: String?
    public var driverToken: String?
    public var registerDate: String?
    public var currentLat: String?
    public var currentLong: String?
    public var driverPhone: String?
    public var onlineOffline: String?
    public var carTypeId: String?
    public var cityId: String?
    public var driverPassword: String?
    public var otherDocs: String?
    
    
    // MARK: SwiftyJSON Initalizers
    /**
     Initates the class based on the object
     - parameter object: The object of either Dictionary or Array kind that was passed.
     - returns: An initalized instance of the class.
     */
    convenience public init(object: AnyObject) {
        self.init(json: JSON(object))
    }
    
    /**
     Initates the class based on the JSON that was passed.
     - parameter json: JSON object from SwiftyJSON.
     - returns: An initalized instance of the class.
     */
    public init(json: JSON) {
        rc = json[kDetailsRcKey].string
        insurance = json[kDetailsInsuranceKey].string
        lastUpdate = json[kDetailsLastUpdateKey].string
        rejectRides = json[kDetailsRejectRidesKey].string
        rating = json[kDetailsRatingKey].string
        driverEmail = json[kDetailsDriverEmailKey].string
        driverImage = json[kDetailsDriverImageKey].string
        carModelName = json[kDetailsCarModelNameKey].string
        flag = json[kDetailsFlagKey].string
        driverName = json[kDetailsDriverNameKey].string
        cancelledRides = json[kDetailsCancelledRidesKey].string
        deviceId = json[kDetailsDeviceIdKey].string
        loginLogout = json[kDetailsLoginLogoutKey].string
        completedRides = json[kDetailsCompletedRidesKey].string
        status = json[kDetailsStatusKey].string
        busy = json[kDetailsBusyKey].string
        carModelId = json[kDetailsCarModelIdKey].string
        carTypeName = json[kDetailsCarTypeNameKey].string
        currentLocation = json[kDetailsCurrentLocationKey].string
        driverId = json[kDetailsDriverIdKey].string
        detailStatus = json[kDetailsDetailStatusKey].string
        carNumber = json[kDetailsCarNumberKey].string
        license = json[kDetailsLicenseKey].string
        lastUpdateDate = json[kDetailsLastUpdateDateKey].string
        driverToken = json[kDetailsDriverTokenKey].string
        registerDate = json[kDetailsRegisterDateKey].string
        currentLat = json[kDetailsCurrentLatKey].string
        currentLong = json[kDetailsCurrentLongKey].string
        driverPhone = json[kDetailsDriverPhoneKey].string
        onlineOffline = json[kDetailsOnlineOfflineKey].string
        carTypeId = json[kDetailsCarTypeIdKey].string
        cityId = json[kDetailsCityIdKey].string
        driverPassword = json[kDetailsDriverPasswordKey].string
        otherDocs = json[kDetailsOtherDocsKey].string
        
    }
    
    
    /**
     Generates description of the object in the form of a NSDictionary.
     - returns: A Key value pair containing all valid values in the object.
     */
    public func dictionaryRepresentation() -> [String : AnyObject ] {
        
        var dictionary: [String : AnyObject ] = [ : ]
        if rc != nil {
            dictionary.updateValue(rc! as AnyObject, forKey: kDetailsRcKey)
        }
        if insurance != nil {
            dictionary.updateValue(insurance! as AnyObject, forKey: kDetailsInsuranceKey)
        }
        if lastUpdate != nil {
            dictionary.updateValue(lastUpdate! as AnyObject, forKey: kDetailsLastUpdateKey)
        }
        if rejectRides != nil {
            dictionary.updateValue(rejectRides! as AnyObject, forKey: kDetailsRejectRidesKey)
        }
        if rating != nil {
            dictionary.updateValue(rating! as AnyObject, forKey: kDetailsRatingKey)
        }
        if driverEmail != nil {
            dictionary.updateValue(driverEmail! as AnyObject, forKey: kDetailsDriverEmailKey)
        }
        if driverImage != nil {
            dictionary.updateValue(driverImage! as AnyObject, forKey: kDetailsDriverImageKey)
        }
        if carModelName != nil {
            dictionary.updateValue(carModelName! as AnyObject, forKey: kDetailsCarModelNameKey)
        }
        if flag != nil {
            dictionary.updateValue(flag! as AnyObject, forKey: kDetailsFlagKey)
        }
        if driverName != nil {
            dictionary.updateValue(driverName! as AnyObject, forKey: kDetailsDriverNameKey)
        }
        if cancelledRides != nil {
            dictionary.updateValue(cancelledRides! as AnyObject, forKey: kDetailsCancelledRidesKey)
        }
        if deviceId != nil {
            dictionary.updateValue(deviceId! as AnyObject, forKey: kDetailsDeviceIdKey)
        }
        if loginLogout != nil {
            dictionary.updateValue(loginLogout! as AnyObject, forKey: kDetailsLoginLogoutKey)
        }
        if completedRides != nil {
            dictionary.updateValue(completedRides! as AnyObject, forKey: kDetailsCompletedRidesKey)
        }
        if status != nil {
            dictionary.updateValue(status! as AnyObject, forKey: kDetailsStatusKey)
        }
        if busy != nil {
            dictionary.updateValue(busy! as AnyObject, forKey: kDetailsBusyKey)
        }
        if carModelId != nil {
            dictionary.updateValue(carModelId! as AnyObject, forKey: kDetailsCarModelIdKey)
        }
        if carTypeName != nil {
            dictionary.updateValue(carTypeName! as AnyObject, forKey: kDetailsCarTypeNameKey)
        }
        if currentLocation != nil {
            dictionary.updateValue(currentLocation! as AnyObject, forKey: kDetailsCurrentLocationKey)
        }
        if driverId != nil {
            dictionary.updateValue(driverId! as AnyObject, forKey: kDetailsDriverIdKey)
        }
        if detailStatus != nil {
            dictionary.updateValue(detailStatus! as AnyObject, forKey: kDetailsDetailStatusKey)
        }
        if carNumber != nil {
            dictionary.updateValue(carNumber! as AnyObject, forKey: kDetailsCarNumberKey)
        }
        if license != nil {
            dictionary.updateValue(license! as AnyObject, forKey: kDetailsLicenseKey)
        }
        if lastUpdateDate != nil {
            dictionary.updateValue(lastUpdateDate! as AnyObject, forKey: kDetailsLastUpdateDateKey)
        }
        if driverToken != nil {
            dictionary.updateValue(driverToken! as AnyObject, forKey: kDetailsDriverTokenKey)
        }
        if registerDate != nil {
            dictionary.updateValue(registerDate! as AnyObject, forKey: kDetailsRegisterDateKey)
        }
        if currentLat != nil {
            dictionary.updateValue(currentLat! as AnyObject, forKey: kDetailsCurrentLatKey)
        }
        if currentLong != nil {
            dictionary.updateValue(currentLong! as AnyObject, forKey: kDetailsCurrentLongKey)
        }
        if driverPhone != nil {
            dictionary.updateValue(driverPhone! as AnyObject, forKey: kDetailsDriverPhoneKey)
        }
        if onlineOffline != nil {
            dictionary.updateValue(onlineOffline! as AnyObject, forKey: kDetailsOnlineOfflineKey)
        }
        if carTypeId != nil {
            dictionary.updateValue(carTypeId! as AnyObject, forKey: kDetailsCarTypeIdKey)
        }
        if cityId != nil {
            dictionary.updateValue(cityId! as AnyObject, forKey: kDetailsCityIdKey)
        }
        if driverPassword != nil {
            dictionary.updateValue(driverPassword! as AnyObject, forKey: kDetailsDriverPasswordKey)
        }
        if otherDocs != nil {
            dictionary.updateValue(otherDocs! as AnyObject, forKey: kDetailsOtherDocsKey)
        }
        
        return dictionary
    }
    
}

