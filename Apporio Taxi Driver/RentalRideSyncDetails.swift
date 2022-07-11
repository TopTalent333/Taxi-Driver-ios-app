//
//  Details.swift
//
//  Created by AppOrio on 03/07/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class RentalRideSyncDetails: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kDetailsBookingStatusKey: String = "booking_status"
	internal let kDetailsRentalBookingIdKey: String = "rental_booking_id"


    // MARK: Properties
	public var bookingStatus: String?
	public var rentalBookingId: String?


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
		bookingStatus = json[kDetailsBookingStatusKey].string
		rentalBookingId = json[kDetailsRentalBookingIdKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if bookingStatus != nil {
			dictionary.updateValue(bookingStatus! as AnyObject, forKey: kDetailsBookingStatusKey)
		}
		if rentalBookingId != nil {
			dictionary.updateValue(rentalBookingId! as AnyObject, forKey: kDetailsRentalBookingIdKey)
		}

        return dictionary
    }

}
