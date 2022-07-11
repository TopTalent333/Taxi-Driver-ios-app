//
//  Msg.swift
//
//  Created by AppOrio on 15/02/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class MsgReason: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kMsgReasonTypeKey: String = "reason_type"
	internal let kMsgStatusKey: String = "status"
	internal let kMsgReasonIdKey: String = "reason_id"
	internal let kMsgReasonNameKey: String = "reason_name"


    // MARK: Properties
	public var reasonType: String?
	public var status: String?
	public var reasonId: String?
	public var reasonName: String?


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
		reasonType = json[kMsgReasonTypeKey].string
		status = json[kMsgStatusKey].string
		reasonId = json[kMsgReasonIdKey].string
		reasonName = json[kMsgReasonNameKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if reasonType != nil {
			dictionary.updateValue(reasonType! as AnyObject, forKey: kMsgReasonTypeKey)
		}
		if status != nil {
			dictionary.updateValue(status! as AnyObject, forKey: kMsgStatusKey)
		}
		if reasonId != nil {
			dictionary.updateValue(reasonId! as AnyObject, forKey: kMsgReasonIdKey)
		}
		if reasonName != nil {
			dictionary.updateValue(reasonName! as AnyObject, forKey: kMsgReasonNameKey)
		}

        return dictionary
    }

}
