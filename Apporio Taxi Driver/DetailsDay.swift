
//
//  Details.swift
//
//  Created by Nitu on 15/07/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class DetailsDay: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kDetailsFullRideDetailsKey: String = "full_ride_details"
	internal let kDetailsRidesKey: String = "rides"
	internal let kDetailsCompanyCutKey: String = "company_cut"
	internal let kDetailsDateKey: String = "date"
	internal let kDetailsAmountKey: String = "amount"
	internal let kDetailsDriverIdKey: String = "driver_id"
	internal let kDetailsDriverEarningIdKey: String = "driver_earning_id"
	internal let kDetailsFareReceviedKey: String = "fare_recevied"


    // MARK: Properties
	public var fullRideDetails: [FullRideDetails]?
	public var rides: String?
	public var companyCut: String?
	public var date: String?
	public var amount: String?
	public var driverId: String?
	public var driverEarningId: String?
	public var fareRecevied: String?


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
		fullRideDetails = []
		if let items = json[kDetailsFullRideDetailsKey].array {
			for item in items {
				fullRideDetails?.append(FullRideDetails(json: item))
			}
		} else {
			fullRideDetails = nil
		}
		rides = json[kDetailsRidesKey].string
		companyCut = json[kDetailsCompanyCutKey].string
		date = json[kDetailsDateKey].string
		amount = json[kDetailsAmountKey].string
		driverId = json[kDetailsDriverIdKey].string
		driverEarningId = json[kDetailsDriverEarningIdKey].string
		fareRecevied = json[kDetailsFareReceviedKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if (fullRideDetails?.count)! > 0 {
			var temp: [AnyObject] = []
			for item in fullRideDetails! {
				temp.append(item.dictionaryRepresentation() as AnyObject)
			}
			dictionary.updateValue(temp as AnyObject, forKey: kDetailsFullRideDetailsKey)
		}
		if rides != nil {
			dictionary.updateValue(rides! as AnyObject, forKey: kDetailsRidesKey)
		}
		if companyCut != nil {
			dictionary.updateValue(companyCut! as AnyObject, forKey: kDetailsCompanyCutKey)
		}
		if date != nil {
			dictionary.updateValue(date! as AnyObject, forKey: kDetailsDateKey)
		}
		if amount != nil {
			dictionary.updateValue(amount! as AnyObject, forKey: kDetailsAmountKey)
		}
		if driverId != nil {
			dictionary.updateValue(driverId! as AnyObject, forKey: kDetailsDriverIdKey)
		}
		if driverEarningId != nil {
			dictionary.updateValue(driverEarningId! as AnyObject, forKey: kDetailsDriverEarningIdKey)
		}
		if fareRecevied != nil {
			dictionary.updateValue(fareRecevied! as AnyObject, forKey: kDetailsFareReceviedKey)
		}

        return dictionary
    }

}
