//
//  Details.swift
//
//  Created by AppOrio on 04/07/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class ViewRideDetails: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kDetailsReferralCodeKey: String = "referral_code"
	internal let kDetailsBookingAdminStatusKey: String = "booking_admin_status"
	internal let kDetailsDriverRatingKey: String = "driver_rating"
	internal let kDetailsFacebookTokenKey: String = "facebook_token"
	internal let kDetailsGoogleIdKey: String = "google_id"
	internal let kDetailsRentalPackageHoursKey: String = "rental_package_hours"
	internal let kDetailsLastUpdateTimeKey: String = "last_update_time"
	internal let kDetailsExtraHoursTravelChargeKey: String = "extra_hours_travel_charge"
	internal let kDetailsUserImageKey: String = "user_image"
	internal let kDetailsUserNameKey: String = "user_name"
	internal let kDetailsFlagKey: String = "flag"
	internal let kDetailsDriverNameKey: String = "driver_name"
	internal let kDetailsBookingTypeKey: String = "booking_type"
	internal let kDetailsGoogleImageKey: String = "google_image"
	internal let kDetailsDeviceIdKey: String = "device_id"
	internal let kDetailsCarNameArabicKey: String = "car_name_arabic"
	internal let kDetailsTotalTimeTravelKey: String = "total_time_travel"
	internal let kDetailsEndLongKey: String = "end_long"
	internal let kDetailsLoginLogoutKey: String = "login_logout"
	internal let kDetailsUserEmailKey: String = "user_email"
	internal let kDetailsStartMeterReadingImageKey: String = "start_meter_reading_image"
	internal let kDetailsStatusKey: String = "status"
	internal let kDetailsRentalPackagePriceKey: String = "rental_package_price"
	internal let kDetailsExtraDistanceTravelKey: String = "extra_distance_travel"
	internal let kDetailsUserPasswordKey: String = "user_password"
	internal let kDetailsBookingStatusKey: String = "booking_status"
	internal let kDetailsCarTypeImageKey: String = "car_type_image"
	internal let kDetailsBeginTimeKey: String = "begin_time"
	internal let kDetailsRideModeKey: String = "ride_mode"
	internal let kDetailsCarNumberKey: String = "car_number"
	internal let kDetailsCarTypeNameFrenchKey: String = "car_type_name_french"
	internal let kDetailsBookingDateKey: String = "booking_date"
	internal let kDetailsReferralCodeSendKey: String = "referral_code_send"
	internal let kDetailsDriverPhoneKey: String = "driver_phone"
	internal let kDetailsCarTypeIdKey: String = "car_type_id"
	internal let kDetailsUserIdKey: String = "user_id"
	internal let kDetailsStartMeterReadingKey: String = "start_meter_reading"
	internal let kDetailsDriverAriveTimeKey: String = "driver_arive_time"
	internal let kDetailsPasswordCreatedKey: String = "password_created"
	internal let kDetailsFacebookFirstnameKey: String = "facebook_firstname"
	internal let kDetailsFreeRidesKey: String = "free_rides"
	internal let kDetailsEndMeterReadingImageKey: String = "end_meter_reading_image"
	internal let kDetailsEndLocationKey: String = "end_location"
	internal let kDetailsFacebookImageKey: String = "facebook_image"
	internal let kDetailsUserBookingDateTimeKey: String = "user_booking_date_time"
	internal let kDetailsRatingKey: String = "rating"
	internal let kDetailsTokenCreatedKey: String = "token_created"
	internal let kDetailsRentcardIdKey: String = "rentcard_id"
	internal let kDetailsEndMeterReadingKey: String = "end_meter_reading"
	internal let kDetailsGoogleMailKey: String = "google_mail"
	internal let kDetailsGoogleNameKey: String = "google_name"
	internal let kDetailsDriverImageKey: String = "driver_image"
	internal let kDetailsExtraDistanceTravelChargeKey: String = "extra_distance_travel_charge"
	internal let kDetailsExtraHoursTravelKey: String = "extra_hours_travel"
	internal let kDetailsBookingTimeKey: String = "booking_time"
	internal let kDetailsUserPhoneKey: String = "user_phone"
	internal let kDetailsTotalDistanceTravelKey: String = "total_distance_travel"
	internal let kDetailsFacebookMailKey: String = "facebook_mail"
	internal let kDetailsPickupLocationKey: String = "pickup_location"
	internal let kDetailsCarTypeNameKey: String = "car_type_name"
	internal let kDetailsDriverLocationKey: String = "driver_location"
	internal let kDetailsDriverIdKey: String = "driver_id"
	internal let kDetailsRentalPackageDistanceKey: String = "rental_package_distance"
	internal let kDetailsFinalBillAmountKey: String = "final_bill_amount"
	internal let kDetailsEmailVerifiedKey: String = "email_verified"
	internal let kDetailsFacebookIdKey: String = "facebook_id"
	internal let kDetailsRegisterDateKey: String = "register_date"
	internal let kDetailsCarAdminStatusKey: String = "car_admin_status"
	internal let kDetailsEndTimeKey: String = "end_time"
	internal let kDetailsFacebookLastnameKey: String = "facebook_lastname"
	internal let kDetailsEndLatKey: String = "end_lat"
	internal let kDetailsRentalBookingIdKey: String = "rental_booking_id"
	internal let kDetailsGoogleTokenKey: String = "google_token"
	internal let kDetailsDriverLatKey: String = "driver_lat"
	internal let kDetailsPickupLatKey: String = "pickup_lat"
	internal let kDetailsPhoneVerifiedKey: String = "phone_verified"
	internal let kDetailsDriverLongKey: String = "driver_long"
	internal let kDetailsPickupLongKey: String = "pickup_long"
    internal let kDetailsCouponCode: String = "coupan_code"
    internal let kDetailsCouponPrice: String =  "coupan_price"
    internal let kDetailsPaymentName: String = "payment_option_name"
    internal let kDetailsUserratingstar: String = "user_rating_star"
    internal let kDetailsDriverratingstar: String = "driver_rating_star"
    


    // MARK: Properties
	public var referralCode: String?
	public var bookingAdminStatus: String?
	public var driverRating: String?
	public var facebookToken: String?
	public var googleId: String?
	public var rentalPackageHours: String?
	public var lastUpdateTime: String?
	public var extraHoursTravelCharge: String?
	public var userImage: String?
	public var userName: String?
	public var flag: String?
	public var driverName: String?
	public var bookingType: String?
	public var googleImage: String?
	public var deviceId: String?
	public var carNameArabic: String?
	public var totalTimeTravel: String?
	public var endLong: String?
	public var loginLogout: String?
	public var userEmail: String?
	public var startMeterReadingImage: String?
	public var status: String?
	public var rentalPackagePrice: String?
	public var extraDistanceTravel: String?
	public var userPassword: String?
	public var bookingStatus: String?
	public var carTypeImage: String?
	public var beginTime: String?
	public var rideMode: String?
	public var carNumber: String?
	public var carTypeNameFrench: String?
	public var bookingDate: String?
	public var referralCodeSend: String?
	public var driverPhone: String?
	public var carTypeId: String?
	public var userId: String?
	public var startMeterReading: String?
	public var driverAriveTime: String?
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
	public var driverImage: String?
	public var extraDistanceTravelCharge: String?
	public var extraHoursTravel: String?
	public var bookingTime: String?
	public var userPhone: String?
	public var totalDistanceTravel: String?
	public var facebookMail: String?
	public var pickupLocation: String?
	public var carTypeName: String?
	public var driverLocation: String?
	public var driverId: String?
	public var rentalPackageDistance: String?
	public var finalBillAmount: String?
	public var emailVerified: String?
	public var facebookId: String?
	public var registerDate: String?
	public var carAdminStatus: String?
	public var endTime: String?
	public var facebookLastname: String?
	public var endLat: String?
	public var rentalBookingId: String?
	public var googleToken: String?
	public var driverLat: String?
	public var pickupLat: String?
	public var phoneVerified: String?
	public var driverLong: String?
	public var pickupLong: String?
    public var couponcode: String?
    public var couponprice: String?
     public var paymentname: String?
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
		bookingAdminStatus = json[kDetailsBookingAdminStatusKey].string
		driverRating = json[kDetailsDriverRatingKey].string
		facebookToken = json[kDetailsFacebookTokenKey].string
		googleId = json[kDetailsGoogleIdKey].string
		rentalPackageHours = json[kDetailsRentalPackageHoursKey].string
		lastUpdateTime = json[kDetailsLastUpdateTimeKey].string
		extraHoursTravelCharge = json[kDetailsExtraHoursTravelChargeKey].string
		userImage = json[kDetailsUserImageKey].string
		userName = json[kDetailsUserNameKey].string
		flag = json[kDetailsFlagKey].string
		driverName = json[kDetailsDriverNameKey].string
		bookingType = json[kDetailsBookingTypeKey].string
		googleImage = json[kDetailsGoogleImageKey].string
		deviceId = json[kDetailsDeviceIdKey].string
		carNameArabic = json[kDetailsCarNameArabicKey].string
		totalTimeTravel = json[kDetailsTotalTimeTravelKey].string
		endLong = json[kDetailsEndLongKey].string
		loginLogout = json[kDetailsLoginLogoutKey].string
		userEmail = json[kDetailsUserEmailKey].string
		startMeterReadingImage = json[kDetailsStartMeterReadingImageKey].string
		status = json[kDetailsStatusKey].string
		rentalPackagePrice = json[kDetailsRentalPackagePriceKey].string
		extraDistanceTravel = json[kDetailsExtraDistanceTravelKey].string
		userPassword = json[kDetailsUserPasswordKey].string
		bookingStatus = json[kDetailsBookingStatusKey].string
		carTypeImage = json[kDetailsCarTypeImageKey].string
		beginTime = json[kDetailsBeginTimeKey].string
		rideMode = json[kDetailsRideModeKey].string
		carNumber = json[kDetailsCarNumberKey].string
		carTypeNameFrench = json[kDetailsCarTypeNameFrenchKey].string
		bookingDate = json[kDetailsBookingDateKey].string
		referralCodeSend = json[kDetailsReferralCodeSendKey].string
		driverPhone = json[kDetailsDriverPhoneKey].string
		carTypeId = json[kDetailsCarTypeIdKey].string
		userId = json[kDetailsUserIdKey].string
		startMeterReading = json[kDetailsStartMeterReadingKey].string
		driverAriveTime = json[kDetailsDriverAriveTimeKey].string
		passwordCreated = json[kDetailsPasswordCreatedKey].string
		facebookFirstname = json[kDetailsFacebookFirstnameKey].string
		freeRides = json[kDetailsFreeRidesKey].string
		endMeterReadingImage = json[kDetailsEndMeterReadingImageKey].string
		endLocation = json[kDetailsEndLocationKey].string
		facebookImage = json[kDetailsFacebookImageKey].string
		userBookingDateTime = json[kDetailsUserBookingDateTimeKey].string
		rating = json[kDetailsRatingKey].string
		tokenCreated = json[kDetailsTokenCreatedKey].string
		rentcardId = json[kDetailsRentcardIdKey].string
		endMeterReading = json[kDetailsEndMeterReadingKey].string
		googleMail = json[kDetailsGoogleMailKey].string
		googleName = json[kDetailsGoogleNameKey].string
		driverImage = json[kDetailsDriverImageKey].string
		extraDistanceTravelCharge = json[kDetailsExtraDistanceTravelChargeKey].string
		extraHoursTravel = json[kDetailsExtraHoursTravelKey].string
		bookingTime = json[kDetailsBookingTimeKey].string
		userPhone = json[kDetailsUserPhoneKey].string
		totalDistanceTravel = json[kDetailsTotalDistanceTravelKey].string
		facebookMail = json[kDetailsFacebookMailKey].string
		pickupLocation = json[kDetailsPickupLocationKey].string
		carTypeName = json[kDetailsCarTypeNameKey].string
		driverLocation = json[kDetailsDriverLocationKey].string
		driverId = json[kDetailsDriverIdKey].string
		rentalPackageDistance = json[kDetailsRentalPackageDistanceKey].string
		finalBillAmount = json[kDetailsFinalBillAmountKey].string
		emailVerified = json[kDetailsEmailVerifiedKey].string
		facebookId = json[kDetailsFacebookIdKey].string
		registerDate = json[kDetailsRegisterDateKey].string
		carAdminStatus = json[kDetailsCarAdminStatusKey].string
		endTime = json[kDetailsEndTimeKey].string
		facebookLastname = json[kDetailsFacebookLastnameKey].string
		endLat = json[kDetailsEndLatKey].string
		rentalBookingId = json[kDetailsRentalBookingIdKey].string
		googleToken = json[kDetailsGoogleTokenKey].string
		driverLat = json[kDetailsDriverLatKey].string
		pickupLat = json[kDetailsPickupLatKey].string
		phoneVerified = json[kDetailsPhoneVerifiedKey].string
		driverLong = json[kDetailsDriverLongKey].string
		pickupLong = json[kDetailsPickupLongKey].string
        couponcode = json[kDetailsCouponCode].string
        couponprice = json[kDetailsCouponPrice].string
        paymentname = json[kDetailsPaymentName].string
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
		if bookingAdminStatus != nil {
			dictionary.updateValue(bookingAdminStatus! as AnyObject, forKey: kDetailsBookingAdminStatusKey)
		}
		if driverRating != nil {
			dictionary.updateValue(driverRating! as AnyObject, forKey: kDetailsDriverRatingKey)
		}
		if facebookToken != nil {
			dictionary.updateValue(facebookToken! as AnyObject, forKey: kDetailsFacebookTokenKey)
		}
		if googleId != nil {
			dictionary.updateValue(googleId! as AnyObject, forKey: kDetailsGoogleIdKey)
		}
		if rentalPackageHours != nil {
			dictionary.updateValue(rentalPackageHours! as AnyObject, forKey: kDetailsRentalPackageHoursKey)
		}
		if lastUpdateTime != nil {
			dictionary.updateValue(lastUpdateTime! as AnyObject, forKey: kDetailsLastUpdateTimeKey)
		}
		if extraHoursTravelCharge != nil {
			dictionary.updateValue(extraHoursTravelCharge! as AnyObject, forKey: kDetailsExtraHoursTravelChargeKey)
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
		if carNameArabic != nil {
			dictionary.updateValue(carNameArabic! as AnyObject, forKey: kDetailsCarNameArabicKey)
		}
		if totalTimeTravel != nil {
			dictionary.updateValue(totalTimeTravel! as AnyObject, forKey: kDetailsTotalTimeTravelKey)
		}
		if endLong != nil {
			dictionary.updateValue(endLong! as AnyObject, forKey: kDetailsEndLongKey)
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
		if rentalPackagePrice != nil {
			dictionary.updateValue(rentalPackagePrice! as AnyObject, forKey: kDetailsRentalPackagePriceKey)
		}
		if extraDistanceTravel != nil {
			dictionary.updateValue(extraDistanceTravel! as AnyObject, forKey: kDetailsExtraDistanceTravelKey)
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
		if beginTime != nil {
			dictionary.updateValue(beginTime! as AnyObject, forKey: kDetailsBeginTimeKey)
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
		if driverAriveTime != nil {
			dictionary.updateValue(driverAriveTime! as AnyObject, forKey: kDetailsDriverAriveTimeKey)
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
		if endMeterReadingImage != nil {
			dictionary.updateValue(endMeterReadingImage! as AnyObject, forKey: kDetailsEndMeterReadingImageKey)
		}
		if endLocation != nil {
			dictionary.updateValue(endLocation! as AnyObject, forKey: kDetailsEndLocationKey)
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
		if extraDistanceTravelCharge != nil {
			dictionary.updateValue(extraDistanceTravelCharge! as AnyObject, forKey: kDetailsExtraDistanceTravelChargeKey)
		}
		if extraHoursTravel != nil {
			dictionary.updateValue(extraHoursTravel! as AnyObject, forKey: kDetailsExtraHoursTravelKey)
		}
		if bookingTime != nil {
			dictionary.updateValue(bookingTime! as AnyObject, forKey: kDetailsBookingTimeKey)
		}
		if userPhone != nil {
			dictionary.updateValue(userPhone! as AnyObject, forKey: kDetailsUserPhoneKey)
		}
		if totalDistanceTravel != nil {
			dictionary.updateValue(totalDistanceTravel! as AnyObject, forKey: kDetailsTotalDistanceTravelKey)
		}
		if facebookMail != nil {
			dictionary.updateValue(facebookMail! as AnyObject, forKey: kDetailsFacebookMailKey)
		}
		if pickupLocation != nil {
			dictionary.updateValue(pickupLocation! as AnyObject, forKey: kDetailsPickupLocationKey)
		}
		if carTypeName != nil {
			dictionary.updateValue(carTypeName! as AnyObject, forKey: kDetailsCarTypeNameKey)
		}
		if driverLocation != nil {
			dictionary.updateValue(driverLocation! as AnyObject, forKey: kDetailsDriverLocationKey)
		}
		if driverId != nil {
			dictionary.updateValue(driverId! as AnyObject, forKey: kDetailsDriverIdKey)
		}
		if rentalPackageDistance != nil {
			dictionary.updateValue(rentalPackageDistance! as AnyObject, forKey: kDetailsRentalPackageDistanceKey)
		}
		if finalBillAmount != nil {
			dictionary.updateValue(finalBillAmount! as AnyObject, forKey: kDetailsFinalBillAmountKey)
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
		if endLat != nil {
			dictionary.updateValue(endLat! as AnyObject, forKey: kDetailsEndLatKey)
		}
		if rentalBookingId != nil {
			dictionary.updateValue(rentalBookingId! as AnyObject, forKey: kDetailsRentalBookingIdKey)
		}
		if googleToken != nil {
			dictionary.updateValue(googleToken! as AnyObject, forKey: kDetailsGoogleTokenKey)
		}
		if driverLat != nil {
			dictionary.updateValue(driverLat! as AnyObject, forKey: kDetailsDriverLatKey)
		}
		if pickupLat != nil {
			dictionary.updateValue(pickupLat! as AnyObject, forKey: kDetailsPickupLatKey)
		}
		if phoneVerified != nil {
			dictionary.updateValue(phoneVerified! as AnyObject, forKey: kDetailsPhoneVerifiedKey)
		}
		if driverLong != nil {
			dictionary.updateValue(driverLong! as AnyObject, forKey: kDetailsDriverLongKey)
		}
		if pickupLong != nil {
			dictionary.updateValue(pickupLong! as AnyObject, forKey: kDetailsPickupLongKey)
		}
        if couponcode != nil {
            dictionary.updateValue(couponcode! as AnyObject, forKey: kDetailsCouponCode)
        }
        
        if couponprice != nil {
            dictionary.updateValue(couponprice! as AnyObject, forKey: kDetailsCouponPrice)
        }
        if paymentname != nil {
            dictionary.updateValue(paymentname! as AnyObject, forKey: kDetailsPaymentName)
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
