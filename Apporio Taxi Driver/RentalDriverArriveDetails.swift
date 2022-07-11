//
//  Details.swift
//
//  Created by AppOrio on 05/07/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class RentalDriverArriveDetails: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kDetailsFacebookFirstnameKey: String = "facebook_firstname"
	internal let kDetailsBookingAdminStatusKey: String = "booking_admin_status"
	internal let kDetailsFreeRidesKey: String = "free_rides"
	internal let kDetailsPickupLongKey: String = "pickup_long"
	internal let kDetailsFacebookTokenKey: String = "facebook_token"
	internal let kDetailsPasswordCreatedKey: String = "password_created"
	internal let kDetailsGoogleIdKey: String = "google_id"
	internal let kDetailsEndMeterReadingImageKey: String = "end_meter_reading_image"
	internal let kDetailsLastUpdateTimeKey: String = "last_update_time"
	internal let kDetailsUserBookingDateTimeKey: String = "user_booking_date_time"
	internal let kDetailsFacebookImageKey: String = "facebook_image"
	internal let kDetailsTokenCreatedKey: String = "token_created"
	internal let kDetailsRentcardIdKey: String = "rentcard_id"
	internal let kDetailsRatingKey: String = "rating"
	internal let kDetailsEndMeterReadingKey: String = "end_meter_reading"
	internal let kDetailsUserNameKey: String = "user_name"
	internal let kDetailsGoogleNameKey: String = "google_name"
	internal let kDetailsGoogleImageKey: String = "google_image"
	internal let kDetailsFlagKey: String = "flag"
	internal let kDetailsUserImageKey: String = "user_image"
	internal let kDetailsDeviceIdKey: String = "device_id"
	internal let kDetailsBookingTypeKey: String = "booking_type"
	internal let kDetailsGoogleMailKey: String = "google_mail"
	internal let kDetailsUserEmailKey: String = "user_email"
	internal let kDetailsStartMeterReadingImageKey: String = "start_meter_reading_image"
	internal let kDetailsLoginLogoutKey: String = "login_logout"
	internal let kDetailsStatusKey: String = "status"
	internal let kDetailsBookingTimeKey: String = "booking_time"
	internal let kDetailsUserPasswordKey: String = "user_password"
	internal let kDetailsUserPhoneKey: String = "user_phone"
	internal let kDetailsBookingStatusKey: String = "booking_status"
	internal let kDetailsFacebookMailKey: String = "facebook_mail"
	internal let kDetailsPickupLocationKey: String = "pickup_location"
	internal let kDetailsDriverIdKey: String = "driver_id"
	internal let kDetailsEmailVerifiedKey: String = "email_verified"
	internal let kDetailsRentalBookingIdKey: String = "rental_booking_id"
	internal let kDetailsRegisterDateKey: String = "register_date"
	internal let kDetailsReferralCodeSendKey: String = "referral_code_send"
	internal let kDetailsFacebookLastnameKey: String = "facebook_lastname"
	internal let kDetailsGoogleTokenKey: String = "google_token"
	internal let kDetailsCarTypeIdKey: String = "car_type_id"
	internal let kDetailsBookingDateKey: String = "booking_date"
	internal let kDetailsFacebookIdKey: String = "facebook_id"
	internal let kDetailsStartMeterReadingKey: String = "start_meter_reading"
	internal let kDetailsUserIdKey: String = "user_id"
	internal let kDetailsPickupLatKey: String = "pickup_lat"
	internal let kDetailsReferralCodeKey: String = "referral_code"
	internal let kDetailsPhoneVerifiedKey: String = "phone_verified"


    // MARK: Properties
	public var facebookFirstname: String?
	public var bookingAdminStatus: String?
	public var freeRides: String?
	public var pickupLong: String?
	public var facebookToken: String?
	public var passwordCreated: String?
	public var googleId: String?
	public var endMeterReadingImage: String?
	public var lastUpdateTime: String?
	public var userBookingDateTime: String?
	public var facebookImage: String?
	public var tokenCreated: String?
	public var rentcardId: String?
	public var rating: String?
	public var endMeterReading: String?
	public var userName: String?
	public var googleName: String?
	public var googleImage: String?
	public var flag: String?
	public var userImage: String?
	public var deviceId: String?
	public var bookingType: String?
	public var googleMail: String?
	public var userEmail: String?
	public var startMeterReadingImage: String?
	public var loginLogout: String?
	public var status: String?
	public var bookingTime: String?
	public var userPassword: String?
	public var userPhone: String?
	public var bookingStatus: String?
	public var facebookMail: String?
	public var pickupLocation: String?
	public var driverId: String?
	public var emailVerified: String?
	public var rentalBookingId: String?
	public var registerDate: String?
	public var referralCodeSend: String?
	public var facebookLastname: String?
	public var googleToken: String?
	public var carTypeId: String?
	public var bookingDate: String?
	public var facebookId: String?
	public var startMeterReading: String?
	public var userId: String?
	public var pickupLat: String?
	public var referralCode: String?
	public var phoneVerified: String?


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
		facebookFirstname = json[kDetailsFacebookFirstnameKey].string
		bookingAdminStatus = json[kDetailsBookingAdminStatusKey].string
		freeRides = json[kDetailsFreeRidesKey].string
		pickupLong = json[kDetailsPickupLongKey].string
		facebookToken = json[kDetailsFacebookTokenKey].string
		passwordCreated = json[kDetailsPasswordCreatedKey].string
		googleId = json[kDetailsGoogleIdKey].string
		endMeterReadingImage = json[kDetailsEndMeterReadingImageKey].string
		lastUpdateTime = json[kDetailsLastUpdateTimeKey].string
		userBookingDateTime = json[kDetailsUserBookingDateTimeKey].string
		facebookImage = json[kDetailsFacebookImageKey].string
		tokenCreated = json[kDetailsTokenCreatedKey].string
		rentcardId = json[kDetailsRentcardIdKey].string
		rating = json[kDetailsRatingKey].string
		endMeterReading = json[kDetailsEndMeterReadingKey].string
		userName = json[kDetailsUserNameKey].string
		googleName = json[kDetailsGoogleNameKey].string
		googleImage = json[kDetailsGoogleImageKey].string
		flag = json[kDetailsFlagKey].string
		userImage = json[kDetailsUserImageKey].string
		deviceId = json[kDetailsDeviceIdKey].string
		bookingType = json[kDetailsBookingTypeKey].string
		googleMail = json[kDetailsGoogleMailKey].string
		userEmail = json[kDetailsUserEmailKey].string
		startMeterReadingImage = json[kDetailsStartMeterReadingImageKey].string
		loginLogout = json[kDetailsLoginLogoutKey].string
		status = json[kDetailsStatusKey].string
		bookingTime = json[kDetailsBookingTimeKey].string
		userPassword = json[kDetailsUserPasswordKey].string
		userPhone = json[kDetailsUserPhoneKey].string
		bookingStatus = json[kDetailsBookingStatusKey].string
		facebookMail = json[kDetailsFacebookMailKey].string
		pickupLocation = json[kDetailsPickupLocationKey].string
		driverId = json[kDetailsDriverIdKey].string
		emailVerified = json[kDetailsEmailVerifiedKey].string
		rentalBookingId = json[kDetailsRentalBookingIdKey].string
		registerDate = json[kDetailsRegisterDateKey].string
		referralCodeSend = json[kDetailsReferralCodeSendKey].string
		facebookLastname = json[kDetailsFacebookLastnameKey].string
		googleToken = json[kDetailsGoogleTokenKey].string
		carTypeId = json[kDetailsCarTypeIdKey].string
		bookingDate = json[kDetailsBookingDateKey].string
		facebookId = json[kDetailsFacebookIdKey].string
		startMeterReading = json[kDetailsStartMeterReadingKey].string
		userId = json[kDetailsUserIdKey].string
		pickupLat = json[kDetailsPickupLatKey].string
		referralCode = json[kDetailsReferralCodeKey].string
		phoneVerified = json[kDetailsPhoneVerifiedKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if facebookFirstname != nil {
			dictionary.updateValue(facebookFirstname! as AnyObject, forKey: kDetailsFacebookFirstnameKey)
		}
		if bookingAdminStatus != nil {
			dictionary.updateValue(bookingAdminStatus! as AnyObject, forKey: kDetailsBookingAdminStatusKey)
		}
		if freeRides != nil {
			dictionary.updateValue(freeRides! as AnyObject, forKey: kDetailsFreeRidesKey)
		}
		if pickupLong != nil {
			dictionary.updateValue(pickupLong! as AnyObject, forKey: kDetailsPickupLongKey)
		}
		if facebookToken != nil {
			dictionary.updateValue(facebookToken! as AnyObject, forKey: kDetailsFacebookTokenKey)
		}
		if passwordCreated != nil {
			dictionary.updateValue(passwordCreated! as AnyObject, forKey: kDetailsPasswordCreatedKey)
		}
		if googleId != nil {
			dictionary.updateValue(googleId! as AnyObject, forKey: kDetailsGoogleIdKey)
		}
		if endMeterReadingImage != nil {
			dictionary.updateValue(endMeterReadingImage! as AnyObject, forKey: kDetailsEndMeterReadingImageKey)
		}
		if lastUpdateTime != nil {
			dictionary.updateValue(lastUpdateTime! as AnyObject, forKey: kDetailsLastUpdateTimeKey)
		}
		if userBookingDateTime != nil {
			dictionary.updateValue(userBookingDateTime! as AnyObject, forKey: kDetailsUserBookingDateTimeKey)
		}
		if facebookImage != nil {
			dictionary.updateValue(facebookImage! as AnyObject, forKey: kDetailsFacebookImageKey)
		}
		if tokenCreated != nil {
			dictionary.updateValue(tokenCreated! as AnyObject, forKey: kDetailsTokenCreatedKey)
		}
		if rentcardId != nil {
			dictionary.updateValue(rentcardId! as AnyObject, forKey: kDetailsRentcardIdKey)
		}
		if rating != nil {
			dictionary.updateValue(rating! as AnyObject, forKey: kDetailsRatingKey)
		}
		if endMeterReading != nil {
			dictionary.updateValue(endMeterReading! as AnyObject, forKey: kDetailsEndMeterReadingKey)
		}
		if userName != nil {
			dictionary.updateValue(userName! as AnyObject, forKey: kDetailsUserNameKey)
		}
		if googleName != nil {
			dictionary.updateValue(googleName! as AnyObject, forKey: kDetailsGoogleNameKey)
		}
		if googleImage != nil {
			dictionary.updateValue(googleImage! as AnyObject, forKey: kDetailsGoogleImageKey)
		}
		if flag != nil {
			dictionary.updateValue(flag! as AnyObject, forKey: kDetailsFlagKey)
		}
		if userImage != nil {
			dictionary.updateValue(userImage! as AnyObject, forKey: kDetailsUserImageKey)
		}
		if deviceId != nil {
			dictionary.updateValue(deviceId! as AnyObject, forKey: kDetailsDeviceIdKey)
		}
		if bookingType != nil {
			dictionary.updateValue(bookingType! as AnyObject, forKey: kDetailsBookingTypeKey)
		}
		if googleMail != nil {
			dictionary.updateValue(googleMail! as AnyObject, forKey: kDetailsGoogleMailKey)
		}
		if userEmail != nil {
			dictionary.updateValue(userEmail! as AnyObject, forKey: kDetailsUserEmailKey)
		}
		if startMeterReadingImage != nil {
			dictionary.updateValue(startMeterReadingImage! as AnyObject, forKey: kDetailsStartMeterReadingImageKey)
		}
		if loginLogout != nil {
			dictionary.updateValue(loginLogout! as AnyObject, forKey: kDetailsLoginLogoutKey)
		}
		if status != nil {
			dictionary.updateValue(status! as AnyObject, forKey: kDetailsStatusKey)
		}
		if bookingTime != nil {
			dictionary.updateValue(bookingTime! as AnyObject, forKey: kDetailsBookingTimeKey)
		}
		if userPassword != nil {
			dictionary.updateValue(userPassword! as AnyObject, forKey: kDetailsUserPasswordKey)
		}
		if userPhone != nil {
			dictionary.updateValue(userPhone! as AnyObject, forKey: kDetailsUserPhoneKey)
		}
		if bookingStatus != nil {
			dictionary.updateValue(bookingStatus! as AnyObject, forKey: kDetailsBookingStatusKey)
		}
		if facebookMail != nil {
			dictionary.updateValue(facebookMail! as AnyObject, forKey: kDetailsFacebookMailKey)
		}
		if pickupLocation != nil {
			dictionary.updateValue(pickupLocation! as AnyObject, forKey: kDetailsPickupLocationKey)
		}
		if driverId != nil {
			dictionary.updateValue(driverId! as AnyObject, forKey: kDetailsDriverIdKey)
		}
		if emailVerified != nil {
			dictionary.updateValue(emailVerified! as AnyObject, forKey: kDetailsEmailVerifiedKey)
		}
		if rentalBookingId != nil {
			dictionary.updateValue(rentalBookingId! as AnyObject, forKey: kDetailsRentalBookingIdKey)
		}
		if registerDate != nil {
			dictionary.updateValue(registerDate! as AnyObject, forKey: kDetailsRegisterDateKey)
		}
		if referralCodeSend != nil {
			dictionary.updateValue(referralCodeSend! as AnyObject, forKey: kDetailsReferralCodeSendKey)
		}
		if facebookLastname != nil {
			dictionary.updateValue(facebookLastname! as AnyObject, forKey: kDetailsFacebookLastnameKey)
		}
		if googleToken != nil {
			dictionary.updateValue(googleToken! as AnyObject, forKey: kDetailsGoogleTokenKey)
		}
		if carTypeId != nil {
			dictionary.updateValue(carTypeId! as AnyObject, forKey: kDetailsCarTypeIdKey)
		}
		if bookingDate != nil {
			dictionary.updateValue(bookingDate! as AnyObject, forKey: kDetailsBookingDateKey)
		}
		if facebookId != nil {
			dictionary.updateValue(facebookId! as AnyObject, forKey: kDetailsFacebookIdKey)
		}
		if startMeterReading != nil {
			dictionary.updateValue(startMeterReading! as AnyObject, forKey: kDetailsStartMeterReadingKey)
		}
		if userId != nil {
			dictionary.updateValue(userId! as AnyObject, forKey: kDetailsUserIdKey)
		}
		if pickupLat != nil {
			dictionary.updateValue(pickupLat! as AnyObject, forKey: kDetailsPickupLatKey)
		}
		if referralCode != nil {
			dictionary.updateValue(referralCode! as AnyObject, forKey: kDetailsReferralCodeKey)
		}
		if phoneVerified != nil {
			dictionary.updateValue(phoneVerified! as AnyObject, forKey: kDetailsPhoneVerifiedKey)
		}

        return dictionary
    }

}
