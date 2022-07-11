//
//  Details.swift
//
//  Created by AppOrio on 28/08/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class DriverReportDetails: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kDetailsOnlineTimeKey: String = "online_time"
	internal let kDetailsAvrageRatingKey: String = "avrage_rating"
	internal let kDetailsDailyAcceptanceRateKey: String = "daily_acceptance_rate"


    // MARK: Properties
	public var onlineTime: String?
	public var avrageRating: Int?
	public var dailyAcceptanceRate: String?


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
		onlineTime = json[kDetailsOnlineTimeKey].string
		avrageRating = json[kDetailsAvrageRatingKey].int
		dailyAcceptanceRate = json[kDetailsDailyAcceptanceRateKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if onlineTime != nil {
			dictionary.updateValue(onlineTime! as AnyObject, forKey: kDetailsOnlineTimeKey)
		}
		if avrageRating != nil {
			dictionary.updateValue(avrageRating! as AnyObject, forKey: kDetailsAvrageRatingKey)
		}
		if dailyAcceptanceRate != nil {
			dictionary.updateValue(dailyAcceptanceRate! as AnyObject, forKey: kDetailsDailyAcceptanceRateKey)
		}

        return dictionary
    }

}
