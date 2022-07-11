//
//  Details.swift
//
//  Created by AppOrio on 04/07/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class AllRidesDetails: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kDetailsBookingIdKey: String = "booking_id"
	internal let kDetailsRideModeKey: String = "ride_mode"
	internal let kDetailsUserRideIdKey: String = "user_ride_id"
	internal let kDetailsUserIdKey: String = "user_id"
	internal let kDetailsNormalRideKey: String = "Normal_Ride"
	internal let kDetailsRentalRideKey: String = "Rental_Ride"
	internal let kDetailsDriverIdKey: String = "driver_id"


    // MARK: Properties
	public var bookingId: String?
	public var rideMode: String?
	public var userRideId: String?
	public var userId: String?
	public var normalRide: NormalRide?
	public var rentalRide: RentalRide?
	public var driverId: String?


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
		bookingId = json[kDetailsBookingIdKey].string
		rideMode = json[kDetailsRideModeKey].string
		userRideId = json[kDetailsUserRideIdKey].string
		userId = json[kDetailsUserIdKey].string
		normalRide = NormalRide(json: json[kDetailsNormalRideKey])
		rentalRide = RentalRide(json: json[kDetailsRentalRideKey])
		driverId = json[kDetailsDriverIdKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if bookingId != nil {
			dictionary.updateValue(bookingId! as AnyObject, forKey: kDetailsBookingIdKey)
		}
		if rideMode != nil {
			dictionary.updateValue(rideMode! as AnyObject, forKey: kDetailsRideModeKey)
		}
		if userRideId != nil {
			dictionary.updateValue(userRideId! as AnyObject, forKey: kDetailsUserRideIdKey)
		}
		if userId != nil {
			dictionary.updateValue(userId! as AnyObject, forKey: kDetailsUserIdKey)
		}
		if normalRide != nil {
			dictionary.updateValue(normalRide!.dictionaryRepresentation() as AnyObject, forKey: kDetailsNormalRideKey)
		}
		if rentalRide != nil {
			dictionary.updateValue(rentalRide!.dictionaryRepresentation() as AnyObject, forKey: kDetailsRentalRideKey)
		}
		if driverId != nil {
			dictionary.updateValue(driverId! as AnyObject, forKey: kDetailsDriverIdKey)
		}

        return dictionary
    }

}
