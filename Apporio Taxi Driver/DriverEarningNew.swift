//
//  DriverEarningNew.swift
//
//  Created by Nitu on 15/07/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class DriverEarningNew: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kDriverEarningNewCompanyCutKey: String = "company_cut"
	internal let kDriverEarningNewWeeklyAmountKey: String = "weekly_amount"
	internal let kDriverEarningNewDetailsKey: String = "details"
	internal let kDriverEarningNewResultKey: String = "result"
	internal let kDriverEarningNewDriverPaymentKey: String = "driver_payment"
	internal let kDriverEarningNewTotalPaymentEranedKey: String = "total_payment_eraned"
	internal let kDriverEarningNewCompanyPaymentKey: String = "company_payment"
	internal let kDriverEarningNewTotalRidesKey: String = "total_rides"
	internal let kDriverEarningNewFareReceviedKey: String = "fare_recevied"
	internal let kDriverEarningNewMsgKey: String = "msg"


    // MARK: Properties
	public var companyCut: String?
	public var weeklyAmount: Double?
	public var details: [DetailsEarningList]?
	public var result: Int?
	public var driverPayment: String?
	public var totalPaymentEraned: String?
	public var companyPayment: String?
	public var totalRides: Int?
	public var fareRecevied: String?
	public var msg: String?


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
		companyCut = json[kDriverEarningNewCompanyCutKey].string
		weeklyAmount = json[kDriverEarningNewWeeklyAmountKey].double
		details = []
		if let items = json[kDriverEarningNewDetailsKey].array {
			for item in items {
				details?.append(DetailsEarningList(json: item))
			}
		} else {
			details = nil
		}
		result = json[kDriverEarningNewResultKey].int
		driverPayment = json[kDriverEarningNewDriverPaymentKey].string
		totalPaymentEraned = json[kDriverEarningNewTotalPaymentEranedKey].string
		companyPayment = json[kDriverEarningNewCompanyPaymentKey].string
		totalRides = json[kDriverEarningNewTotalRidesKey].int
		fareRecevied = json[kDriverEarningNewFareReceviedKey].string
		msg = json[kDriverEarningNewMsgKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if companyCut != nil {
			dictionary.updateValue(companyCut! as AnyObject, forKey: kDriverEarningNewCompanyCutKey)
		}
		if weeklyAmount != nil {
			dictionary.updateValue(weeklyAmount! as AnyObject, forKey: kDriverEarningNewWeeklyAmountKey)
		}
		if (details?.count)! > 0 {
			var temp: [AnyObject] = []
			for item in details! {
				temp.append(item.dictionaryRepresentation() as AnyObject)
			}
			dictionary.updateValue(temp as AnyObject, forKey: kDriverEarningNewDetailsKey)
		}
		if result != nil {
			dictionary.updateValue(result! as AnyObject, forKey: kDriverEarningNewResultKey)
		}
		if driverPayment != nil {
			dictionary.updateValue(driverPayment! as AnyObject, forKey: kDriverEarningNewDriverPaymentKey)
		}
		if totalPaymentEraned != nil {
			dictionary.updateValue(totalPaymentEraned! as AnyObject, forKey: kDriverEarningNewTotalPaymentEranedKey)
		}
		if companyPayment != nil {
			dictionary.updateValue(companyPayment! as AnyObject, forKey: kDriverEarningNewCompanyPaymentKey)
		}
		if totalRides != nil {
			dictionary.updateValue(totalRides! as AnyObject, forKey: kDriverEarningNewTotalRidesKey)
		}
		if fareRecevied != nil {
			dictionary.updateValue(fareRecevied! as AnyObject, forKey: kDriverEarningNewFareReceviedKey)
		}
		if msg != nil {
			dictionary.updateValue(msg! as AnyObject, forKey: kDriverEarningNewMsgKey)
		}

        return dictionary
    }

}
