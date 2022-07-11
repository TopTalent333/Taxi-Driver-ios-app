//
//  Details.swift
//
//  Created by Rakesh kumar on 19/12/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class DetailsAccept: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kDetailsPickupLatKey: String = "pickup_lat"
    internal let kDetailsLaterDateKey: String = "later_date"
    internal let kDetailsFacebookTokenKey: String = "facebook_token"
    internal let kDetailsGoogleIdKey: String = "google_id"
    internal let kDetailsPaymentOptionIdKey: String = "payment_option_id"
    internal let kDetailsUserImageKey: String = "user_image"
    internal let kDetailsUserNameKey: String = "user_name"
    internal let kDetailsFlagKey: String = "flag"
    internal let kDetailsGoogleImageKey: String = "google_image"
    internal let kDetailsLastTimeStampKey: String = "last_time_stamp"
    internal let kDetailsDeviceIdKey: String = "device_id"
    internal let kDetailsCardIdKey: String = "card_id"
    internal let kDetailsUserEmailKey: String = "user_email"
    internal let kDetailsLoginLogoutKey: String = "login_logout"
    internal let kDetailsStatusKey: String = "status"
    internal let kDetailsRideTimeKey: String = "ride_time"
    internal let kDetailsUserPasswordKey: String = "user_password"
    internal let kDetailsRideTypeKey: String = "ride_type"
    internal let kDetailsRideIdKey: String = "ride_id"
    internal let kDetailsReferralCodeSendKey: String = "referral_code_send"
    internal let kDetailsReasonIdKey: String = "reason_id"
    internal let kDetailsCarTypeIdKey: String = "car_type_id"
    internal let kDetailsUserIdKey: String = "user_id"
    internal let kDetailsDropLongKey: String = "drop_long"
    internal let kDetailsPasswordCreatedKey: String = "password_created"
    internal let kDetailsFacebookFirstnameKey: String = "facebook_firstname"
    internal let kDetailsFreeRidesKey: String = "free_rides"
    internal let kDetailsLaterTimeKey: String = "later_time"
    internal let kDetailsFacebookImageKey: String = "facebook_image"
    internal let kDetailsTokenCreatedKey: String = "token_created"
    internal let kDetailsRatingKey: String = "rating"
    internal let kDetailsGoogleNameKey: String = "google_name"
    internal let kDetailsRideDateKey: String = "ride_date"
    internal let kDetailsGoogleMailKey: String = "google_mail"
    internal let kDetailsRideStatusKey: String = "ride_status"
    internal let kDetailsRideImageKey: String = "ride_image"
    internal let kDetailsDropLocationKey: String = "drop_location"
    internal let kDetailsCouponCodeKey: String = "coupon_code"
    internal let kDetailsUserPhoneKey: String = "user_phone"
    internal let kDetailsFacebookMailKey: String = "facebook_mail"
    internal let kDetailsPickupLocationKey: String = "pickup_location"
    internal let kDetailsDropLatKey: String = "drop_lat"
    internal let kDetailsDriverIdKey: String = "driver_id"
    internal let kDetailsEmailVerifiedKey: String = "email_verified"
    internal let kDetailsFacebookIdKey: String = "facebook_id"
    internal let kDetailsRegisterDateKey: String = "register_date"
    internal let kDetailsGoogleTokenKey: String = "google_token"
    internal let kDetailsFacebookLastnameKey: String = "facebook_lastname"
    internal let kDetailsRideAdminStatusKey: String = "ride_admin_status"
    internal let kDetailsPhoneVerifiedKey: String = "phone_verified"
    internal let kDetailsPickupLongKey: String = "pickup_long"
    internal let kDetailsReferralCodeKey: String = "referral_code"
    
    
    // MARK: Properties
    public var pickupLat: String?
    public var laterDate: String?
    public var facebookToken: String?
    public var googleId: String?
    public var paymentOptionId: String?
    public var userImage: String?
    public var userName: String?
    public var flag: String?
    public var googleImage: String?
    public var lastTimeStamp: String?
    public var deviceId: String?
    public var cardId: String?
    public var userEmail: String?
    public var loginLogout: String?
    public var status: String?
    public var rideTime: String?
    public var userPassword: String?
    public var rideType: String?
    public var rideId: String?
    public var referralCodeSend: String?
    public var reasonId: String?
    public var carTypeId: String?
    public var userId: String?
    public var dropLong: String?
    public var passwordCreated: String?
    public var facebookFirstname: String?
    public var freeRides: String?
    public var laterTime: String?
    public var facebookImage: String?
    public var tokenCreated: String?
    public var rating: String?
    public var googleName: String?
    public var rideDate: String?
    public var googleMail: String?
    public var rideStatus: String?
    public var rideImage: String?
    public var dropLocation: String?
    public var couponCode: String?
    public var userPhone: String?
    public var facebookMail: String?
    public var pickupLocation: String?
    public var dropLat: String?
    public var driverId: String?
    public var emailVerified: String?
    public var facebookId: String?
    public var registerDate: String?
    public var googleToken: String?
    public var facebookLastname: String?
    public var rideAdminStatus: String?
    public var phoneVerified: String?
    public var pickupLong: String?
    public var referralCode: String?
    
    
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
        pickupLat = json[kDetailsPickupLatKey].string
        laterDate = json[kDetailsLaterDateKey].string
        facebookToken = json[kDetailsFacebookTokenKey].string
        googleId = json[kDetailsGoogleIdKey].string
        paymentOptionId = json[kDetailsPaymentOptionIdKey].string
        userImage = json[kDetailsUserImageKey].string
        userName = json[kDetailsUserNameKey].string
        flag = json[kDetailsFlagKey].string
        googleImage = json[kDetailsGoogleImageKey].string
        lastTimeStamp = json[kDetailsLastTimeStampKey].string
        deviceId = json[kDetailsDeviceIdKey].string
        cardId = json[kDetailsCardIdKey].string
        userEmail = json[kDetailsUserEmailKey].string
        loginLogout = json[kDetailsLoginLogoutKey].string
        status = json[kDetailsStatusKey].string
        rideTime = json[kDetailsRideTimeKey].string
        userPassword = json[kDetailsUserPasswordKey].string
        rideType = json[kDetailsRideTypeKey].string
        rideId = json[kDetailsRideIdKey].string
        referralCodeSend = json[kDetailsReferralCodeSendKey].string
        reasonId = json[kDetailsReasonIdKey].string
        carTypeId = json[kDetailsCarTypeIdKey].string
        userId = json[kDetailsUserIdKey].string
        dropLong = json[kDetailsDropLongKey].string
        passwordCreated = json[kDetailsPasswordCreatedKey].string
        facebookFirstname = json[kDetailsFacebookFirstnameKey].string
        freeRides = json[kDetailsFreeRidesKey].string
        laterTime = json[kDetailsLaterTimeKey].string
        facebookImage = json[kDetailsFacebookImageKey].string
        tokenCreated = json[kDetailsTokenCreatedKey].string
        rating = json[kDetailsRatingKey].string
        googleName = json[kDetailsGoogleNameKey].string
        rideDate = json[kDetailsRideDateKey].string
        googleMail = json[kDetailsGoogleMailKey].string
        rideStatus = json[kDetailsRideStatusKey].string
        rideImage = json[kDetailsRideImageKey].string
        dropLocation = json[kDetailsDropLocationKey].string
        couponCode = json[kDetailsCouponCodeKey].string
        userPhone = json[kDetailsUserPhoneKey].string
        facebookMail = json[kDetailsFacebookMailKey].string
        pickupLocation = json[kDetailsPickupLocationKey].string
        dropLat = json[kDetailsDropLatKey].string
        driverId = json[kDetailsDriverIdKey].string
        emailVerified = json[kDetailsEmailVerifiedKey].string
        facebookId = json[kDetailsFacebookIdKey].string
        registerDate = json[kDetailsRegisterDateKey].string
        googleToken = json[kDetailsGoogleTokenKey].string
        facebookLastname = json[kDetailsFacebookLastnameKey].string
        rideAdminStatus = json[kDetailsRideAdminStatusKey].string
        phoneVerified = json[kDetailsPhoneVerifiedKey].string
        pickupLong = json[kDetailsPickupLongKey].string
        referralCode = json[kDetailsReferralCodeKey].string
        
    }
    
    
    /**
     Generates description of the object in the form of a NSDictionary.
     - returns: A Key value pair containing all valid values in the object.
     */
    public func dictionaryRepresentation() -> [String : AnyObject ] {
        
        var dictionary: [String : AnyObject ] = [ : ]
        if pickupLat != nil {
            dictionary.updateValue(pickupLat! as AnyObject, forKey: kDetailsPickupLatKey)
        }
        if laterDate != nil {
            dictionary.updateValue(laterDate! as AnyObject, forKey: kDetailsLaterDateKey)
        }
        if facebookToken != nil {
            dictionary.updateValue(facebookToken! as AnyObject, forKey: kDetailsFacebookTokenKey)
        }
        if googleId != nil {
            dictionary.updateValue(googleId! as AnyObject, forKey: kDetailsGoogleIdKey)
        }
        if paymentOptionId != nil {
            dictionary.updateValue(paymentOptionId! as AnyObject, forKey: kDetailsPaymentOptionIdKey)
        }
        if userImage != nil {
            dictionary.updateValue(userImage! as AnyObject, forKey: kDetailsUserImageKey)
        }
        if userName != nil {
            dictionary.updateValue(userName! as AnyObject, forKey: kDetailsUserNameKey)
        }
        if flag != nil {
            dictionary.updateValue(flag! as AnyObject, forKey: kDetailsFlagKey)
        }
        if googleImage != nil {
            dictionary.updateValue(googleImage! as AnyObject, forKey: kDetailsGoogleImageKey)
        }
        if lastTimeStamp != nil {
            dictionary.updateValue(lastTimeStamp! as AnyObject, forKey: kDetailsLastTimeStampKey)
        }
        if deviceId != nil {
            dictionary.updateValue(deviceId! as AnyObject, forKey: kDetailsDeviceIdKey)
        }
        if cardId != nil {
            dictionary.updateValue(cardId! as AnyObject, forKey: kDetailsCardIdKey)
        }
        if userEmail != nil {
            dictionary.updateValue(userEmail! as AnyObject, forKey: kDetailsUserEmailKey)
        }
        if loginLogout != nil {
            dictionary.updateValue(loginLogout! as AnyObject, forKey: kDetailsLoginLogoutKey)
        }
        if status != nil {
            dictionary.updateValue(status! as AnyObject, forKey: kDetailsStatusKey)
        }
        if rideTime != nil {
            dictionary.updateValue(rideTime! as AnyObject, forKey: kDetailsRideTimeKey)
        }
        if userPassword != nil {
            dictionary.updateValue(userPassword! as AnyObject, forKey: kDetailsUserPasswordKey)
        }
        if rideType != nil {
            dictionary.updateValue(rideType! as AnyObject, forKey: kDetailsRideTypeKey)
        }
        if rideId != nil {
            dictionary.updateValue(rideId! as AnyObject, forKey: kDetailsRideIdKey)
        }
        if referralCodeSend != nil {
            dictionary.updateValue(referralCodeSend! as AnyObject, forKey: kDetailsReferralCodeSendKey)
        }
        if reasonId != nil {
            dictionary.updateValue(reasonId! as AnyObject, forKey: kDetailsReasonIdKey)
        }
        if carTypeId != nil {
            dictionary.updateValue(carTypeId! as AnyObject, forKey: kDetailsCarTypeIdKey)
        }
        if userId != nil {
            dictionary.updateValue(userId! as AnyObject, forKey: kDetailsUserIdKey)
        }
        if dropLong != nil {
            dictionary.updateValue(dropLong! as AnyObject, forKey: kDetailsDropLongKey)
        }
        if passwordCreated != nil {
            dictionary.updateValue(passwordCreated! as AnyObject, forKey: kDetailsPasswordCreatedKey)
        }
        if facebookFirstname != nil {
            dictionary.updateValue(facebookFirstname! as AnyObject, forKey: kDetailsFacebookFirstnameKey)
        }
        if freeRides != nil {
            dictionary.updateValue(freeRides! as AnyObject, forKey: kDetailsFreeRidesKey)
        }
        if laterTime != nil {
            dictionary.updateValue(laterTime! as AnyObject, forKey: kDetailsLaterTimeKey)
        }
        if facebookImage != nil {
            dictionary.updateValue(facebookImage! as AnyObject, forKey: kDetailsFacebookImageKey)
        }
        if tokenCreated != nil {
            dictionary.updateValue(tokenCreated! as AnyObject, forKey: kDetailsTokenCreatedKey)
        }
        if rating != nil {
            dictionary.updateValue(rating! as AnyObject, forKey: kDetailsRatingKey)
        }
        if googleName != nil {
            dictionary.updateValue(googleName! as AnyObject, forKey: kDetailsGoogleNameKey)
        }
        if rideDate != nil {
            dictionary.updateValue(rideDate! as AnyObject, forKey: kDetailsRideDateKey)
        }
        if googleMail != nil {
            dictionary.updateValue(googleMail! as AnyObject, forKey: kDetailsGoogleMailKey)
        }
        if rideStatus != nil {
            dictionary.updateValue(rideStatus! as AnyObject, forKey: kDetailsRideStatusKey)
        }
        if rideImage != nil {
            dictionary.updateValue(rideImage! as AnyObject, forKey: kDetailsRideImageKey)
        }
        if dropLocation != nil {
            dictionary.updateValue(dropLocation! as AnyObject, forKey: kDetailsDropLocationKey)
        }
        if couponCode != nil {
            dictionary.updateValue(couponCode! as AnyObject, forKey: kDetailsCouponCodeKey)
        }
        if userPhone != nil {
            dictionary.updateValue(userPhone! as AnyObject, forKey: kDetailsUserPhoneKey)
        }
        if facebookMail != nil {
            dictionary.updateValue(facebookMail! as AnyObject, forKey: kDetailsFacebookMailKey)
        }
        if pickupLocation != nil {
            dictionary.updateValue(pickupLocation! as AnyObject, forKey: kDetailsPickupLocationKey)
        }
        if dropLat != nil {
            dictionary.updateValue(dropLat! as AnyObject, forKey: kDetailsDropLatKey)
        }
        if driverId != nil {
            dictionary.updateValue(driverId! as AnyObject, forKey: kDetailsDriverIdKey)
        }
        if emailVerified != nil {
            dictionary.updateValue(emailVerified! as AnyObject, forKey: kDetailsEmailVerifiedKey)
        }
        if facebookId != nil {
            dictionary.updateValue(facebookId! as AnyObject, forKey: kDetailsFacebookIdKey)
        }
        if registerDate != nil {
            dictionary.updateValue(registerDate! as AnyObject, forKey: kDetailsRegisterDateKey)
        }
        if googleToken != nil {
            dictionary.updateValue(googleToken! as AnyObject, forKey: kDetailsGoogleTokenKey)
        }
        if facebookLastname != nil {
            dictionary.updateValue(facebookLastname! as AnyObject, forKey: kDetailsFacebookLastnameKey)
        }
        if rideAdminStatus != nil {
            dictionary.updateValue(rideAdminStatus! as AnyObject, forKey: kDetailsRideAdminStatusKey)
        }
        if phoneVerified != nil {
            dictionary.updateValue(phoneVerified! as AnyObject, forKey: kDetailsPhoneVerifiedKey)
        }
        if pickupLong != nil {
            dictionary.updateValue(pickupLong! as AnyObject, forKey: kDetailsPickupLongKey)
        }
        if referralCode != nil {
            dictionary.updateValue(referralCode! as AnyObject, forKey: kDetailsReferralCodeKey)
        }
        
        return dictionary
    }
    
}


