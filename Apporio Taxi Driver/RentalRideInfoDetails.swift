//
//  Details.swift
//
//  Created by AppOrio on 03/07/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class RentalRideInfoDetails: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kDetailsBookingAdminStatusKey: String = "booking_admin_status"
	internal let kDetailsFacebookTokenKey: String = "facebook_token"
	internal let kDetailsGoogleIdKey: String = "google_id"
	internal let kDetailsLastUpdateTimeKey: String = "last_update_time"
	internal let kDetailsDriverEmailKey: String = "driver_email"
	internal let kDetailsUserImageKey: String = "user_image"
	internal let kDetailsCarModelNameKey: String = "car_model_name"
	internal let kDetailsFlagKey: String = "flag"
	internal let kDetailsDriverNameKey: String = "driver_name"
	internal let kDetailsBookingTypeKey: String = "booking_type"
	internal let kDetailsGoogleImageKey: String = "google_image"
	internal let kDetailsDeviceIdKey: String = "device_id"
	internal let kDetailsUserNameKey: String = "user_name"
	internal let kDetailsLoginLogoutKey: String = "login_logout"
	internal let kDetailsUserEmailKey: String = "user_email"
	internal let kDetailsStartMeterReadingImageKey: String = "start_meter_reading_image"
	internal let kDetailsStatusKey: String = "status"
	internal let kDetailsUserPasswordKey: String = "user_password"
	internal let kDetailsBookingStatusKey: String = "booking_status"
	internal let kDetailsCarTypeImageKey: String = "car_type_image"
	internal let kDetailsCarNumberKey: String = "car_number"
	internal let kDetailsBookingDateKey: String = "booking_date"
	internal let kDetailsReferralCodeSendKey: String = "referral_code_send"
	internal let kDetailsDriverPhoneKey: String = "driver_phone"
	internal let kDetailsCarTypeIdKey: String = "car_type_id"
	internal let kDetailsUserIdKey: String = "user_id"
	internal let kDetailsStartMeterReadingKey: String = "start_meter_reading"
	internal let kDetailsPasswordCreatedKey: String = "password_created"
	internal let kDetailsFacebookFirstnameKey: String = "facebook_firstname"
	internal let kDetailsCarModelImageKey: String = "car_model_image"
	internal let kDetailsFreeRidesKey: String = "free_rides"
	internal let kDetailsEndMeterReadingImageKey: String = "end_meter_reading_image"
	internal let kDetailsFacebookImageKey: String = "facebook_image"
	internal let kDetailsUserBookingDateTimeKey: String = "user_booking_date_time"
	internal let kDetailsRatingKey: String = "rating"
	internal let kDetailsTokenCreatedKey: String = "token_created"
	internal let kDetailsRentcardIdKey: String = "rentcard_id"
	internal let kDetailsEndMeterReadingKey: String = "end_meter_reading"
	internal let kDetailsGoogleMailKey: String = "google_mail"
	internal let kDetailsGoogleNameKey: String = "google_name"
	internal let kDetailsDriverImageKey: String = "driver_image"
	internal let kDetailsBookingTimeKey: String = "booking_time"
	internal let kDetailsUserPhoneKey: String = "user_phone"
	internal let kDetailsCarTypeNameKey: String = "car_type_name"
	internal let kDetailsFacebookMailKey: String = "facebook_mail"
	internal let kDetailsPickupLocationKey: String = "pickup_location"
	internal let kDetailsDriverIdKey: String = "driver_id"
	internal let kDetailsEmailVerifiedKey: String = "email_verified"
	internal let kDetailsFacebookIdKey: String = "facebook_id"
	internal let kDetailsGoogleTokenKey: String = "google_token"
	internal let kDetailsRegisterDateKey: String = "register_date"
	internal let kDetailsFacebookLastnameKey: String = "facebook_lastname"
	internal let kDetailsRentalBookingIdKey: String = "rental_booking_id"
	internal let kDetailsPickupLatKey: String = "pickup_lat"
	internal let kDetailsPhoneVerifiedKey: String = "phone_verified"
	internal let kDetailsPickupLongKey: String = "pickup_long"
	internal let kDetailsReferralCodeKey: String = "referral_code"
    internal let kDetailsPackagePriceKey: String = "package_price"
    internal let kDetailsPackageNameKey: String = "package_name"


    // MARK: Properties
	public var bookingAdminStatus: String?
	public var facebookToken: String?
	public var googleId: String?
	public var lastUpdateTime: String?
	public var driverEmail: String?
	public var userImage: String?
	public var carModelName: String?
	public var flag: String?
	public var driverName: String?
	public var bookingType: String?
	public var googleImage: String?
	public var deviceId: String?
	public var userName: String?
	public var loginLogout: String?
	public var userEmail: String?
	public var startMeterReadingImage: String?
	public var status: String?
	public var userPassword: String?
	public var bookingStatus: String?
	public var carTypeImage: String?
	public var carNumber: String?
	public var bookingDate: String?
	public var referralCodeSend: String?
	public var driverPhone: String?
	public var carTypeId: String?
	public var userId: String?
	public var startMeterReading: String?
	public var passwordCreated: String?
	public var facebookFirstname: String?
	public var carModelImage: String?
	public var freeRides: String?
	public var endMeterReadingImage: String?
	public var facebookImage: String?
	public var userBookingDateTime: String?
	public var rating: String?
	public var tokenCreated: String?
	public var rentcardId: String?
	public var endMeterReading: String?
	public var googleMail: String?
	public var googleName: String?
	public var driverImage: String?
	public var bookingTime: String?
	public var userPhone: String?
	public var carTypeName: String?
	public var facebookMail: String?
	public var pickupLocation: String?
	public var driverId: String?
	public var emailVerified: String?
	public var facebookId: String?
	public var googleToken: String?
	public var registerDate: String?
	public var facebookLastname: String?
	public var rentalBookingId: String?
	public var pickupLat: String?
	public var phoneVerified: String?
	public var pickupLong: String?
	public var referralCode: String?
    public var packageprice: String?
    public var packagename: String?


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
		bookingAdminStatus = json[kDetailsBookingAdminStatusKey].string
		facebookToken = json[kDetailsFacebookTokenKey].string
		googleId = json[kDetailsGoogleIdKey].string
		lastUpdateTime = json[kDetailsLastUpdateTimeKey].string
		driverEmail = json[kDetailsDriverEmailKey].string
		userImage = json[kDetailsUserImageKey].string
		carModelName = json[kDetailsCarModelNameKey].string
		flag = json[kDetailsFlagKey].string
		driverName = json[kDetailsDriverNameKey].string
		bookingType = json[kDetailsBookingTypeKey].string
		googleImage = json[kDetailsGoogleImageKey].string
		deviceId = json[kDetailsDeviceIdKey].string
		userName = json[kDetailsUserNameKey].string
		loginLogout = json[kDetailsLoginLogoutKey].string
		userEmail = json[kDetailsUserEmailKey].string
		startMeterReadingImage = json[kDetailsStartMeterReadingImageKey].string
		status = json[kDetailsStatusKey].string
		userPassword = json[kDetailsUserPasswordKey].string
		bookingStatus = json[kDetailsBookingStatusKey].string
		carTypeImage = json[kDetailsCarTypeImageKey].string
		carNumber = json[kDetailsCarNumberKey].string
		bookingDate = json[kDetailsBookingDateKey].string
		referralCodeSend = json[kDetailsReferralCodeSendKey].string
		driverPhone = json[kDetailsDriverPhoneKey].string
		carTypeId = json[kDetailsCarTypeIdKey].string
		userId = json[kDetailsUserIdKey].string
		startMeterReading = json[kDetailsStartMeterReadingKey].string
		passwordCreated = json[kDetailsPasswordCreatedKey].string
		facebookFirstname = json[kDetailsFacebookFirstnameKey].string
		carModelImage = json[kDetailsCarModelImageKey].string
		freeRides = json[kDetailsFreeRidesKey].string
		endMeterReadingImage = json[kDetailsEndMeterReadingImageKey].string
		facebookImage = json[kDetailsFacebookImageKey].string
		userBookingDateTime = json[kDetailsUserBookingDateTimeKey].string
		rating = json[kDetailsRatingKey].string
		tokenCreated = json[kDetailsTokenCreatedKey].string
		rentcardId = json[kDetailsRentcardIdKey].string
		endMeterReading = json[kDetailsEndMeterReadingKey].string
		googleMail = json[kDetailsGoogleMailKey].string
		googleName = json[kDetailsGoogleNameKey].string
		driverImage = json[kDetailsDriverImageKey].string
		bookingTime = json[kDetailsBookingTimeKey].string
		userPhone = json[kDetailsUserPhoneKey].string
		carTypeName = json[kDetailsCarTypeNameKey].string
		facebookMail = json[kDetailsFacebookMailKey].string
		pickupLocation = json[kDetailsPickupLocationKey].string
		driverId = json[kDetailsDriverIdKey].string
		emailVerified = json[kDetailsEmailVerifiedKey].string
		facebookId = json[kDetailsFacebookIdKey].string
		googleToken = json[kDetailsGoogleTokenKey].string
		registerDate = json[kDetailsRegisterDateKey].string
		facebookLastname = json[kDetailsFacebookLastnameKey].string
		rentalBookingId = json[kDetailsRentalBookingIdKey].string
		pickupLat = json[kDetailsPickupLatKey].string
		phoneVerified = json[kDetailsPhoneVerifiedKey].string
		pickupLong = json[kDetailsPickupLongKey].string
		referralCode = json[kDetailsReferralCodeKey].string
        packageprice = json[kDetailsPackagePriceKey].string
        packagename = json[kDetailsPackageNameKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if bookingAdminStatus != nil {
			dictionary.updateValue(bookingAdminStatus! as AnyObject, forKey: kDetailsBookingAdminStatusKey)
		}
		if facebookToken != nil {
			dictionary.updateValue(facebookToken! as AnyObject, forKey: kDetailsFacebookTokenKey)
		}
		if googleId != nil {
			dictionary.updateValue(googleId! as AnyObject, forKey: kDetailsGoogleIdKey)
		}
		if lastUpdateTime != nil {
			dictionary.updateValue(lastUpdateTime! as AnyObject, forKey: kDetailsLastUpdateTimeKey)
		}
		if driverEmail != nil {
			dictionary.updateValue(driverEmail! as AnyObject, forKey: kDetailsDriverEmailKey)
		}
		if userImage != nil {
			dictionary.updateValue(userImage! as AnyObject, forKey: kDetailsUserImageKey)
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
		if bookingType != nil {
			dictionary.updateValue(bookingType! as AnyObject, forKey: kDetailsBookingTypeKey)
		}
		if googleImage != nil {
			dictionary.updateValue(googleImage! as AnyObject, forKey: kDetailsGoogleImageKey)
		}
		if deviceId != nil {
			dictionary.updateValue(deviceId! as AnyObject, forKey: kDetailsDeviceIdKey)
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
		if startMeterReadingImage != nil {
			dictionary.updateValue(startMeterReadingImage! as AnyObject, forKey: kDetailsStartMeterReadingImageKey)
		}
		if status != nil {
			dictionary.updateValue(status! as AnyObject, forKey: kDetailsStatusKey)
		}
		if userPassword != nil {
			dictionary.updateValue(userPassword! as AnyObject, forKey: kDetailsUserPasswordKey)
		}
		if bookingStatus != nil {
			dictionary.updateValue(bookingStatus! as AnyObject, forKey: kDetailsBookingStatusKey)
		}
		if carTypeImage != nil {
			dictionary.updateValue(carTypeImage! as AnyObject, forKey: kDetailsCarTypeImageKey)
		}
		if carNumber != nil {
			dictionary.updateValue(carNumber! as AnyObject, forKey: kDetailsCarNumberKey)
		}
		if bookingDate != nil {
			dictionary.updateValue(bookingDate! as AnyObject, forKey: kDetailsBookingDateKey)
		}
		if referralCodeSend != nil {
			dictionary.updateValue(referralCodeSend! as AnyObject, forKey: kDetailsReferralCodeSendKey)
		}
		if driverPhone != nil {
			dictionary.updateValue(driverPhone! as AnyObject, forKey: kDetailsDriverPhoneKey)
		}
		if carTypeId != nil {
			dictionary.updateValue(carTypeId! as AnyObject, forKey: kDetailsCarTypeIdKey)
		}
		if userId != nil {
			dictionary.updateValue(userId! as AnyObject, forKey: kDetailsUserIdKey)
		}
		if startMeterReading != nil {
			dictionary.updateValue(startMeterReading! as AnyObject, forKey: kDetailsStartMeterReadingKey)
		}
		if passwordCreated != nil {
			dictionary.updateValue(passwordCreated! as AnyObject, forKey: kDetailsPasswordCreatedKey)
		}
		if facebookFirstname != nil {
			dictionary.updateValue(facebookFirstname! as AnyObject, forKey: kDetailsFacebookFirstnameKey)
		}
		if carModelImage != nil {
			dictionary.updateValue(carModelImage! as AnyObject, forKey: kDetailsCarModelImageKey)
		}
		if freeRides != nil {
			dictionary.updateValue(freeRides! as AnyObject, forKey: kDetailsFreeRidesKey)
		}
		if endMeterReadingImage != nil {
			dictionary.updateValue(endMeterReadingImage! as AnyObject, forKey: kDetailsEndMeterReadingImageKey)
		}
		if facebookImage != nil {
			dictionary.updateValue(facebookImage! as AnyObject, forKey: kDetailsFacebookImageKey)
		}
		if userBookingDateTime != nil {
			dictionary.updateValue(userBookingDateTime! as AnyObject, forKey: kDetailsUserBookingDateTimeKey)
		}
		if rating != nil {
			dictionary.updateValue(rating! as AnyObject, forKey: kDetailsRatingKey)
		}
		if tokenCreated != nil {
			dictionary.updateValue(tokenCreated! as AnyObject, forKey: kDetailsTokenCreatedKey)
		}
		if rentcardId != nil {
			dictionary.updateValue(rentcardId! as AnyObject, forKey: kDetailsRentcardIdKey)
		}
		if endMeterReading != nil {
			dictionary.updateValue(endMeterReading! as AnyObject, forKey: kDetailsEndMeterReadingKey)
		}
		if googleMail != nil {
			dictionary.updateValue(googleMail! as AnyObject, forKey: kDetailsGoogleMailKey)
		}
		if googleName != nil {
			dictionary.updateValue(googleName! as AnyObject, forKey: kDetailsGoogleNameKey)
		}
		if driverImage != nil {
			dictionary.updateValue(driverImage! as AnyObject, forKey: kDetailsDriverImageKey)
		}
		if bookingTime != nil {
			dictionary.updateValue(bookingTime! as AnyObject, forKey: kDetailsBookingTimeKey)
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
		if driverId != nil {
			dictionary.updateValue(driverId! as AnyObject, forKey: kDetailsDriverIdKey)
		}
		if emailVerified != nil {
			dictionary.updateValue(emailVerified! as AnyObject, forKey: kDetailsEmailVerifiedKey)
		}
		if facebookId != nil {
			dictionary.updateValue(facebookId! as AnyObject, forKey: kDetailsFacebookIdKey)
		}
		if googleToken != nil {
			dictionary.updateValue(googleToken! as AnyObject, forKey: kDetailsGoogleTokenKey)
		}
		if registerDate != nil {
			dictionary.updateValue(registerDate! as AnyObject, forKey: kDetailsRegisterDateKey)
		}
		if facebookLastname != nil {
			dictionary.updateValue(facebookLastname! as AnyObject, forKey: kDetailsFacebookLastnameKey)
		}
		if rentalBookingId != nil {
			dictionary.updateValue(rentalBookingId! as AnyObject, forKey: kDetailsRentalBookingIdKey)
		}
		if pickupLat != nil {
			dictionary.updateValue(pickupLat! as AnyObject, forKey: kDetailsPickupLatKey)
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
        if packageprice != nil {
            dictionary.updateValue(packageprice! as AnyObject, forKey: kDetailsPackagePriceKey)
        }
        if packagename != nil {
           dictionary.updateValue(packagename! as AnyObject, forKey: kDetailsPackageNameKey)
        }

        return dictionary
    }

}
