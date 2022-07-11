//
//  Details.swift
//
//  Created by Rakesh kumar on 19/12/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class DetailsRide: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
    internal let kDetailsPickupLongKey: String = "pickup_long"
    internal let kDetailsLaterDateKey: String = "later_date"
    internal let kDetailsPaymentStatusKey: String = "payment_status"
    internal let kDetailsPaymentOptionNameKey: String = "payment_option_name"
    internal let kDetailsLaterTimeKey: String = "later_time"
    internal let kDetailsBeginLongKey: String = "begin_long"
    internal let kDetailsTimeKey: String = "time"
    internal let kDetailsDropLongKey: String = "drop_long"
    internal let kDetailsEndLocationKey: String = "end_location"
    internal let kDetailsRatingKey: String = "rating"
    internal let kDetailsPaymentOptionIdKey: String = "payment_option_id"
    internal let kDetailsLastTimeStampKey: String = "last_time_stamp"
    internal let kDetailsUserNameKey: String = "user_name"
    internal let kDetailsUserImageKey: String = "user_image"
    internal let kDetailsDistanceKey: String = "distance"
    internal let kDetailsRideDateKey: String = "ride_date"
    internal let kDetailsEndLongKey: String = "end_long"
    internal let kDetailsArrivedTimeKey: String = "arrived_time"
    internal let kDetailsCardIdKey: String = "card_id"
    internal let kDetailsRideImageKey: String = "ride_image"
    internal let kDetailsDropLocationKey: String = "drop_location"
    internal let kDetailsRideStatusKey: String = "ride_status"
    internal let kDetailsCouponCodeKey: String = "coupon_code"
    internal let kDetailsAmountKey: String = "amount"
    internal let kDetailsBeginLatKey: String = "begin_lat"
    internal let kDetailsRideTimeKey: String = "ride_time"
    internal let kDetailsTotalAmountKey: String = "total_amount"
    internal let kDetailsUserPhoneKey: String = "user_phone"
    internal let kDetailsPickupLocationKey: String = "pickup_location"
    internal let kDetailsBeginTimeKey: String = "begin_time"
    internal let kDetailsDoneRideTimeKey: String = "done_ride_time"
    internal let kDetailsDropLatKey: String = "drop_lat"
    internal let kDetailsDriverIdKey: String = "driver_id"
    internal let kDetailsRideIdKey: String = "ride_id"
    internal let kDetailsCouponsPriceKey: String = "coupons_price"
    internal let kDetailsRideTimePriceKey: String = "ride_time_price"
    internal let kDetailsWaitingTimeKey: String = "waiting_time"
    internal let kDetailsRideTypeKey: String = "ride_type"
    internal let kDetailsEndTimeKey: String = "end_time"
    internal let kDetailsReasonIdKey: String = "reason_id"
    internal let kDetailsEndLatKey: String = "end_lat"
    internal let kDetailsWaitingPriceKey: String = "waiting_price"
    internal let kDetailsUserIdKey: String = "user_id"
    internal let kDetailsCouponsCodeKey: String = "coupons_code"
    internal let kDetailsCarTypeIdKey: String = "car_type_id"
    internal let kDetailsRideAdminStatusKey: String = "ride_admin_status"
    internal let kDetailsPickupLatKey: String = "pickup_lat"
    internal let kDetailsBeginLocationKey: String = "begin_location"
    
    
    // MARK: Properties
    public var pickupLong: String?
    public var laterDate: String?
    public var paymentStatus: String?
    public var paymentOptionName: String?
    public var laterTime: String?
    public var beginLong: String?
    public var time: String?
    public var dropLong: String?
    public var endLocation: String?
    public var rating: String?
    public var paymentOptionId: String?
    public var lastTimeStamp: String?
    public var userName: String?
    public var userImage: String?
    public var distance: String?
    public var rideDate: String?
    public var endLong: String?
    public var arrivedTime: String?
    public var cardId: String?
    public var rideImage: String?
    public var dropLocation: String?
    public var rideStatus: String?
    public var couponCode: String?
    public var amount: String?
    public var beginLat: String?
    public var rideTime: String?
    public var totalAmount: String?
    public var userPhone: String?
    public var pickupLocation: String?
    public var beginTime: String?
    public var doneRideTime: String?
    public var dropLat: String?
    public var driverId: String?
    public var rideId: String?
    public var couponsPrice: String?
    public var rideTimePrice: String?
    public var waitingTime: String?
    public var rideType: String?
    public var endTime: String?
    public var reasonId: String?
    public var endLat: String?
    public var waitingPrice: String?
    public var userId: String?
    public var couponsCode: String?
    public var carTypeId: String?
    public var rideAdminStatus: String?
    public var pickupLat: String?
    public var beginLocation: String?
    
    
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
        laterDate = json[kDetailsLaterDateKey].string
        paymentStatus = json[kDetailsPaymentStatusKey].string
        paymentOptionName = json[kDetailsPaymentOptionNameKey].string
        laterTime = json[kDetailsLaterTimeKey].string
        beginLong = json[kDetailsBeginLongKey].string
        time = json[kDetailsTimeKey].string
        dropLong = json[kDetailsDropLongKey].string
        endLocation = json[kDetailsEndLocationKey].string
        rating = json[kDetailsRatingKey].string
        paymentOptionId = json[kDetailsPaymentOptionIdKey].string
        lastTimeStamp = json[kDetailsLastTimeStampKey].string
        userName = json[kDetailsUserNameKey].string
        userImage = json[kDetailsUserImageKey].string
        distance = json[kDetailsDistanceKey].string
        rideDate = json[kDetailsRideDateKey].string
        endLong = json[kDetailsEndLongKey].string
        arrivedTime = json[kDetailsArrivedTimeKey].string
        cardId = json[kDetailsCardIdKey].string
        rideImage = json[kDetailsRideImageKey].string
        dropLocation = json[kDetailsDropLocationKey].string
        rideStatus = json[kDetailsRideStatusKey].string
        couponCode = json[kDetailsCouponCodeKey].string
        amount = json[kDetailsAmountKey].string
        beginLat = json[kDetailsBeginLatKey].string
        rideTime = json[kDetailsRideTimeKey].string
        totalAmount = json[kDetailsTotalAmountKey].string
        userPhone = json[kDetailsUserPhoneKey].string
        pickupLocation = json[kDetailsPickupLocationKey].string
        beginTime = json[kDetailsBeginTimeKey].string
        doneRideTime = json[kDetailsDoneRideTimeKey].string
        dropLat = json[kDetailsDropLatKey].string
        driverId = json[kDetailsDriverIdKey].string
        rideId = json[kDetailsRideIdKey].string
        couponsPrice = json[kDetailsCouponsPriceKey].string
        rideTimePrice = json[kDetailsRideTimePriceKey].string
        waitingTime = json[kDetailsWaitingTimeKey].string
        rideType = json[kDetailsRideTypeKey].string
        endTime = json[kDetailsEndTimeKey].string
        reasonId = json[kDetailsReasonIdKey].string
        endLat = json[kDetailsEndLatKey].string
        waitingPrice = json[kDetailsWaitingPriceKey].string
        userId = json[kDetailsUserIdKey].string
        couponsCode = json[kDetailsCouponsCodeKey].string
        carTypeId = json[kDetailsCarTypeIdKey].string
        rideAdminStatus = json[kDetailsRideAdminStatusKey].string
        pickupLat = json[kDetailsPickupLatKey].string
        beginLocation = json[kDetailsBeginLocationKey].string
        
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
        if laterDate != nil {
            dictionary.updateValue(laterDate! as AnyObject, forKey: kDetailsLaterDateKey)
        }
        if paymentStatus != nil {
            dictionary.updateValue(paymentStatus! as AnyObject, forKey: kDetailsPaymentStatusKey)
        }
        if paymentOptionName != nil {
            dictionary.updateValue(paymentOptionName! as AnyObject, forKey: kDetailsPaymentOptionNameKey)
        }
        if laterTime != nil {
            dictionary.updateValue(laterTime! as AnyObject, forKey: kDetailsLaterTimeKey)
        }
        if beginLong != nil {
            dictionary.updateValue(beginLong! as AnyObject, forKey: kDetailsBeginLongKey)
        }
        if time != nil {
            dictionary.updateValue(time! as AnyObject, forKey: kDetailsTimeKey)
        }
        if dropLong != nil {
            dictionary.updateValue(dropLong! as AnyObject, forKey: kDetailsDropLongKey)
        }
        if endLocation != nil {
            dictionary.updateValue(endLocation! as AnyObject, forKey: kDetailsEndLocationKey)
        }
        if rating != nil {
            dictionary.updateValue(rating! as AnyObject, forKey: kDetailsRatingKey)
        }
        if paymentOptionId != nil {
            dictionary.updateValue(paymentOptionId! as AnyObject, forKey: kDetailsPaymentOptionIdKey)
        }
        if lastTimeStamp != nil {
            dictionary.updateValue(lastTimeStamp! as AnyObject, forKey: kDetailsLastTimeStampKey)
        }
        if userName != nil {
            dictionary.updateValue(userName! as AnyObject, forKey: kDetailsUserNameKey)
        }
        if userImage != nil {
            dictionary.updateValue(userImage! as AnyObject, forKey: kDetailsUserImageKey)
        }
        if distance != nil {
            dictionary.updateValue(distance! as AnyObject, forKey: kDetailsDistanceKey)
        }
        if rideDate != nil {
            dictionary.updateValue(rideDate! as AnyObject, forKey: kDetailsRideDateKey)
        }
        if endLong != nil {
            dictionary.updateValue(endLong! as AnyObject, forKey: kDetailsEndLongKey)
        }
        if arrivedTime != nil {
            dictionary.updateValue(arrivedTime! as AnyObject, forKey: kDetailsArrivedTimeKey)
        }
        if cardId != nil {
            dictionary.updateValue(cardId! as AnyObject, forKey: kDetailsCardIdKey)
        }
        if rideImage != nil {
            dictionary.updateValue(rideImage! as AnyObject, forKey: kDetailsRideImageKey)
        }
        if dropLocation != nil {
            dictionary.updateValue(dropLocation! as AnyObject, forKey: kDetailsDropLocationKey)
        }
        if rideStatus != nil {
            dictionary.updateValue(rideStatus! as AnyObject, forKey: kDetailsRideStatusKey)
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
        if userPhone != nil {
            dictionary.updateValue(userPhone! as AnyObject, forKey: kDetailsUserPhoneKey)
        }
        if pickupLocation != nil {
            dictionary.updateValue(pickupLocation! as AnyObject, forKey: kDetailsPickupLocationKey)
        }
        if beginTime != nil {
            dictionary.updateValue(beginTime! as AnyObject, forKey: kDetailsBeginTimeKey)
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
        if endTime != nil {
            dictionary.updateValue(endTime! as AnyObject, forKey: kDetailsEndTimeKey)
        }
        if reasonId != nil {
            dictionary.updateValue(reasonId! as AnyObject, forKey: kDetailsReasonIdKey)
        }
        if endLat != nil {
            dictionary.updateValue(endLat! as AnyObject, forKey: kDetailsEndLatKey)
        }
        if waitingPrice != nil {
            dictionary.updateValue(waitingPrice! as AnyObject, forKey: kDetailsWaitingPriceKey)
        }
        if userId != nil {
            dictionary.updateValue(userId! as AnyObject, forKey: kDetailsUserIdKey)
        }
        if couponsCode != nil {
            dictionary.updateValue(couponsCode! as AnyObject, forKey: kDetailsCouponsCodeKey)
        }
        if carTypeId != nil {
            dictionary.updateValue(carTypeId! as AnyObject, forKey: kDetailsCarTypeIdKey)
        }
        if rideAdminStatus != nil {
            dictionary.updateValue(rideAdminStatus! as AnyObject, forKey: kDetailsRideAdminStatusKey)
        }
        if pickupLat != nil {
            dictionary.updateValue(pickupLat! as AnyObject, forKey: kDetailsPickupLatKey)
        }
        if beginLocation != nil {
            dictionary.updateValue(beginLocation! as AnyObject, forKey: kDetailsBeginLocationKey)
        }
        
        return dictionary
    }
    
}

