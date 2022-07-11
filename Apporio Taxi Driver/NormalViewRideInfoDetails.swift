//
//  Details.swift
//
//  Created by AppOrio on 04/07/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class NormalViewRideInfoDetails: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kDetailsReferralCodeKey: String = "referral_code"
	internal let kDetailsLaterDateKey: String = "later_date"
	internal let kDetailsDriverRatingKey: String = "driver_rating"
	internal let kDetailsPaymentStatusKey: String = "payment_status"
	internal let kDetailsFacebookTokenKey: String = "facebook_token"
	internal let kDetailsTimeKey: String = "time"
	internal let kDetailsGoogleIdKey: String = "google_id"
	internal let kDetailsPaymentOptionIdKey: String = "payment_option_id"
	internal let kDetailsLastTimeStampKey: String = "last_time_stamp"
	internal let kDetailsUserImageKey: String = "user_image"
	internal let kDetailsFlagKey: String = "flag"
	internal let kDetailsDistanceKey: String = "distance"
	internal let kDetailsDriverNameKey: String = "driver_name"
	internal let kDetailsGoogleImageKey: String = "google_image"
	internal let kDetailsDeviceIdKey: String = "device_id"
	internal let kDetailsCardIdKey: String = "card_id"
	internal let kDetailsCarNameArabicKey: String = "car_name_arabic"
	internal let kDetailsUserNameKey: String = "user_name"
	internal let kDetailsLoginLogoutKey: String = "login_logout"
	internal let kDetailsUserEmailKey: String = "user_email"
	internal let kDetailsAmountKey: String = "amount"
	internal let kDetailsStatusKey: String = "status"
	internal let kDetailsRideTimeKey: String = "ride_time"
	internal let kDetailsUserPasswordKey: String = "user_password"
	internal let kDetailsTotalAmountKey: String = "total_amount"
	internal let kDetailsCarTypeImageKey: String = "car_type_image"
	internal let kDetailsBeginTimeKey: String = "begin_time"
	internal let kDetailsRideTypeKey: String = "ride_type"
	internal let kDetailsRideIdKey: String = "ride_id"
	internal let kDetailsWaitingTimeKey: String = "waiting_time"
	internal let kDetailsCoupanPriceKey: String = "coupan_price"
	internal let kDetailsRideModeKey: String = "ride_mode"
	internal let kDetailsCarNumberKey: String = "car_number"
	internal let kDetailsCarTypeNameFrenchKey: String = "car_type_name_french"
	internal let kDetailsReferralCodeSendKey: String = "referral_code_send"
	internal let kDetailsDriverPhoneKey: String = "driver_phone"
	internal let kDetailsReasonIdKey: String = "reason_id"
	internal let kDetailsCarTypeIdKey: String = "car_type_id"
	internal let kDetailsUserIdKey: String = "user_id"
	internal let kDetailsWaitingPriceKey: String = "waiting_price"
	internal let kDetailsDropLongKey: String = "drop_long"
	internal let kDetailsPasswordCreatedKey: String = "password_created"
	internal let kDetailsFacebookFirstnameKey: String = "facebook_firstname"
	internal let kDetailsFreeRidesKey: String = "free_rides"
	internal let kDetailsLaterTimeKey: String = "later_time"
	internal let kDetailsFacebookImageKey: String = "facebook_image"
	internal let kDetailsRatingKey: String = "rating"
	internal let kDetailsTokenCreatedKey: String = "token_created"
	internal let kDetailsDriverImageKey: String = "driver_image"
	internal let kDetailsGoogleMailKey: String = "google_mail"
	internal let kDetailsGoogleNameKey: String = "google_name"
	internal let kDetailsRideDateKey: String = "ride_date"
	internal let kDetailsArrivedTimeKey: String = "arrived_time"
	internal let kDetailsRideStatusKey: String = "ride_status"
	internal let kDetailsRideImageKey: String = "ride_image"
	internal let kDetailsDropLocationKey: String = "drop_location"
	internal let kDetailsCouponCodeKey: String = "coupon_code"
	internal let kDetailsUserPhoneKey: String = "user_phone"
	internal let kDetailsCarTypeNameKey: String = "car_type_name"
	internal let kDetailsFacebookMailKey: String = "facebook_mail"
	internal let kDetailsPickupLocationKey: String = "pickup_location"
	internal let kDetailsDriverLocationKey: String = "driver_location"
	internal let kDetailsDoneRideTimeKey: String = "done_ride_time"
	internal let kDetailsDropLatKey: String = "drop_lat"
	internal let kDetailsDriverIdKey: String = "driver_id"
	internal let kDetailsRideTimePriceKey: String = "ride_time_price"
	internal let kDetailsEmailVerifiedKey: String = "email_verified"
	internal let kDetailsFacebookIdKey: String = "facebook_id"
	internal let kDetailsRegisterDateKey: String = "register_date"
	internal let kDetailsCarAdminStatusKey: String = "car_admin_status"
	internal let kDetailsEndTimeKey: String = "end_time"
	internal let kDetailsFacebookLastnameKey: String = "facebook_lastname"
	internal let kDetailsGoogleTokenKey: String = "google_token"
	internal let kDetailsDriverLatKey: String = "driver_lat"
	internal let kDetailsDriverLongKey: String = "driver_long"
	internal let kDetailsPickupLatKey: String = "pickup_lat"
	internal let kDetailsPhoneVerifiedKey: String = "phone_verified"
	internal let kDetailsRideAdminStatusKey: String = "ride_admin_status"
	internal let kDetailsPickupLongKey: String = "pickup_long"
    internal let kDetailsPaymentName: String = "payment_option_name"
    internal let kMsgPeakTimeCharge: String = "peak_time_charge"
    internal let kMsgNighTimeCharges: String = "night_time_charge"
    internal let kDetailsUserratingstar: String = "user_rating_star"
    internal let kDetailsDriverratingstar: String = "driver_rating_star"
    



    // MARK: Properties
	public var referralCode: String?
	public var laterDate: String?
	public var driverRating: String?
	public var paymentStatus: String?
	public var facebookToken: String?
	public var time: String?
	public var googleId: String?
	public var paymentOptionId: String?
	public var lastTimeStamp: String?
	public var userImage: String?
	public var flag: String?
	public var distance: String?
	public var driverName: String?
	public var googleImage: String?
	public var deviceId: String?
	public var cardId: String?
	public var carNameArabic: String?
	public var userName: String?
	public var loginLogout: String?
	public var userEmail: String?
	public var amount: String?
	public var status: String?
	public var rideTime: String?
	public var userPassword: String?
	public var totalAmount: String?
	public var carTypeImage: String?
	public var beginTime: String?
	public var rideType: String?
	public var rideId: String?
	public var waitingTime: String?
	public var coupanPrice: String?
	public var rideMode: String?
	public var carNumber: String?
	public var carTypeNameFrench: String?
	public var referralCodeSend: String?
	public var driverPhone: String?
	public var reasonId: String?
	public var carTypeId: String?
	public var userId: String?
	public var waitingPrice: String?
	public var dropLong: String?
	public var passwordCreated: String?
	public var facebookFirstname: String?
	public var freeRides: String?
	public var laterTime: String?
	public var facebookImage: String?
	public var rating: String?
	public var tokenCreated: String?
	public var driverImage: String?
	public var googleMail: String?
	public var googleName: String?
	public var rideDate: String?
	public var arrivedTime: String?
	public var rideStatus: String?
	public var rideImage: String?
	public var dropLocation: String?
	public var couponCode: String?
	public var userPhone: String?
	public var carTypeName: String?
	public var facebookMail: String?
	public var pickupLocation: String?
	public var driverLocation: String?
	public var doneRideTime: String?
	public var dropLat: String?
	public var driverId: String?
	public var rideTimePrice: String?
	public var emailVerified: String?
	public var facebookId: String?
	public var registerDate: String?
	public var carAdminStatus: String?
	public var endTime: String?
	public var facebookLastname: String?
	public var googleToken: String?
	public var driverLat: String?
	public var driverLong: String?
	public var pickupLat: String?
	public var phoneVerified: String?
	public var rideAdminStatus: String?
	public var pickupLong: String?
    public var paymentname: String?
    public var peaktimecharges: String?
    public var nighttimecharges: String?
    public var userratingstar: String?
    public var driverratingstar: String?

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
		referralCode = json[kDetailsReferralCodeKey].string
		laterDate = json[kDetailsLaterDateKey].string
		driverRating = json[kDetailsDriverRatingKey].string
		paymentStatus = json[kDetailsPaymentStatusKey].string
		facebookToken = json[kDetailsFacebookTokenKey].string
		time = json[kDetailsTimeKey].string
		googleId = json[kDetailsGoogleIdKey].string
		paymentOptionId = json[kDetailsPaymentOptionIdKey].string
		lastTimeStamp = json[kDetailsLastTimeStampKey].string
		userImage = json[kDetailsUserImageKey].string
		flag = json[kDetailsFlagKey].string
		distance = json[kDetailsDistanceKey].string
		driverName = json[kDetailsDriverNameKey].string
		googleImage = json[kDetailsGoogleImageKey].string
		deviceId = json[kDetailsDeviceIdKey].string
		cardId = json[kDetailsCardIdKey].string
		carNameArabic = json[kDetailsCarNameArabicKey].string
		userName = json[kDetailsUserNameKey].string
		loginLogout = json[kDetailsLoginLogoutKey].string
		userEmail = json[kDetailsUserEmailKey].string
		amount = json[kDetailsAmountKey].string
		status = json[kDetailsStatusKey].string
		rideTime = json[kDetailsRideTimeKey].string
		userPassword = json[kDetailsUserPasswordKey].string
		totalAmount = json[kDetailsTotalAmountKey].string
		carTypeImage = json[kDetailsCarTypeImageKey].string
		beginTime = json[kDetailsBeginTimeKey].string
		rideType = json[kDetailsRideTypeKey].string
		rideId = json[kDetailsRideIdKey].string
		waitingTime = json[kDetailsWaitingTimeKey].string
		coupanPrice = json[kDetailsCoupanPriceKey].string
		rideMode = json[kDetailsRideModeKey].string
		carNumber = json[kDetailsCarNumberKey].string
		carTypeNameFrench = json[kDetailsCarTypeNameFrenchKey].string
		referralCodeSend = json[kDetailsReferralCodeSendKey].string
		driverPhone = json[kDetailsDriverPhoneKey].string
		reasonId = json[kDetailsReasonIdKey].string
		carTypeId = json[kDetailsCarTypeIdKey].string
		userId = json[kDetailsUserIdKey].string
		waitingPrice = json[kDetailsWaitingPriceKey].string
		dropLong = json[kDetailsDropLongKey].string
		passwordCreated = json[kDetailsPasswordCreatedKey].string
		facebookFirstname = json[kDetailsFacebookFirstnameKey].string
		freeRides = json[kDetailsFreeRidesKey].string
		laterTime = json[kDetailsLaterTimeKey].string
		facebookImage = json[kDetailsFacebookImageKey].string
		rating = json[kDetailsRatingKey].string
		tokenCreated = json[kDetailsTokenCreatedKey].string
		driverImage = json[kDetailsDriverImageKey].string
		googleMail = json[kDetailsGoogleMailKey].string
		googleName = json[kDetailsGoogleNameKey].string
		rideDate = json[kDetailsRideDateKey].string
		arrivedTime = json[kDetailsArrivedTimeKey].string
		rideStatus = json[kDetailsRideStatusKey].string
		rideImage = json[kDetailsRideImageKey].string
		dropLocation = json[kDetailsDropLocationKey].string
		couponCode = json[kDetailsCouponCodeKey].string
		userPhone = json[kDetailsUserPhoneKey].string
		carTypeName = json[kDetailsCarTypeNameKey].string
		facebookMail = json[kDetailsFacebookMailKey].string
		pickupLocation = json[kDetailsPickupLocationKey].string
		driverLocation = json[kDetailsDriverLocationKey].string
		doneRideTime = json[kDetailsDoneRideTimeKey].string
		dropLat = json[kDetailsDropLatKey].string
		driverId = json[kDetailsDriverIdKey].string
		rideTimePrice = json[kDetailsRideTimePriceKey].string
		emailVerified = json[kDetailsEmailVerifiedKey].string
		facebookId = json[kDetailsFacebookIdKey].string
		registerDate = json[kDetailsRegisterDateKey].string
		carAdminStatus = json[kDetailsCarAdminStatusKey].string
		endTime = json[kDetailsEndTimeKey].string
		facebookLastname = json[kDetailsFacebookLastnameKey].string
		googleToken = json[kDetailsGoogleTokenKey].string
		driverLat = json[kDetailsDriverLatKey].string
		driverLong = json[kDetailsDriverLongKey].string
		pickupLat = json[kDetailsPickupLatKey].string
		phoneVerified = json[kDetailsPhoneVerifiedKey].string
		rideAdminStatus = json[kDetailsRideAdminStatusKey].string
		pickupLong = json[kDetailsPickupLongKey].string
         paymentname = json[kDetailsPaymentName].string
        peaktimecharges = json[kMsgPeakTimeCharge].string
        nighttimecharges = json[kMsgNighTimeCharges].string
        userratingstar = json[kDetailsUserratingstar].string
        driverratingstar = json[kDetailsDriverratingstar].string


    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if referralCode != nil {
			dictionary.updateValue(referralCode! as AnyObject, forKey: kDetailsReferralCodeKey)
		}
		if laterDate != nil {
			dictionary.updateValue(laterDate! as AnyObject, forKey: kDetailsLaterDateKey)
		}
		if driverRating != nil {
			dictionary.updateValue(driverRating! as AnyObject, forKey: kDetailsDriverRatingKey)
		}
		if paymentStatus != nil {
			dictionary.updateValue(paymentStatus! as AnyObject, forKey: kDetailsPaymentStatusKey)
		}
		if facebookToken != nil {
			dictionary.updateValue(facebookToken! as AnyObject, forKey: kDetailsFacebookTokenKey)
		}
		if time != nil {
			dictionary.updateValue(time! as AnyObject, forKey: kDetailsTimeKey)
		}
		if googleId != nil {
			dictionary.updateValue(googleId! as AnyObject, forKey: kDetailsGoogleIdKey)
		}
		if paymentOptionId != nil {
			dictionary.updateValue(paymentOptionId! as AnyObject, forKey: kDetailsPaymentOptionIdKey)
		}
		if lastTimeStamp != nil {
			dictionary.updateValue(lastTimeStamp! as AnyObject, forKey: kDetailsLastTimeStampKey)
		}
		if userImage != nil {
			dictionary.updateValue(userImage! as AnyObject, forKey: kDetailsUserImageKey)
		}
		if flag != nil {
			dictionary.updateValue(flag! as AnyObject, forKey: kDetailsFlagKey)
		}
		if distance != nil {
			dictionary.updateValue(distance! as AnyObject, forKey: kDetailsDistanceKey)
		}
		if driverName != nil {
			dictionary.updateValue(driverName! as AnyObject, forKey: kDetailsDriverNameKey)
		}
		if googleImage != nil {
			dictionary.updateValue(googleImage! as AnyObject, forKey: kDetailsGoogleImageKey)
		}
		if deviceId != nil {
			dictionary.updateValue(deviceId! as AnyObject, forKey: kDetailsDeviceIdKey)
		}
		if cardId != nil {
			dictionary.updateValue(cardId! as AnyObject, forKey: kDetailsCardIdKey)
		}
		if carNameArabic != nil {
			dictionary.updateValue(carNameArabic! as AnyObject, forKey: kDetailsCarNameArabicKey)
		}
		if userName != nil {
			dictionary.updateValue(userName! as AnyObject, forKey: kDetailsUserNameKey)
		}
		if loginLogout != nil {
			dictionary.updateValue(loginLogout! as AnyObject, forKey: kDetailsLoginLogoutKey)
		}
		if userEmail != nil {
			dictionary.updateValue(userEmail! as AnyObject, forKey: kDetailsUserEmailKey)
		}
		if amount != nil {
			dictionary.updateValue(amount! as AnyObject, forKey: kDetailsAmountKey)
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
		if totalAmount != nil {
			dictionary.updateValue(totalAmount! as AnyObject, forKey: kDetailsTotalAmountKey)
		}
		if carTypeImage != nil {
			dictionary.updateValue(carTypeImage! as AnyObject, forKey: kDetailsCarTypeImageKey)
		}
		if beginTime != nil {
			dictionary.updateValue(beginTime! as AnyObject, forKey: kDetailsBeginTimeKey)
		}
		if rideType != nil {
			dictionary.updateValue(rideType! as AnyObject, forKey: kDetailsRideTypeKey)
		}
		if rideId != nil {
			dictionary.updateValue(rideId! as AnyObject, forKey: kDetailsRideIdKey)
		}
		if waitingTime != nil {
			dictionary.updateValue(waitingTime! as AnyObject, forKey: kDetailsWaitingTimeKey)
		}
		if coupanPrice != nil {
			dictionary.updateValue(coupanPrice! as AnyObject, forKey: kDetailsCoupanPriceKey)
		}
		if rideMode != nil {
			dictionary.updateValue(rideMode! as AnyObject, forKey: kDetailsRideModeKey)
		}
		if carNumber != nil {
			dictionary.updateValue(carNumber! as AnyObject, forKey: kDetailsCarNumberKey)
		}
		if carTypeNameFrench != nil {
			dictionary.updateValue(carTypeNameFrench! as AnyObject, forKey: kDetailsCarTypeNameFrenchKey)
		}
		if referralCodeSend != nil {
			dictionary.updateValue(referralCodeSend! as AnyObject, forKey: kDetailsReferralCodeSendKey)
		}
		if driverPhone != nil {
			dictionary.updateValue(driverPhone! as AnyObject, forKey: kDetailsDriverPhoneKey)
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
		if waitingPrice != nil {
			dictionary.updateValue(waitingPrice! as AnyObject, forKey: kDetailsWaitingPriceKey)
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
		if rating != nil {
			dictionary.updateValue(rating! as AnyObject, forKey: kDetailsRatingKey)
		}
		if tokenCreated != nil {
			dictionary.updateValue(tokenCreated! as AnyObject, forKey: kDetailsTokenCreatedKey)
		}
		if driverImage != nil {
			dictionary.updateValue(driverImage! as AnyObject, forKey: kDetailsDriverImageKey)
		}
		if googleMail != nil {
			dictionary.updateValue(googleMail! as AnyObject, forKey: kDetailsGoogleMailKey)
		}
		if googleName != nil {
			dictionary.updateValue(googleName! as AnyObject, forKey: kDetailsGoogleNameKey)
		}
		if rideDate != nil {
			dictionary.updateValue(rideDate! as AnyObject, forKey: kDetailsRideDateKey)
		}
		if arrivedTime != nil {
			dictionary.updateValue(arrivedTime! as AnyObject, forKey: kDetailsArrivedTimeKey)
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
		if carTypeName != nil {
			dictionary.updateValue(carTypeName! as AnyObject, forKey: kDetailsCarTypeNameKey)
		}
		if facebookMail != nil {
			dictionary.updateValue(facebookMail! as AnyObject, forKey: kDetailsFacebookMailKey)
		}
		if pickupLocation != nil {
			dictionary.updateValue(pickupLocation! as AnyObject, forKey: kDetailsPickupLocationKey)
		}
		if driverLocation != nil {
			dictionary.updateValue(driverLocation! as AnyObject, forKey: kDetailsDriverLocationKey)
		}
		if doneRideTime != nil {
			dictionary.updateValue(doneRideTime! as AnyObject, forKey: kDetailsDoneRideTimeKey)
		}
		if dropLat != nil {
			dictionary.updateValue(dropLat! as AnyObject, forKey: kDetailsDropLatKey)
		}
		if driverId != nil {
			dictionary.updateValue(driverId! as AnyObject, forKey: kDetailsDriverIdKey)
		}
		if rideTimePrice != nil {
			dictionary.updateValue(rideTimePrice! as AnyObject, forKey: kDetailsRideTimePriceKey)
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
		if carAdminStatus != nil {
			dictionary.updateValue(carAdminStatus! as AnyObject, forKey: kDetailsCarAdminStatusKey)
		}
		if endTime != nil {
			dictionary.updateValue(endTime! as AnyObject, forKey: kDetailsEndTimeKey)
		}
		if facebookLastname != nil {
			dictionary.updateValue(facebookLastname! as AnyObject, forKey: kDetailsFacebookLastnameKey)
		}
		if googleToken != nil {
			dictionary.updateValue(googleToken! as AnyObject, forKey: kDetailsGoogleTokenKey)
		}
		if driverLat != nil {
			dictionary.updateValue(driverLat! as AnyObject, forKey: kDetailsDriverLatKey)
		}
		if driverLong != nil {
			dictionary.updateValue(driverLong! as AnyObject, forKey: kDetailsDriverLongKey)
		}
		if pickupLat != nil {
			dictionary.updateValue(pickupLat! as AnyObject, forKey: kDetailsPickupLatKey)
		}
		if phoneVerified != nil {
			dictionary.updateValue(phoneVerified! as AnyObject, forKey: kDetailsPhoneVerifiedKey)
		}
		if rideAdminStatus != nil {
			dictionary.updateValue(rideAdminStatus! as AnyObject, forKey: kDetailsRideAdminStatusKey)
		}
		if pickupLong != nil {
			dictionary.updateValue(pickupLong! as AnyObject, forKey: kDetailsPickupLongKey)
		}
        if paymentname != nil {
            dictionary.updateValue(paymentname! as AnyObject, forKey: kDetailsPaymentName)
        }
        if peaktimecharges != nil {
            dictionary.updateValue(peaktimecharges! as AnyObject, forKey: kMsgPeakTimeCharge)
        }
        if nighttimecharges != nil {
            dictionary.updateValue(nighttimecharges! as AnyObject, forKey: kMsgNighTimeCharges)
        }
        if userratingstar != nil {
            dictionary.updateValue(userratingstar! as AnyObject, forKey: kDetailsUserratingstar)
        }
        if driverratingstar != nil {
            dictionary.updateValue(driverratingstar! as AnyObject, forKey: kDetailsDriverratingstar)
        }
        


        return dictionary
    }

}
