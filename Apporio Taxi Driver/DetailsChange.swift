
//
//  Details.swift
//
//  Created by Nitu on 26/07/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class DetailsChange: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kDetailsPickupLongKey: String = "pickup_long"
	internal let kDetailsPaymentStatusKey: String = "payment_status"
	internal let kDetailsDriverRatingKey: String = "driver_rating"
	internal let kDetailsPaymentOptionNameKey: String = "payment_option_name"
	internal let kDetailsBeginLongKey: String = "begin_long"
	internal let kDetailsBeginLocationKey: String = "begin_location"
	internal let kDetailsTimeKey: String = "time"
	internal let kDetailsEndLocationKey: String = "end_location"
	internal let kDetailsPaymentOptionIdKey: String = "payment_option_id"
	internal let kDetailsDriverImageKey: String = "driver_image"
	internal let kDetailsCarModelNameKey: String = "car_model_name"
	internal let kDetailsDriverNameKey: String = "driver_name"
	internal let kDetailsDistanceKey: String = "distance"
	internal let kDetailsRideDateKey: String = "ride_date"
	internal let kDetailsArrivedTimeKey: String = "arrived_time"
	internal let kDetailsRideStatusKey: String = "ride_status"
	internal let kDetailsRideImageKey: String = "ride_image"
	internal let kDetailsDropLocationKey: String = "drop_location"
	internal let kDetailsCouponCodeKey: String = "coupon_code"
	internal let kDetailsAmountKey: String = "amount"
	internal let kDetailsBeginLatKey: String = "begin_lat"
	internal let kDetailsRideTimeKey: String = "ride_time"
	internal let kDetailsTotalAmountKey: String = "total_amount"
	internal let kDetailsCarTypeNameKey: String = "car_type_name"
	internal let kDetailsCarTypeImageKey: String = "car_type_image"
	internal let kDetailsPickupLocationKey: String = "pickup_location"
	internal let kDetailsDriverLocationKey: String = "driver_location"
	internal let kDetailsDoneRideTimeKey: String = "done_ride_time"
	internal let kDetailsDropLatKey: String = "drop_lat"
	internal let kDetailsDriverIdKey: String = "driver_id"
	internal let kDetailsRideIdKey: String = "ride_id"
	internal let kDetailsCouponsPriceKey: String = "coupons_price"
	internal let kDetailsRideTimePriceKey: String = "ride_time_price"
	internal let kDetailsWaitingTimeKey: String = "waiting_time"
	internal let kDetailsRideTypeKey: String = "ride_type"
	internal let kDetailsBeginTimeKey: String = "begin_time"
	internal let kDetailsCarNumberKey: String = "car_number"
	internal let kDetailsEndTimeKey: String = "end_time"
	internal let kDetailsDriverPhoneKey: String = "driver_phone"
	internal let kDetailsWaitingPriceKey: String = "waiting_price"
	internal let kDetailsDriverLongKey: String = "driver_long"
	internal let kDetailsDoneRideIdKey: String = "done_ride_id"
	internal let kDetailsUserIdKey: String = "user_id"
	internal let kDetailsDriverLatKey: String = "driver_lat"
	internal let kDetailsPickupLatKey: String = "pickup_lat"
	internal let kDetailsDropLongKey: String = "drop_long"


    // MARK: Properties
	public var pickupLong: String?
	public var paymentStatus: String?
	public var driverRating: String?
	public var paymentOptionName: String?
	public var beginLong: String?
	public var beginLocation: String?
	public var time: String?
	public var endLocation: String?
	public var paymentOptionId: String?
	public var driverImage: String?
	public var carModelName: String?
	public var driverName: String?
	public var distance: String?
	public var rideDate: String?
	public var arrivedTime: String?
	public var rideStatus: String?
	public var rideImage: String?
	public var dropLocation: String?
	public var couponCode: String?
	public var amount: String?
	public var beginLat: String?
	public var rideTime: String?
	public var totalAmount: String?
	public var carTypeName: String?
	public var carTypeImage: String?
	public var pickupLocation: String?
	public var driverLocation: String?
	public var doneRideTime: String?
	public var dropLat: String?
	public var driverId: String?
	public var rideId: String?
	public var couponsPrice: String?
	public var rideTimePrice: String?
	public var waitingTime: String?
	public var rideType: String?
	public var beginTime: String?
	public var carNumber: String?
	public var endTime: String?
	public var driverPhone: String?
	public var waitingPrice: String?
	public var driverLong: String?
	public var doneRideId: String?
	public var userId: String?
	public var driverLat: String?
	public var pickupLat: String?
	public var dropLong: String?


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
		pickupLong = json[kDetailsPickupLongKey].string
		paymentStatus = json[kDetailsPaymentStatusKey].string
		driverRating = json[kDetailsDriverRatingKey].string
		paymentOptionName = json[kDetailsPaymentOptionNameKey].string
		beginLong = json[kDetailsBeginLongKey].string
		beginLocation = json[kDetailsBeginLocationKey].string
		time = json[kDetailsTimeKey].string
		endLocation = json[kDetailsEndLocationKey].string
		paymentOptionId = json[kDetailsPaymentOptionIdKey].string
		driverImage = json[kDetailsDriverImageKey].string
		carModelName = json[kDetailsCarModelNameKey].string
		driverName = json[kDetailsDriverNameKey].string
		distance = json[kDetailsDistanceKey].string
		rideDate = json[kDetailsRideDateKey].string
		arrivedTime = json[kDetailsArrivedTimeKey].string
		rideStatus = json[kDetailsRideStatusKey].string
		rideImage = json[kDetailsRideImageKey].string
		dropLocation = json[kDetailsDropLocationKey].string
		couponCode = json[kDetailsCouponCodeKey].string
		amount = json[kDetailsAmountKey].string
		beginLat = json[kDetailsBeginLatKey].string
		rideTime = json[kDetailsRideTimeKey].string
		totalAmount = json[kDetailsTotalAmountKey].string
		carTypeName = json[kDetailsCarTypeNameKey].string
		carTypeImage = json[kDetailsCarTypeImageKey].string
		pickupLocation = json[kDetailsPickupLocationKey].string
		driverLocation = json[kDetailsDriverLocationKey].string
		doneRideTime = json[kDetailsDoneRideTimeKey].string
		dropLat = json[kDetailsDropLatKey].string
		driverId = json[kDetailsDriverIdKey].string
		rideId = json[kDetailsRideIdKey].string
		couponsPrice = json[kDetailsCouponsPriceKey].string
		rideTimePrice = json[kDetailsRideTimePriceKey].string
		waitingTime = json[kDetailsWaitingTimeKey].string
		rideType = json[kDetailsRideTypeKey].string
		beginTime = json[kDetailsBeginTimeKey].string
		carNumber = json[kDetailsCarNumberKey].string
		endTime = json[kDetailsEndTimeKey].string
		driverPhone = json[kDetailsDriverPhoneKey].string
		waitingPrice = json[kDetailsWaitingPriceKey].string
		driverLong = json[kDetailsDriverLongKey].string
		doneRideId = json[kDetailsDoneRideIdKey].string
		userId = json[kDetailsUserIdKey].string
		driverLat = json[kDetailsDriverLatKey].string
		pickupLat = json[kDetailsPickupLatKey].string
		dropLong = json[kDetailsDropLongKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if pickupLong != nil {
			dictionary.updateValue(pickupLong! as AnyObject, forKey: kDetailsPickupLongKey)
		}
		if paymentStatus != nil {
			dictionary.updateValue(paymentStatus! as AnyObject, forKey: kDetailsPaymentStatusKey)
		}
		if driverRating != nil {
			dictionary.updateValue(driverRating! as AnyObject, forKey: kDetailsDriverRatingKey)
		}
		if paymentOptionName != nil {
			dictionary.updateValue(paymentOptionName! as AnyObject, forKey: kDetailsPaymentOptionNameKey)
		}
		if beginLong != nil {
			dictionary.updateValue(beginLong! as AnyObject, forKey: kDetailsBeginLongKey)
		}
		if beginLocation != nil {
			dictionary.updateValue(beginLocation! as AnyObject, forKey: kDetailsBeginLocationKey)
		}
		if time != nil {
			dictionary.updateValue(time! as AnyObject, forKey: kDetailsTimeKey)
		}
		if endLocation != nil {
			dictionary.updateValue(endLocation! as AnyObject, forKey: kDetailsEndLocationKey)
		}
		if paymentOptionId != nil {
			dictionary.updateValue(paymentOptionId! as AnyObject, forKey: kDetailsPaymentOptionIdKey)
		}
		if driverImage != nil {
			dictionary.updateValue(driverImage! as AnyObject, forKey: kDetailsDriverImageKey)
		}
		if carModelName != nil {
			dictionary.updateValue(carModelName! as AnyObject, forKey: kDetailsCarModelNameKey)
		}
		if driverName != nil {
			dictionary.updateValue(driverName! as AnyObject, forKey: kDetailsDriverNameKey)
		}
		if distance != nil {
			dictionary.updateValue(distance! as AnyObject, forKey: kDetailsDistanceKey)
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
		if amount != nil {
			dictionary.updateValue(amount! as AnyObject, forKey: kDetailsAmountKey)
		}
		if beginLat != nil {
			dictionary.updateValue(beginLat! as AnyObject, forKey: kDetailsBeginLatKey)
		}
		if rideTime != nil {
			dictionary.updateValue(rideTime! as AnyObject, forKey: kDetailsRideTimeKey)
		}
		if totalAmount != nil {
			dictionary.updateValue(totalAmount! as AnyObject, forKey: kDetailsTotalAmountKey)
		}
		if carTypeName != nil {
			dictionary.updateValue(carTypeName! as AnyObject, forKey: kDetailsCarTypeNameKey)
		}
		if carTypeImage != nil {
			dictionary.updateValue(carTypeImage! as AnyObject, forKey: kDetailsCarTypeImageKey)
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
		if rideId != nil {
			dictionary.updateValue(rideId! as AnyObject, forKey: kDetailsRideIdKey)
		}
		if couponsPrice != nil {
			dictionary.updateValue(couponsPrice! as AnyObject, forKey: kDetailsCouponsPriceKey)
		}
		if rideTimePrice != nil {
			dictionary.updateValue(rideTimePrice! as AnyObject, forKey: kDetailsRideTimePriceKey)
		}
		if waitingTime != nil {
			dictionary.updateValue(waitingTime! as AnyObject, forKey: kDetailsWaitingTimeKey)
		}
		if rideType != nil {
			dictionary.updateValue(rideType! as AnyObject, forKey: kDetailsRideTypeKey)
		}
		if beginTime != nil {
			dictionary.updateValue(beginTime! as AnyObject, forKey: kDetailsBeginTimeKey)
		}
		if carNumber != nil {
			dictionary.updateValue(carNumber! as AnyObject, forKey: kDetailsCarNumberKey)
		}
		if endTime != nil {
			dictionary.updateValue(endTime! as AnyObject, forKey: kDetailsEndTimeKey)
		}
		if driverPhone != nil {
			dictionary.updateValue(driverPhone! as AnyObject, forKey: kDetailsDriverPhoneKey)
		}
		if waitingPrice != nil {
			dictionary.updateValue(waitingPrice! as AnyObject, forKey: kDetailsWaitingPriceKey)
		}
		if driverLong != nil {
			dictionary.updateValue(driverLong! as AnyObject, forKey: kDetailsDriverLongKey)
		}
		if doneRideId != nil {
			dictionary.updateValue(doneRideId! as AnyObject, forKey: kDetailsDoneRideIdKey)
		}
		if userId != nil {
			dictionary.updateValue(userId! as AnyObject, forKey: kDetailsUserIdKey)
		}
		if driverLat != nil {
			dictionary.updateValue(driverLat! as AnyObject, forKey: kDetailsDriverLatKey)
		}
		if pickupLat != nil {
			dictionary.updateValue(pickupLat! as AnyObject, forKey: kDetailsPickupLatKey)
		}
		if dropLong != nil {
			dictionary.updateValue(dropLong! as AnyObject, forKey: kDetailsDropLongKey)
		}

        return dictionary
    }

}
