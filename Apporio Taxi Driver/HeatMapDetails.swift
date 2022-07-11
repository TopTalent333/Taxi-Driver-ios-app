//
//  Details.swift
//
//  Created by AppOrio on 24/08/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class HeatMapDetails: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kDetailsPickupLatKey: String = "pickup_lat"
	internal let kDetailsPickupLongKey: String = "pickup_long"


    // MARK: Properties
	public var pickupLat: String?
	public var pickupLong: String?


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
		pickupLat = json[kDetailsPickupLatKey].string
		pickupLong = json[kDetailsPickupLongKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if pickupLat != nil {
			dictionary.updateValue(pickupLat! as AnyObject, forKey: kDetailsPickupLatKey)
		}
		if pickupLong != nil {
			dictionary.updateValue(pickupLong! as AnyObject, forKey: kDetailsPickupLongKey)
		}

        return dictionary
    }

}
