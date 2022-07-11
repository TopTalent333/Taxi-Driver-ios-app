//
//  Details.swift
//
//  Created by AppOrio on 04/07/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class RentalCancelReasonDetails: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kDetailsCancelReasonsStatusKey: String = "cancel_reasons_status"
	internal let kDetailsReasonNameArabicKey: String = "reason_name_arabic"
	internal let kDetailsReasonNameFrenchKey: String = "reason_name_french"
	internal let kDetailsReasonTypeKey: String = "reason_type"
	internal let kDetailsReasonNameKey: String = "reason_name"
	internal let kDetailsReasonIdKey: String = "reason_id"


    // MARK: Properties
	public var cancelReasonsStatus: String?
	public var reasonNameArabic: String?
	public var reasonNameFrench: String?
	public var reasonType: String?
	public var reasonName: String?
	public var reasonId: String?


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
		cancelReasonsStatus = json[kDetailsCancelReasonsStatusKey].string
		reasonNameArabic = json[kDetailsReasonNameArabicKey].string
		reasonNameFrench = json[kDetailsReasonNameFrenchKey].string
		reasonType = json[kDetailsReasonTypeKey].string
		reasonName = json[kDetailsReasonNameKey].string
		reasonId = json[kDetailsReasonIdKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if cancelReasonsStatus != nil {
			dictionary.updateValue(cancelReasonsStatus! as AnyObject, forKey: kDetailsCancelReasonsStatusKey)
		}
		if reasonNameArabic != nil {
			dictionary.updateValue(reasonNameArabic! as AnyObject, forKey: kDetailsReasonNameArabicKey)
		}
		if reasonNameFrench != nil {
			dictionary.updateValue(reasonNameFrench! as AnyObject, forKey: kDetailsReasonNameFrenchKey)
		}
		if reasonType != nil {
			dictionary.updateValue(reasonType! as AnyObject, forKey: kDetailsReasonTypeKey)
		}
		if reasonName != nil {
			dictionary.updateValue(reasonName! as AnyObject, forKey: kDetailsReasonNameKey)
		}
		if reasonId != nil {
			dictionary.updateValue(reasonId! as AnyObject, forKey: kDetailsReasonIdKey)
		}

        return dictionary
    }

}
