//
//  Details.swift
//
//  Created by Rakesh kumar on 19/12/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class DetailsEnd: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kDetailsBeginLatKey: String = "begin_lat"
	internal let kDetailsPaymentStatusKey: String = "payment_status"
	internal let kDetailsRideTimeKey: String = "ride_time"
	internal let kDetailsBeginLongKey: String = "begin_long"
	internal let kDetailsTotTimeKey: String = "tot_time"
	internal let kDetailsEndLocationKey: String = "end_location"
	internal let kDetailsBeginTimeKey: String = "begin_time"
	internal let kDetailsDriverIdKey: String = "driver_id"
	internal let kDetailsRideIdKey: String = "ride_id"
	internal let kDetailsWaitingTimeKey: String = "waiting_time"
	internal let kDetailsArrivedTimeKey: String = "arrived_time"
	internal let kDetailsDistanceKey: String = "distance"
	internal let kDetailsEndLongKey: String = "end_long"
	internal let kDetailsEndTimeKey: String = "end_time"
	internal let kDetailsEndLatKey: String = "end_lat"
	internal let kDetailsDoneRideIdKey: String = "done_ride_id"
	internal let kDetailsAmountKey: String = "amount"
	internal let kDetailsBeginLocationKey: String = "begin_location"


    // MARK: Properties
	public var beginLat: String?
	public var paymentStatus: String?
	public var rideTime: String?
	public var beginLong: String?
	public var totTime: String?
	public var endLocation: String?
	public var beginTime: String?
	public var driverId: String?
	public var rideId: String?
	public var waitingTime: String?
	public var arrivedTime: String?
	public var distance: String?
	public var endLong: String?
	public var endTime: String?
	public var endLat: String?
	public var doneRideId: String?
	public var amount: String?
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
		beginLat = json[kDetailsBeginLatKey].string
		paymentStatus = json[kDetailsPaymentStatusKey].string
		rideTime = json[kDetailsRideTimeKey].string
		beginLong = json[kDetailsBeginLongKey].string
		totTime = json[kDetailsTotTimeKey].string
		endLocation = json[kDetailsEndLocationKey].string
		beginTime = json[kDetailsBeginTimeKey].string
		driverId = json[kDetailsDriverIdKey].string
		rideId = json[kDetailsRideIdKey].string
		waitingTime = json[kDetailsWaitingTimeKey].string
		arrivedTime = json[kDetailsArrivedTimeKey].string
		distance = json[kDetailsDistanceKey].string
		endLong = json[kDetailsEndLongKey].string
		endTime = json[kDetailsEndTimeKey].string
		endLat = json[kDetailsEndLatKey].string
		doneRideId = json[kDetailsDoneRideIdKey].string
		amount = json[kDetailsAmountKey].string
		beginLocation = json[kDetailsBeginLocationKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if beginLat != nil {
			dictionary.updateValue(beginLat! as AnyObject, forKey: kDetailsBeginLatKey)
		}
		if paymentStatus != nil {
			dictionary.updateValue(paymentStatus! as AnyObject, forKey: kDetailsPaymentStatusKey)
		}
		if rideTime != nil {
			dictionary.updateValue(rideTime! as AnyObject, forKey: kDetailsRideTimeKey)
		}
		if beginLong != nil {
			dictionary.updateValue(beginLong! as AnyObject, forKey: kDetailsBeginLongKey)
		}
		if totTime != nil {
			dictionary.updateValue(totTime! as AnyObject, forKey: kDetailsTotTimeKey)
		}
		if endLocation != nil {
			dictionary.updateValue(endLocation! as AnyObject, forKey: kDetailsEndLocationKey)
		}
		if beginTime != nil {
			dictionary.updateValue(beginTime! as AnyObject, forKey: kDetailsBeginTimeKey)
		}
		if driverId != nil {
			dictionary.updateValue(driverId! as AnyObject, forKey: kDetailsDriverIdKey)
		}
		if rideId != nil {
			dictionary.updateValue(rideId! as AnyObject, forKey: kDetailsRideIdKey)
		}
		if waitingTime != nil {
			dictionary.updateValue(waitingTime! as AnyObject, forKey: kDetailsWaitingTimeKey)
		}
		if arrivedTime != nil {
			dictionary.updateValue(arrivedTime! as AnyObject, forKey: kDetailsArrivedTimeKey)
		}
		if distance != nil {
			dictionary.updateValue(distance! as AnyObject, forKey: kDetailsDistanceKey)
		}
		if endLong != nil {
			dictionary.updateValue(endLong! as AnyObject, forKey: kDetailsEndLongKey)
		}
		if endTime != nil {
			dictionary.updateValue(endTime! as AnyObject, forKey: kDetailsEndTimeKey)
		}
		if endLat != nil {
			dictionary.updateValue(endLat! as AnyObject, forKey: kDetailsEndLatKey)
		}
		if doneRideId != nil {
			dictionary.updateValue(doneRideId! as AnyObject, forKey: kDetailsDoneRideIdKey)
		}
		if amount != nil {
			dictionary.updateValue(amount! as AnyObject, forKey: kDetailsAmountKey)
		}
		if beginLocation != nil {
			dictionary.updateValue(beginLocation! as AnyObject, forKey: kDetailsBeginLocationKey)
		}

        return dictionary
    }

}
