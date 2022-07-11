//
//  NormalRide.swift
//
//  Created by AppOrio on 04/07/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class NormalRide: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kNormalRideReferralCodeKey: String = "referral_code"
	internal let kNormalRideLaterDateKey: String = "later_date"
	internal let kNormalRideFacebookTokenKey: String = "facebook_token"
	internal let kNormalRideGoogleIdKey: String = "google_id"
	internal let kNormalRidePaymentOptionIdKey: String = "payment_option_id"
	internal let kNormalRideUserImageKey: String = "user_image"
	internal let kNormalRideUserNameKey: String = "user_name"
	internal let kNormalRideFlagKey: String = "flag"
	internal let kNormalRideGoogleImageKey: String = "google_image"
	internal let kNormalRideLastTimeStampKey: String = "last_time_stamp"
	internal let kNormalRideDeviceIdKey: String = "device_id"
	internal let kNormalRideCardIdKey: String = "card_id"
	internal let kNormalRideCarNameArabicKey: String = "car_name_arabic"
	internal let kNormalRideLoginLogoutKey: String = "login_logout"
	internal let kNormalRideUserEmailKey: String = "user_email"
	internal let kNormalRideStatusKey: String = "status"
	internal let kNormalRideRideTimeKey: String = "ride_time"
	internal let kNormalRideUserPasswordKey: String = "user_password"
	internal let kNormalRideTotalAmountKey: String = "total_amount"
	internal let kNormalRideCarTypeImageKey: String = "car_type_image"
	internal let kNormalRideRideTypeKey: String = "ride_type"
	internal let kNormalRideRideIdKey: String = "ride_id"
	internal let kNormalRideRideModeKey: String = "ride_mode"
	internal let kNormalRideCarTypeNameFrenchKey: String = "car_type_name_french"
	internal let kNormalRideReferralCodeSendKey: String = "referral_code_send"
	internal let kNormalRideReasonIdKey: String = "reason_id"
	internal let kNormalRideCarTypeIdKey: String = "car_type_id"
	internal let kNormalRideUserIdKey: String = "user_id"
	internal let kNormalRideDropLongKey: String = "drop_long"
	internal let kNormalRidePasswordCreatedKey: String = "password_created"
	internal let kNormalRideFacebookFirstnameKey: String = "facebook_firstname"
	internal let kNormalRideFreeRidesKey: String = "free_rides"
	internal let kNormalRideLaterTimeKey: String = "later_time"
	internal let kNormalRideFacebookImageKey: String = "facebook_image"
	internal let kNormalRideRatingKey: String = "rating"
	internal let kNormalRideTokenCreatedKey: String = "token_created"
	internal let kNormalRideGoogleMailKey: String = "google_mail"
	internal let kNormalRideGoogleNameKey: String = "google_name"
	internal let kNormalRideRideDateKey: String = "ride_date"
	internal let kNormalRideRideStatusKey: String = "ride_status"
	internal let kNormalRideRideImageKey: String = "ride_image"
	internal let kNormalRideDropLocationKey: String = "drop_location"
	internal let kNormalRideCouponCodeKey: String = "coupon_code"
	internal let kNormalRideUserPhoneKey: String = "user_phone"
	internal let kNormalRideCarTypeNameKey: String = "car_type_name"
	internal let kNormalRideFacebookMailKey: String = "facebook_mail"
	internal let kNormalRidePickupLocationKey: String = "pickup_location"
	internal let kNormalRideDropLatKey: String = "drop_lat"
	internal let kNormalRideDriverIdKey: String = "driver_id"
	internal let kNormalRideEmailVerifiedKey: String = "email_verified"
	internal let kNormalRideFacebookIdKey: String = "facebook_id"
	internal let kNormalRideGoogleTokenKey: String = "google_token"
	internal let kNormalRideRegisterDateKey: String = "register_date"
	internal let kNormalRideCarAdminStatusKey: String = "car_admin_status"
	internal let kNormalRideFacebookLastnameKey: String = "facebook_lastname"
	internal let kNormalRidePickupLatKey: String = "pickup_lat"
	internal let kNormalRidePhoneVerifiedKey: String = "phone_verified"
	internal let kNormalRideRideAdminStatusKey: String = "ride_admin_status"
	internal let kNormalRidePickupLongKey: String = "pickup_long"


    // MARK: Properties
	public var referralCode: String?
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
	public var carNameArabic: String?
	public var loginLogout: String?
	public var userEmail: String?
	public var status: String?
	public var rideTime: String?
	public var userPassword: String?
	public var totalAmount: String?
	public var carTypeImage: String?
	public var rideType: String?
	public var rideId: String?
	public var rideMode: String?
	public var carTypeNameFrench: String?
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
	public var rating: String?
	public var tokenCreated: String?
	public var googleMail: String?
	public var googleName: String?
	public var rideDate: String?
	public var rideStatus: String?
	public var rideImage: String?
	public var dropLocation: String?
	public var couponCode: String?
	public var userPhone: String?
	public var carTypeName: String?
	public var facebookMail: String?
	public var pickupLocation: String?
	public var dropLat: String?
	public var driverId: String?
	public var emailVerified: String?
	public var facebookId: String?
	public var googleToken: String?
	public var registerDate: String?
	public var carAdminStatus: String?
	public var facebookLastname: String?
	public var pickupLat: String?
	public var phoneVerified: String?
	public var rideAdminStatus: String?
	public var pickupLong: String?


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
		referralCode = json[kNormalRideReferralCodeKey].string
		laterDate = json[kNormalRideLaterDateKey].string
		facebookToken = json[kNormalRideFacebookTokenKey].string
		googleId = json[kNormalRideGoogleIdKey].string
		paymentOptionId = json[kNormalRidePaymentOptionIdKey].string
		userImage = json[kNormalRideUserImageKey].string
		userName = json[kNormalRideUserNameKey].string
		flag = json[kNormalRideFlagKey].string
		googleImage = json[kNormalRideGoogleImageKey].string
		lastTimeStamp = json[kNormalRideLastTimeStampKey].string
		deviceId = json[kNormalRideDeviceIdKey].string
		cardId = json[kNormalRideCardIdKey].string
		carNameArabic = json[kNormalRideCarNameArabicKey].string
		loginLogout = json[kNormalRideLoginLogoutKey].string
		userEmail = json[kNormalRideUserEmailKey].string
		status = json[kNormalRideStatusKey].string
		rideTime = json[kNormalRideRideTimeKey].string
		userPassword = json[kNormalRideUserPasswordKey].string
		totalAmount = json[kNormalRideTotalAmountKey].string
		carTypeImage = json[kNormalRideCarTypeImageKey].string
		rideType = json[kNormalRideRideTypeKey].string
		rideId = json[kNormalRideRideIdKey].string
		rideMode = json[kNormalRideRideModeKey].string
		carTypeNameFrench = json[kNormalRideCarTypeNameFrenchKey].string
		referralCodeSend = json[kNormalRideReferralCodeSendKey].string
		reasonId = json[kNormalRideReasonIdKey].string
		carTypeId = json[kNormalRideCarTypeIdKey].string
		userId = json[kNormalRideUserIdKey].string
		dropLong = json[kNormalRideDropLongKey].string
		passwordCreated = json[kNormalRidePasswordCreatedKey].string
		facebookFirstname = json[kNormalRideFacebookFirstnameKey].string
		freeRides = json[kNormalRideFreeRidesKey].string
		laterTime = json[kNormalRideLaterTimeKey].string
		facebookImage = json[kNormalRideFacebookImageKey].string
		rating = json[kNormalRideRatingKey].string
		tokenCreated = json[kNormalRideTokenCreatedKey].string
		googleMail = json[kNormalRideGoogleMailKey].string
		googleName = json[kNormalRideGoogleNameKey].string
		rideDate = json[kNormalRideRideDateKey].string
		rideStatus = json[kNormalRideRideStatusKey].string
		rideImage = json[kNormalRideRideImageKey].string
		dropLocation = json[kNormalRideDropLocationKey].string
		couponCode = json[kNormalRideCouponCodeKey].string
		userPhone = json[kNormalRideUserPhoneKey].string
		carTypeName = json[kNormalRideCarTypeNameKey].string
		facebookMail = json[kNormalRideFacebookMailKey].string
		pickupLocation = json[kNormalRidePickupLocationKey].string
		dropLat = json[kNormalRideDropLatKey].string
		driverId = json[kNormalRideDriverIdKey].string
		emailVerified = json[kNormalRideEmailVerifiedKey].string
		facebookId = json[kNormalRideFacebookIdKey].string
		googleToken = json[kNormalRideGoogleTokenKey].string
		registerDate = json[kNormalRideRegisterDateKey].string
		carAdminStatus = json[kNormalRideCarAdminStatusKey].string
		facebookLastname = json[kNormalRideFacebookLastnameKey].string
		pickupLat = json[kNormalRidePickupLatKey].string
		phoneVerified = json[kNormalRidePhoneVerifiedKey].string
		rideAdminStatus = json[kNormalRideRideAdminStatusKey].string
		pickupLong = json[kNormalRidePickupLongKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if referralCode != nil {
			dictionary.updateValue(referralCode! as AnyObject, forKey: kNormalRideReferralCodeKey)
		}
		if laterDate != nil {
			dictionary.updateValue(laterDate! as AnyObject, forKey: kNormalRideLaterDateKey)
		}
		if facebookToken != nil {
			dictionary.updateValue(facebookToken! as AnyObject, forKey: kNormalRideFacebookTokenKey)
		}
		if googleId != nil {
			dictionary.updateValue(googleId! as AnyObject, forKey: kNormalRideGoogleIdKey)
		}
		if paymentOptionId != nil {
			dictionary.updateValue(paymentOptionId! as AnyObject, forKey: kNormalRidePaymentOptionIdKey)
		}
		if userImage != nil {
			dictionary.updateValue(userImage! as AnyObject, forKey: kNormalRideUserImageKey)
		}
		if userName != nil {
			dictionary.updateValue(userName! as AnyObject, forKey: kNormalRideUserNameKey)
		}
		if flag != nil {
			dictionary.updateValue(flag! as AnyObject, forKey: kNormalRideFlagKey)
		}
		if googleImage != nil {
			dictionary.updateValue(googleImage! as AnyObject, forKey: kNormalRideGoogleImageKey)
		}
		if lastTimeStamp != nil {
			dictionary.updateValue(lastTimeStamp! as AnyObject, forKey: kNormalRideLastTimeStampKey)
		}
		if deviceId != nil {
			dictionary.updateValue(deviceId! as AnyObject, forKey: kNormalRideDeviceIdKey)
		}
		if cardId != nil {
			dictionary.updateValue(cardId! as AnyObject, forKey: kNormalRideCardIdKey)
		}
		if carNameArabic != nil {
			dictionary.updateValue(carNameArabic! as AnyObject, forKey: kNormalRideCarNameArabicKey)
		}
		if loginLogout != nil {
			dictionary.updateValue(loginLogout! as AnyObject, forKey: kNormalRideLoginLogoutKey)
		}
		if userEmail != nil {
			dictionary.updateValue(userEmail! as AnyObject, forKey: kNormalRideUserEmailKey)
		}
		if status != nil {
			dictionary.updateValue(status! as AnyObject, forKey: kNormalRideStatusKey)
		}
		if rideTime != nil {
			dictionary.updateValue(rideTime! as AnyObject, forKey: kNormalRideRideTimeKey)
		}
		if userPassword != nil {
			dictionary.updateValue(userPassword! as AnyObject, forKey: kNormalRideUserPasswordKey)
		}
		if totalAmount != nil {
			dictionary.updateValue(totalAmount! as AnyObject, forKey: kNormalRideTotalAmountKey)
		}
		if carTypeImage != nil {
			dictionary.updateValue(carTypeImage! as AnyObject, forKey: kNormalRideCarTypeImageKey)
		}
		if rideType != nil {
			dictionary.updateValue(rideType! as AnyObject, forKey: kNormalRideRideTypeKey)
		}
		if rideId != nil {
			dictionary.updateValue(rideId! as AnyObject, forKey: kNormalRideRideIdKey)
		}
		if rideMode != nil {
			dictionary.updateValue(rideMode! as AnyObject, forKey: kNormalRideRideModeKey)
		}
		if carTypeNameFrench != nil {
			dictionary.updateValue(carTypeNameFrench! as AnyObject, forKey: kNormalRideCarTypeNameFrenchKey)
		}
		if referralCodeSend != nil {
			dictionary.updateValue(referralCodeSend! as AnyObject, forKey: kNormalRideReferralCodeSendKey)
		}
		if reasonId != nil {
			dictionary.updateValue(reasonId! as AnyObject, forKey: kNormalRideReasonIdKey)
		}
		if carTypeId != nil {
			dictionary.updateValue(carTypeId! as AnyObject, forKey: kNormalRideCarTypeIdKey)
		}
		if userId != nil {
			dictionary.updateValue(userId! as AnyObject, forKey: kNormalRideUserIdKey)
		}
		if dropLong != nil {
			dictionary.updateValue(dropLong! as AnyObject, forKey: kNormalRideDropLongKey)
		}
		if passwordCreated != nil {
			dictionary.updateValue(passwordCreated! as AnyObject, forKey: kNormalRidePasswordCreatedKey)
		}
		if facebookFirstname != nil {
			dictionary.updateValue(facebookFirstname! as AnyObject, forKey: kNormalRideFacebookFirstnameKey)
		}
		if freeRides != nil {
			dictionary.updateValue(freeRides! as AnyObject, forKey: kNormalRideFreeRidesKey)
		}
		if laterTime != nil {
			dictionary.updateValue(laterTime! as AnyObject, forKey: kNormalRideLaterTimeKey)
		}
		if facebookImage != nil {
			dictionary.updateValue(facebookImage! as AnyObject, forKey: kNormalRideFacebookImageKey)
		}
		if rating != nil {
			dictionary.updateValue(rating! as AnyObject, forKey: kNormalRideRatingKey)
		}
		if tokenCreated != nil {
			dictionary.updateValue(tokenCreated! as AnyObject, forKey: kNormalRideTokenCreatedKey)
		}
		if googleMail != nil {
			dictionary.updateValue(googleMail! as AnyObject, forKey: kNormalRideGoogleMailKey)
		}
		if googleName != nil {
			dictionary.updateValue(googleName! as AnyObject, forKey: kNormalRideGoogleNameKey)
		}
		if rideDate != nil {
			dictionary.updateValue(rideDate! as AnyObject, forKey: kNormalRideRideDateKey)
		}
		if rideStatus != nil {
			dictionary.updateValue(rideStatus! as AnyObject, forKey: kNormalRideRideStatusKey)
		}
		if rideImage != nil {
			dictionary.updateValue(rideImage! as AnyObject, forKey: kNormalRideRideImageKey)
		}
		if dropLocation != nil {
			dictionary.updateValue(dropLocation! as AnyObject, forKey: kNormalRideDropLocationKey)
		}
		if couponCode != nil {
			dictionary.updateValue(couponCode! as AnyObject, forKey: kNormalRideCouponCodeKey)
		}
		if userPhone != nil {
			dictionary.updateValue(userPhone! as AnyObject, forKey: kNormalRideUserPhoneKey)
		}
		if carTypeName != nil {
			dictionary.updateValue(carTypeName! as AnyObject, forKey: kNormalRideCarTypeNameKey)
		}
		if facebookMail != nil {
			dictionary.updateValue(facebookMail! as AnyObject, forKey: kNormalRideFacebookMailKey)
		}
		if pickupLocation != nil {
			dictionary.updateValue(pickupLocation! as AnyObject, forKey: kNormalRidePickupLocationKey)
		}
		if dropLat != nil {
			dictionary.updateValue(dropLat! as AnyObject, forKey: kNormalRideDropLatKey)
		}
		if driverId != nil {
			dictionary.updateValue(driverId! as AnyObject, forKey: kNormalRideDriverIdKey)
		}
		if emailVerified != nil {
			dictionary.updateValue(emailVerified! as AnyObject, forKey: kNormalRideEmailVerifiedKey)
		}
		if facebookId != nil {
			dictionary.updateValue(facebookId! as AnyObject, forKey: kNormalRideFacebookIdKey)
		}
		if googleToken != nil {
			dictionary.updateValue(googleToken! as AnyObject, forKey: kNormalRideGoogleTokenKey)
		}
		if registerDate != nil {
			dictionary.updateValue(registerDate! as AnyObject, forKey: kNormalRideRegisterDateKey)
		}
		if carAdminStatus != nil {
			dictionary.updateValue(carAdminStatus! as AnyObject, forKey: kNormalRideCarAdminStatusKey)
		}
		if facebookLastname != nil {
			dictionary.updateValue(facebookLastname! as AnyObject, forKey: kNormalRideFacebookLastnameKey)
		}
		if pickupLat != nil {
			dictionary.updateValue(pickupLat! as AnyObject, forKey: kNormalRidePickupLatKey)
		}
		if phoneVerified != nil {
			dictionary.updateValue(phoneVerified! as AnyObject, forKey: kNormalRidePhoneVerifiedKey)
		}
		if rideAdminStatus != nil {
			dictionary.updateValue(rideAdminStatus! as AnyObject, forKey: kNormalRideRideAdminStatusKey)
		}
		if pickupLong != nil {
			dictionary.updateValue(pickupLong! as AnyObject, forKey: kNormalRidePickupLongKey)
		}

        return dictionary
    }

}
