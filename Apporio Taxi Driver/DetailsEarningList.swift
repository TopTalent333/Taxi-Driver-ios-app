//
//  Details.swift
//
//  Created by Nitu on 15/07/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class DetailsEarningList: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kDetailsDetailsKey: String = "detail"
	internal let kDetailsDateKey: String = "date"
	internal let kDetailsDayKey: String = "day"


    // MARK: Properties
	public var detail: Detail1?
	public var date: String?
	public var day: String?


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
		detail = Detail1(json: json[kDetailsDetailsKey])
		date = json[kDetailsDateKey].string
		day = json[kDetailsDayKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if detail != nil {
			dictionary.updateValue(detail!.dictionaryRepresentation() as AnyObject, forKey: kDetailsDetailsKey)
		}
		if date != nil {
			dictionary.updateValue(date! as AnyObject, forKey: kDetailsDateKey)
		}
		if day != nil {
			dictionary.updateValue(day! as AnyObject, forKey: kDetailsDayKey)
		}

        return dictionary
    }

}
