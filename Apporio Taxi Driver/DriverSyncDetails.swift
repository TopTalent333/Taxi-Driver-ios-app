//
//  Details.swift
//
//  Created by AppOrio on 10/03/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class DriverSyncDetails: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kDetailsRideIdKey: String = "ride_id"
	internal let kDetailsRideStatusKey: String = "ride_status"


    // MARK: Properties
	public var rideId: String?
	public var rideStatus: String?


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
		rideId = json[kDetailsRideIdKey].string
		rideStatus = json[kDetailsRideStatusKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if rideId != nil {
			dictionary.updateValue(rideId! as AnyObject, forKey: kDetailsRideIdKey)
		}
		if rideStatus != nil {
			dictionary.updateValue(rideStatus! as AnyObject, forKey: kDetailsRideStatusKey)
		}

        return dictionary
    }

}
