//
//  Details.swift
//
//  Created by AppOrio on 05/07/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class RentalRideFareDetails: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kDetailsBookingAdminStatusKey: String = "booking_admin_status"
	internal let kDetailsBeginLongKey: String = "begin_long"
	internal let kDetailsEndMeterReadingImageKey: String = "end_meter_reading_image"
	internal let kDetailsRentalPackageHoursKey: String = "rental_package_hours"
	internal let kDetailsLastUpdateTimeKey: String = "last_update_time"
	internal let kDetailsExtraHoursTravelChargeKey: String = "extra_hours_travel_charge"
	internal let kDetailsDoneRentalBookingIdKey: String = "done_rental_booking_id"
	internal let kDetailsUserBookingDateTimeKey: String = "user_booking_date_time"
	internal let kDetailsRentcardIdKey: String = "rentcard_id"
	internal let kDetailsEndLocationKey: String = "end_location"
	internal let kDetailsEndMeterReadingKey: String = "end_meter_reading"
	internal let kDetailsUserNameKey: String = "user_name"
	internal let kDetailsEndDateKey: String = "end_date"
	internal let kDetailsBookingTypeKey: String = "booking_type"
	internal let kDetailsEndLongKey: String = "end_long"
	internal let kDetailsExtraHoursTravelKey: String = "extra_hours_travel"
	internal let kDetailsTotalTimeTravelKey: String = "total_time_travel"
	internal let kDetailsExtraDistanceTravelChargeKey: String = "extra_distance_travel_charge"
	internal let kDetailsUserEmailKey: String = "user_email"
	internal let kDetailsStartMeterReadingImageKey: String = "start_meter_reading_image"
	internal let kDetailsBookingTimeKey: String = "booking_time"
	internal let kDetailsBeginLatKey: String = "begin_lat"
	internal let kDetailsRentalPackagePriceKey: String = "rental_package_price"
	internal let kDetailsExtraDistanceTravelKey: String = "extra_distance_travel"
	internal let kDetailsTotalDistanceTravelKey: String = "total_distance_travel"
	internal let kDetailsUserPhoneKey: String = "user_phone"
	internal let kDetailsBookingStatusKey: String = "booking_status"
	internal let kDetailsPickupLocationKey: String = "pickup_location"
	internal let kDetailsBeginTimeKey: String = "begin_time"
	internal let kDetailsDriverIdKey: String = "driver_id"
	internal let kDetailsRentalPackageDistanceKey: String = "rental_package_distance"
	internal let kDetailsBeginDateKey: String = "begin_date"
	internal let kDetailsFinalBillAmountKey: String = "final_bill_amount"
	internal let kDetailsRentalBookingIdKey: String = "rental_booking_id"
	internal let kDetailsBookingDateKey: String = "booking_date"
	internal let kDetailsEndTimeKey: String = "end_time"
	internal let kDetailsEndLatKey: String = "end_lat"
	internal let kDetailsUserIdKey: String = "user_id"
	internal let kDetailsStartMeterReadingKey: String = "start_meter_reading"
	internal let kDetailsDriverAriveTimeKey: String = "driver_arive_time"
	internal let kDetailsPickupLatKey: String = "pickup_lat"
	internal let kDetailsCarTypeIdKey: String = "car_type_id"
	internal let kDetailsPickupLongKey: String = "pickup_long"
	internal let kDetailsBeginLocationKey: String = "begin_location"
    internal let kDetailsCouponCode: String = "coupan_code"
    internal let kDetailsCouponPrice: String =  "coupan_price"
     internal let kDetailsTotalAmount: String = "total_amount"
    


    // MARK: Properties
	public var bookingAdminStatus: String?
	public var beginLong: String?
	public var endMeterReadingImage: String?
	public var rentalPackageHours: String?
	public var lastUpdateTime: String?
	public var extraHoursTravelCharge: String?
	public var doneRentalBookingId: String?
	public var userBookingDateTime: String?
	public var rentcardId: String?
	public var endLocation: String?
	public var endMeterReading: String?
	public var userName: String?
	public var endDate: String?
	public var bookingType: String?
	public var endLong: String?
	public var extraHoursTravel: String?
	public var totalTimeTravel: String?
	public var extraDistanceTravelCharge: String?
	public var userEmail: String?
	public var startMeterReadingImage: String?
	public var bookingTime: String?
	public var beginLat: String?
	public var rentalPackagePrice: String?
	public var extraDistanceTravel: String?
	public var totalDistanceTravel: String?
	public var userPhone: String?
	public var bookingStatus: String?
	public var pickupLocation: String?
	public var beginTime: String?
	public var driverId: String?
	public var rentalPackageDistance: String?
	public var beginDate: String?
	public var finalBillAmount: String?
	public var rentalBookingId: String?
	public var bookingDate: String?
	public var endTime: String?
	public var endLat: String?
	public var userId: String?
	public var startMeterReading: String?
	public var driverAriveTime: String?
	public var pickupLat: String?
	public var carTypeId: String?
	public var pickupLong: String?
	public var beginLocation: String?
    public var couponcode: String?
    public var couponprice: String?
     public var totalamount: String?


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
		beginLong = json[kDetailsBeginLongKey].string
		endMeterReadingImage = json[kDetailsEndMeterReadingImageKey].string
		rentalPackageHours = json[kDetailsRentalPackageHoursKey].string
		lastUpdateTime = json[kDetailsLastUpdateTimeKey].string
		extraHoursTravelCharge = json[kDetailsExtraHoursTravelChargeKey].string
		doneRentalBookingId = json[kDetailsDoneRentalBookingIdKey].string
		userBookingDateTime = json[kDetailsUserBookingDateTimeKey].string
		rentcardId = json[kDetailsRentcardIdKey].string
		endLocation = json[kDetailsEndLocationKey].string
		endMeterReading = json[kDetailsEndMeterReadingKey].string
		userName = json[kDetailsUserNameKey].string
		endDate = json[kDetailsEndDateKey].string
		bookingType = json[kDetailsBookingTypeKey].string
		endLong = json[kDetailsEndLongKey].string
		extraHoursTravel = json[kDetailsExtraHoursTravelKey].string
		totalTimeTravel = json[kDetailsTotalTimeTravelKey].string
		extraDistanceTravelCharge = json[kDetailsExtraDistanceTravelChargeKey].string
		userEmail = json[kDetailsUserEmailKey].string
		startMeterReadingImage = json[kDetailsStartMeterReadingImageKey].string
		bookingTime = json[kDetailsBookingTimeKey].string
		beginLat = json[kDetailsBeginLatKey].string
		rentalPackagePrice = json[kDetailsRentalPackagePriceKey].string
		extraDistanceTravel = json[kDetailsExtraDistanceTravelKey].string
		totalDistanceTravel = json[kDetailsTotalDistanceTravelKey].string
		userPhone = json[kDetailsUserPhoneKey].string
		bookingStatus = json[kDetailsBookingStatusKey].string
		pickupLocation = json[kDetailsPickupLocationKey].string
		beginTime = json[kDetailsBeginTimeKey].string
		driverId = json[kDetailsDriverIdKey].string
		rentalPackageDistance = json[kDetailsRentalPackageDistanceKey].string
		beginDate = json[kDetailsBeginDateKey].string
		finalBillAmount = json[kDetailsFinalBillAmountKey].string
		rentalBookingId = json[kDetailsRentalBookingIdKey].string
		bookingDate = json[kDetailsBookingDateKey].string
		endTime = json[kDetailsEndTimeKey].string
		endLat = json[kDetailsEndLatKey].string
		userId = json[kDetailsUserIdKey].string
		startMeterReading = json[kDetailsStartMeterReadingKey].string
		driverAriveTime = json[kDetailsDriverAriveTimeKey].string
		pickupLat = json[kDetailsPickupLatKey].string
		carTypeId = json[kDetailsCarTypeIdKey].string
		pickupLong = json[kDetailsPickupLongKey].string
		beginLocation = json[kDetailsBeginLocationKey].string
        couponcode = json[kDetailsCouponCode].string
        couponprice = json[kDetailsCouponPrice].string
        totalamount = json[kDetailsTotalAmount].string

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
		if beginLong != nil {
			dictionary.updateValue(beginLong! as AnyObject, forKey: kDetailsBeginLongKey)
		}
		if endMeterReadingImage != nil {
			dictionary.updateValue(endMeterReadingImage! as AnyObject, forKey: kDetailsEndMeterReadingImageKey)
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
		if doneRentalBookingId != nil {
			dictionary.updateValue(doneRentalBookingId! as AnyObject, forKey: kDetailsDoneRentalBookingIdKey)
		}
		if userBookingDateTime != nil {
			dictionary.updateValue(userBookingDateTime! as AnyObject, forKey: kDetailsUserBookingDateTimeKey)
		}
		if rentcardId != nil {
			dictionary.updateValue(rentcardId! as AnyObject, forKey: kDetailsRentcardIdKey)
		}
		if endLocation != nil {
			dictionary.updateValue(endLocation! as AnyObject, forKey: kDetailsEndLocationKey)
		}
		if endMeterReading != nil {
			dictionary.updateValue(endMeterReading! as AnyObject, forKey: kDetailsEndMeterReadingKey)
		}
		if userName != nil {
			dictionary.updateValue(userName! as AnyObject, forKey: kDetailsUserNameKey)
		}
		if endDate != nil {
			dictionary.updateValue(endDate! as AnyObject, forKey: kDetailsEndDateKey)
		}
		if bookingType != nil {
			dictionary.updateValue(bookingType! as AnyObject, forKey: kDetailsBookingTypeKey)
		}
		if endLong != nil {
			dictionary.updateValue(endLong! as AnyObject, forKey: kDetailsEndLongKey)
		}
		if extraHoursTravel != nil {
			dictionary.updateValue(extraHoursTravel! as AnyObject, forKey: kDetailsExtraHoursTravelKey)
		}
		if totalTimeTravel != nil {
			dictionary.updateValue(totalTimeTravel! as AnyObject, forKey: kDetailsTotalTimeTravelKey)
		}
		if extraDistanceTravelCharge != nil {
			dictionary.updateValue(extraDistanceTravelCharge! as AnyObject, forKey: kDetailsExtraDistanceTravelChargeKey)
		}
		if userEmail != nil {
			dictionary.updateValue(userEmail! as AnyObject, forKey: kDetailsUserEmailKey)
		}
		if startMeterReadingImage != nil {
			dictionary.updateValue(startMeterReadingImage! as AnyObject, forKey: kDetailsStartMeterReadingImageKey)
		}
		if bookingTime != nil {
			dictionary.updateValue(bookingTime! as AnyObject, forKey: kDetailsBookingTimeKey)
		}
		if beginLat != nil {
			dictionary.updateValue(beginLat! as AnyObject, forKey: kDetailsBeginLatKey)
		}
		if rentalPackagePrice != nil {
			dictionary.updateValue(rentalPackagePrice! as AnyObject, forKey: kDetailsRentalPackagePriceKey)
		}
		if extraDistanceTravel != nil {
			dictionary.updateValue(extraDistanceTravel! as AnyObject, forKey: kDetailsExtraDistanceTravelKey)
		}
		if totalDistanceTravel != nil {
			dictionary.updateValue(totalDistanceTravel! as AnyObject, forKey: kDetailsTotalDistanceTravelKey)
		}
		if userPhone != nil {
			dictionary.updateValue(userPhone! as AnyObject, forKey: kDetailsUserPhoneKey)
		}
		if bookingStatus != nil {
			dictionary.updateValue(bookingStatus! as AnyObject, forKey: kDetailsBookingStatusKey)
		}
		if pickupLocation != nil {
			dictionary.updateValue(pickupLocation! as AnyObject, forKey: kDetailsPickupLocationKey)
		}
		if beginTime != nil {
			dictionary.updateValue(beginTime! as AnyObject, forKey: kDetailsBeginTimeKey)
		}
		if driverId != nil {
			dictionary.updateValue(driverId! as AnyObject, forKey: kDetailsDriverIdKey)
		}
		if rentalPackageDistance != nil {
			dictionary.updateValue(rentalPackageDistance! as AnyObject, forKey: kDetailsRentalPackageDistanceKey)
		}
		if beginDate != nil {
			dictionary.updateValue(beginDate! as AnyObject, forKey: kDetailsBeginDateKey)
		}
		if finalBillAmount != nil {
			dictionary.updateValue(finalBillAmount! as AnyObject, forKey: kDetailsFinalBillAmountKey)
		}
		if rentalBookingId != nil {
			dictionary.updateValue(rentalBookingId! as AnyObject, forKey: kDetailsRentalBookingIdKey)
		}
		if bookingDate != nil {
			dictionary.updateValue(bookingDate! as AnyObject, forKey: kDetailsBookingDateKey)
		}
		if endTime != nil {
			dictionary.updateValue(endTime! as AnyObject, forKey: kDetailsEndTimeKey)
		}
		if endLat != nil {
			dictionary.updateValue(endLat! as AnyObject, forKey: kDetailsEndLatKey)
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
		if pickupLat != nil {
			dictionary.updateValue(pickupLat! as AnyObject, forKey: kDetailsPickupLatKey)
		}
		if carTypeId != nil {
			dictionary.updateValue(carTypeId! as AnyObject, forKey: kDetailsCarTypeIdKey)
		}
		if pickupLong != nil {
			dictionary.updateValue(pickupLong! as AnyObject, forKey: kDetailsPickupLongKey)
		}
		if beginLocation != nil {
			dictionary.updateValue(beginLocation! as AnyObject, forKey: kDetailsBeginLocationKey)
		}
        if couponcode != nil {
            dictionary.updateValue(couponcode! as AnyObject, forKey: kDetailsCouponCode)
        }
        
        if couponprice != nil {
            dictionary.updateValue(couponprice! as AnyObject, forKey: kDetailsCouponPrice)
        }
        if totalamount != nil {
            dictionary.updateValue(totalamount! as AnyObject, forKey: kDetailsTotalAmount)
        }
        


        return dictionary
    }

}
