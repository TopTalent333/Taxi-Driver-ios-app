//
//  RentalRide.swift
//
//  Created by AppOrio on 04/07/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class RentalRide: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kRentalRideBookingAdminStatusKey: String = "booking_admin_status"
	internal let kRentalRideFacebookTokenKey: String = "facebook_token"
	internal let kRentalRideGoogleIdKey: String = "google_id"
	internal let kRentalRideLastUpdateTimeKey: String = "last_update_time"
	internal let kRentalRideUserImageKey: String = "user_image"
	internal let kRentalRideUserNameKey: String = "user_name"
	internal let kRentalRideFlagKey: String = "flag"
	internal let kRentalRideGoogleImageKey: String = "google_image"
	internal let kRentalRideBookingTypeKey: String = "booking_type"
	internal let kRentalRideEndLongKey: String = "end_long"
	internal let kRentalRideDeviceIdKey: String = "device_id"
	internal let kRentalRideCarNameArabicKey: String = "car_name_arabic"
	internal let kRentalRideLoginLogoutKey: String = "login_logout"
	internal let kRentalRideUserEmailKey: String = "user_email"
	internal let kRentalRideStartMeterReadingImageKey: String = "start_meter_reading_image"
	internal let kRentalRideStatusKey: String = "status"
	internal let kRentalRideUserPasswordKey: String = "user_password"
	internal let kRentalRideBookingStatusKey: String = "booking_status"
	internal let kRentalRideCarTypeImageKey: String = "car_type_image"
	internal let kRentalRideRideModeKey: String = "ride_mode"
	internal let kRentalRideCarTypeNameFrenchKey: String = "car_type_name_french"
	internal let kRentalRideBookingDateKey: String = "booking_date"
	internal let kRentalRideReferralCodeSendKey: String = "referral_code_send"
	internal let kRentalRideCarTypeIdKey: String = "car_type_id"
	internal let kRentalRideUserIdKey: String = "user_id"
	internal let kRentalRideStartMeterReadingKey: String = "start_meter_reading"
	internal let kRentalRidePasswordCreatedKey: String = "password_created"
	internal let kRentalRideFacebookFirstnameKey: String = "facebook_firstname"
	internal let kRentalRideFreeRidesKey: String = "free_rides"
	internal let kRentalRideEndMeterReadingImageKey: String = "end_meter_reading_image"
	internal let kRentalRideEndLocationKey: String = "end_location"
	internal let kRentalRideFacebookImageKey: String = "facebook_image"
	internal let kRentalRideUserBookingDateTimeKey: String = "user_booking_date_time"
	internal let kRentalRideRatingKey: String = "rating"
	internal let kRentalRideTokenCreatedKey: String = "token_created"
	internal let kRentalRideRentcardIdKey: String = "rentcard_id"
	internal let kRentalRideEndMeterReadingKey: String = "end_meter_reading"
	internal let kRentalRideGoogleMailKey: String = "google_mail"
	internal let kRentalRideGoogleNameKey: String = "google_name"
	internal let kRentalRideBookingTimeKey: String = "booking_time"
	internal let kRentalRideUserPhoneKey: String = "user_phone"
	internal let kRentalRideCarTypeNameKey: String = "car_type_name"
	internal let kRentalRideFacebookMailKey: String = "facebook_mail"
	internal let kRentalRidePickupLocationKey: String = "pickup_location"
	internal let kRentalRideDriverIdKey: String = "driver_id"
	internal let kRentalRideFinalBillAmountKey: String = "final_bill_amount"
	internal let kRentalRideEmailVerifiedKey: String = "email_verified"
	internal let kRentalRideRentalBookingIdKey: String = "rental_booking_id"
	internal let kRentalRideGoogleTokenKey: String = "google_token"
	internal let kRentalRideFacebookIdKey: String = "facebook_id"
	internal let kRentalRideRegisterDateKey: String = "register_date"
	internal let kRentalRideCarAdminStatusKey: String = "car_admin_status"
	internal let kRentalRideFacebookLastnameKey: String = "facebook_lastname"
	internal let kRentalRideEndLatKey: String = "end_lat"
	internal let kRentalRidePickupLatKey: String = "pickup_lat"
	internal let kRentalRidePhoneVerifiedKey: String = "phone_verified"
	internal let kRentalRidePickupLongKey: String = "pickup_long"
	internal let kRentalRideReferralCodeKey: String = "referral_code"


    // MARK: Properties
	public var bookingAdminStatus: String?
	public var facebookToken: String?
	public var googleId: String?
	public var lastUpdateTime: String?
	public var userImage: String?
	public var userName: String?
	public var flag: String?
	public var googleImage: String?
	public var bookingType: String?
	public var endLong: String?
	public var deviceId: String?
	public var carNameArabic: String?
	public var loginLogout: String?
	public var userEmail: String?
	public var startMeterReadingImage: String?
	public var status: String?
	public var userPassword: String?
	public var bookingStatus: String?
	public var carTypeImage: String?
	public var rideMode: String?
	public var carTypeNameFrench: String?
	public var bookingDate: String?
	public var referralCodeSend: String?
	public var carTypeId: String?
	public var userId: String?
	public var startMeterReading: String?
	public var passwordCreated: String?
	public var facebookFirstname: String?
	public var freeRides: String?
	public var endMeterReadingImage: String?
	public var endLocation: String?
	public var facebookImage: String?
	public var userBookingDateTime: String?
	public var rating: String?
	public var tokenCreated: String?
	public var rentcardId: String?
	public var endMeterReading: String?
	public var googleMail: String?
	public var googleName: String?
	public var bookingTime: String?
	public var userPhone: String?
	public var carTypeName: String?
	public var facebookMail: String?
	public var pickupLocation: String?
	public var driverId: String?
	public var finalBillAmount: String?
	public var emailVerified: String?
	public var rentalBookingId: String?
	public var googleToken: String?
	public var facebookId: String?
	public var registerDate: String?
	public var carAdminStatus: String?
	public var facebookLastname: String?
	public var endLat: String?
	public var pickupLat: String?
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
		bookingAdminStatus = json[kRentalRideBookingAdminStatusKey].string
		facebookToken = json[kRentalRideFacebookTokenKey].string
		googleId = json[kRentalRideGoogleIdKey].string
		lastUpdateTime = json[kRentalRideLastUpdateTimeKey].string
		userImage = json[kRentalRideUserImageKey].string
		userName = json[kRentalRideUserNameKey].string
		flag = json[kRentalRideFlagKey].string
		googleImage = json[kRentalRideGoogleImageKey].string
		bookingType = json[kRentalRideBookingTypeKey].string
		endLong = json[kRentalRideEndLongKey].string
		deviceId = json[kRentalRideDeviceIdKey].string
		carNameArabic = json[kRentalRideCarNameArabicKey].string
		loginLogout = json[kRentalRideLoginLogoutKey].string
		userEmail = json[kRentalRideUserEmailKey].string
		startMeterReadingImage = json[kRentalRideStartMeterReadingImageKey].string
		status = json[kRentalRideStatusKey].string
		userPassword = json[kRentalRideUserPasswordKey].string
		bookingStatus = json[kRentalRideBookingStatusKey].string
		carTypeImage = json[kRentalRideCarTypeImageKey].string
		rideMode = json[kRentalRideRideModeKey].string
		carTypeNameFrench = json[kRentalRideCarTypeNameFrenchKey].string
		bookingDate = json[kRentalRideBookingDateKey].string
		referralCodeSend = json[kRentalRideReferralCodeSendKey].string
		carTypeId = json[kRentalRideCarTypeIdKey].string
		userId = json[kRentalRideUserIdKey].string
		startMeterReading = json[kRentalRideStartMeterReadingKey].string
		passwordCreated = json[kRentalRidePasswordCreatedKey].string
		facebookFirstname = json[kRentalRideFacebookFirstnameKey].string
		freeRides = json[kRentalRideFreeRidesKey].string
		endMeterReadingImage = json[kRentalRideEndMeterReadingImageKey].string
		endLocation = json[kRentalRideEndLocationKey].string
		facebookImage = json[kRentalRideFacebookImageKey].string
		userBookingDateTime = json[kRentalRideUserBookingDateTimeKey].string
		rating = json[kRentalRideRatingKey].string
		tokenCreated = json[kRentalRideTokenCreatedKey].string
		rentcardId = json[kRentalRideRentcardIdKey].string
		endMeterReading = json[kRentalRideEndMeterReadingKey].string
		googleMail = json[kRentalRideGoogleMailKey].string
		googleName = json[kRentalRideGoogleNameKey].string
		bookingTime = json[kRentalRideBookingTimeKey].string
		userPhone = json[kRentalRideUserPhoneKey].string
		carTypeName = json[kRentalRideCarTypeNameKey].string
		facebookMail = json[kRentalRideFacebookMailKey].string
		pickupLocation = json[kRentalRidePickupLocationKey].string
		driverId = json[kRentalRideDriverIdKey].string
		finalBillAmount = json[kRentalRideFinalBillAmountKey].string
		emailVerified = json[kRentalRideEmailVerifiedKey].string
		rentalBookingId = json[kRentalRideRentalBookingIdKey].string
		googleToken = json[kRentalRideGoogleTokenKey].string
		facebookId = json[kRentalRideFacebookIdKey].string
		registerDate = json[kRentalRideRegisterDateKey].string
		carAdminStatus = json[kRentalRideCarAdminStatusKey].string
		facebookLastname = json[kRentalRideFacebookLastnameKey].string
		endLat = json[kRentalRideEndLatKey].string
		pickupLat = json[kRentalRidePickupLatKey].string
		phoneVerified = json[kRentalRidePhoneVerifiedKey].string
		pickupLong = json[kRentalRidePickupLongKey].string
		referralCode = json[kRentalRideReferralCodeKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if bookingAdminStatus != nil {
			dictionary.updateValue(bookingAdminStatus! as AnyObject, forKey: kRentalRideBookingAdminStatusKey)
		}
		if facebookToken != nil {
			dictionary.updateValue(facebookToken! as AnyObject, forKey: kRentalRideFacebookTokenKey)
		}
		if googleId != nil {
			dictionary.updateValue(googleId! as AnyObject, forKey: kRentalRideGoogleIdKey)
		}
		if lastUpdateTime != nil {
			dictionary.updateValue(lastUpdateTime! as AnyObject, forKey: kRentalRideLastUpdateTimeKey)
		}
		if userImage != nil {
			dictionary.updateValue(userImage! as AnyObject, forKey: kRentalRideUserImageKey)
		}
		if userName != nil {
			dictionary.updateValue(userName! as AnyObject, forKey: kRentalRideUserNameKey)
		}
		if flag != nil {
			dictionary.updateValue(flag! as AnyObject, forKey: kRentalRideFlagKey)
		}
		if googleImage != nil {
			dictionary.updateValue(googleImage! as AnyObject, forKey: kRentalRideGoogleImageKey)
		}
		if bookingType != nil {
			dictionary.updateValue(bookingType! as AnyObject, forKey: kRentalRideBookingTypeKey)
		}
		if endLong != nil {
			dictionary.updateValue(endLong! as AnyObject, forKey: kRentalRideEndLongKey)
		}
		if deviceId != nil {
			dictionary.updateValue(deviceId! as AnyObject, forKey: kRentalRideDeviceIdKey)
		}
		if carNameArabic != nil {
			dictionary.updateValue(carNameArabic! as AnyObject, forKey: kRentalRideCarNameArabicKey)
		}
		if loginLogout != nil {
			dictionary.updateValue(loginLogout! as AnyObject, forKey: kRentalRideLoginLogoutKey)
		}
		if userEmail != nil {
			dictionary.updateValue(userEmail! as AnyObject, forKey: kRentalRideUserEmailKey)
		}
		if startMeterReadingImage != nil {
			dictionary.updateValue(startMeterReadingImage! as AnyObject, forKey: kRentalRideStartMeterReadingImageKey)
		}
		if status != nil {
			dictionary.updateValue(status! as AnyObject, forKey: kRentalRideStatusKey)
		}
		if userPassword != nil {
			dictionary.updateValue(userPassword! as AnyObject, forKey: kRentalRideUserPasswordKey)
		}
		if bookingStatus != nil {
			dictionary.updateValue(bookingStatus! as AnyObject, forKey: kRentalRideBookingStatusKey)
		}
		if carTypeImage != nil {
			dictionary.updateValue(carTypeImage! as AnyObject, forKey: kRentalRideCarTypeImageKey)
		}
		if rideMode != nil {
			dictionary.updateValue(rideMode! as AnyObject, forKey: kRentalRideRideModeKey)
		}
		if carTypeNameFrench != nil {
			dictionary.updateValue(carTypeNameFrench! as AnyObject, forKey: kRentalRideCarTypeNameFrenchKey)
		}
		if bookingDate != nil {
			dictionary.updateValue(bookingDate! as AnyObject, forKey: kRentalRideBookingDateKey)
		}
		if referralCodeSend != nil {
			dictionary.updateValue(referralCodeSend! as AnyObject, forKey: kRentalRideReferralCodeSendKey)
		}
		if carTypeId != nil {
			dictionary.updateValue(carTypeId! as AnyObject, forKey: kRentalRideCarTypeIdKey)
		}
		if userId != nil {
			dictionary.updateValue(userId! as AnyObject, forKey: kRentalRideUserIdKey)
		}
		if startMeterReading != nil {
			dictionary.updateValue(startMeterReading! as AnyObject, forKey: kRentalRideStartMeterReadingKey)
		}
		if passwordCreated != nil {
			dictionary.updateValue(passwordCreated! as AnyObject, forKey: kRentalRidePasswordCreatedKey)
		}
		if facebookFirstname != nil {
			dictionary.updateValue(facebookFirstname! as AnyObject, forKey: kRentalRideFacebookFirstnameKey)
		}
		if freeRides != nil {
			dictionary.updateValue(freeRides! as AnyObject, forKey: kRentalRideFreeRidesKey)
		}
		if endMeterReadingImage != nil {
			dictionary.updateValue(endMeterReadingImage! as AnyObject, forKey: kRentalRideEndMeterReadingImageKey)
		}
		if endLocation != nil {
			dictionary.updateValue(endLocation! as AnyObject, forKey: kRentalRideEndLocationKey)
		}
		if facebookImage != nil {
			dictionary.updateValue(facebookImage! as AnyObject, forKey: kRentalRideFacebookImageKey)
		}
		if userBookingDateTime != nil {
			dictionary.updateValue(userBookingDateTime! as AnyObject, forKey: kRentalRideUserBookingDateTimeKey)
		}
		if rating != nil {
			dictionary.updateValue(rating! as AnyObject, forKey: kRentalRideRatingKey)
		}
		if tokenCreated != nil {
			dictionary.updateValue(tokenCreated! as AnyObject, forKey: kRentalRideTokenCreatedKey)
		}
		if rentcardId != nil {
			dictionary.updateValue(rentcardId! as AnyObject, forKey: kRentalRideRentcardIdKey)
		}
		if endMeterReading != nil {
			dictionary.updateValue(endMeterReading! as AnyObject, forKey: kRentalRideEndMeterReadingKey)
		}
		if googleMail != nil {
			dictionary.updateValue(googleMail! as AnyObject, forKey: kRentalRideGoogleMailKey)
		}
		if googleName != nil {
			dictionary.updateValue(googleName! as AnyObject, forKey: kRentalRideGoogleNameKey)
		}
		if bookingTime != nil {
			dictionary.updateValue(bookingTime! as AnyObject, forKey: kRentalRideBookingTimeKey)
		}
		if userPhone != nil {
			dictionary.updateValue(userPhone! as AnyObject, forKey: kRentalRideUserPhoneKey)
		}
		if carTypeName != nil {
			dictionary.updateValue(carTypeName! as AnyObject, forKey: kRentalRideCarTypeNameKey)
		}
		if facebookMail != nil {
			dictionary.updateValue(facebookMail! as AnyObject, forKey: kRentalRideFacebookMailKey)
		}
		if pickupLocation != nil {
			dictionary.updateValue(pickupLocation! as AnyObject, forKey: kRentalRidePickupLocationKey)
		}
		if driverId != nil {
			dictionary.updateValue(driverId! as AnyObject, forKey: kRentalRideDriverIdKey)
		}
		if finalBillAmount != nil {
			dictionary.updateValue(finalBillAmount! as AnyObject, forKey: kRentalRideFinalBillAmountKey)
		}
		if emailVerified != nil {
			dictionary.updateValue(emailVerified! as AnyObject, forKey: kRentalRideEmailVerifiedKey)
		}
		if rentalBookingId != nil {
			dictionary.updateValue(rentalBookingId! as AnyObject, forKey: kRentalRideRentalBookingIdKey)
		}
		if googleToken != nil {
			dictionary.updateValue(googleToken! as AnyObject, forKey: kRentalRideGoogleTokenKey)
		}
		if facebookId != nil {
			dictionary.updateValue(facebookId! as AnyObject, forKey: kRentalRideFacebookIdKey)
		}
		if registerDate != nil {
			dictionary.updateValue(registerDate! as AnyObject, forKey: kRentalRideRegisterDateKey)
		}
		if carAdminStatus != nil {
			dictionary.updateValue(carAdminStatus! as AnyObject, forKey: kRentalRideCarAdminStatusKey)
		}
		if facebookLastname != nil {
			dictionary.updateValue(facebookLastname! as AnyObject, forKey: kRentalRideFacebookLastnameKey)
		}
		if endLat != nil {
			dictionary.updateValue(endLat! as AnyObject, forKey: kRentalRideEndLatKey)
		}
		if pickupLat != nil {
			dictionary.updateValue(pickupLat! as AnyObject, forKey: kRentalRidePickupLatKey)
		}
		if phoneVerified != nil {
			dictionary.updateValue(phoneVerified! as AnyObject, forKey: kRentalRidePhoneVerifiedKey)
		}
		if pickupLong != nil {
			dictionary.updateValue(pickupLong! as AnyObject, forKey: kRentalRidePickupLongKey)
		}
		if referralCode != nil {
			dictionary.updateValue(referralCode! as AnyObject, forKey: kRentalRideReferralCodeKey)
		}

        return dictionary
    }

}
