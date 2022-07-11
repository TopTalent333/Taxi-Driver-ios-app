//
//  Msg.swift
//
//  Created by AppOrio on 07/02/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class DriverEarningMsg: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kMsgRideDateKey: String = "ride_date"
	internal let kMsgRidesKey: String = "rides"
	internal let kMsgAmountKey: String = "amount"


    // MARK: Properties
	public var rideDate: String?
	public var rides: Int?
	public var amount: String?


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
		rideDate = json[kMsgRideDateKey].string
		rides = json[kMsgRidesKey].int
		amount = json[kMsgAmountKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if rideDate != nil {
			dictionary.updateValue(rideDate! as AnyObject, forKey: kMsgRideDateKey)
		}
		if rides != nil {
			dictionary.updateValue(rides! as AnyObject, forKey: kMsgRidesKey)
		}
		if amount != nil {
			dictionary.updateValue(amount! as AnyObject, forKey: kMsgAmountKey)
		}

        return dictionary
    }

}
