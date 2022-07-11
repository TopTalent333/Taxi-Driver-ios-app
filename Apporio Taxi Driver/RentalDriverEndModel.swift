//
//  RentalDriverEndModel.swift
//
//  Created by AppOrio on 05/07/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class RentalDriverEndModel: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kRentalDriverEndModelStatusKey: String = "status"
	internal let kRentalDriverEndModelMessageKey: String = "message"
	internal let kRentalDriverEndModelDetailsKey: String = "details"


    // MARK: Properties
	public var status: Int?
	public var message: String?
	public var details: RentalDriverEndDetails?


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
		status = json[kRentalDriverEndModelStatusKey].int
		message = json[kRentalDriverEndModelMessageKey].string
		details = RentalDriverEndDetails(json: json[kRentalDriverEndModelDetailsKey])

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if status != nil {
			dictionary.updateValue(status! as AnyObject, forKey: kRentalDriverEndModelStatusKey)
		}
		if message != nil {
			dictionary.updateValue(message! as AnyObject, forKey: kRentalDriverEndModelMessageKey)
		}
		if details != nil {
			dictionary.updateValue(details!.dictionaryRepresentation() as AnyObject, forKey: kRentalDriverEndModelDetailsKey)
		}

        return dictionary
    }

}
