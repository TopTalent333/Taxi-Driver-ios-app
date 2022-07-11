//
//  Arrived.swift
//
//  Created by Rakesh kumar on 19/12/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class Arrived: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kArrivedDetailsKey: String = "details"
	internal let kArrivedResultKey: String = "result"
	internal let kArrivedMsgKey: String = "msg"


    // MARK: Properties
	public var details: DetailsArrived?
	public var result: Int?
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
		details = DetailsArrived(json: json[kArrivedDetailsKey])
		result = json[kArrivedResultKey].int
		msg = json[kArrivedMsgKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if details != nil {
			dictionary.updateValue(details!.dictionaryRepresentation() as AnyObject, forKey: kArrivedDetailsKey)
		}
		if result != nil {
			dictionary.updateValue(result! as AnyObject, forKey: kArrivedResultKey)
		}
		if msg != nil {
			dictionary.updateValue(msg! as AnyObject, forKey: kArrivedMsgKey)
		}

        return dictionary
    }

}
