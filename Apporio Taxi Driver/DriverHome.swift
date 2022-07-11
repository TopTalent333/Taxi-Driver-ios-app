//
//  DriverHome.swift
//
//  Created by Rakesh kumar on 19/12/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class DriverHome: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kDriverHomeResultKey: String = "result"
	internal let kDriverHomeMsgKey: String = "msg"
    internal let kDriverHomeCurrencyUnicodeKey: String = "currency_unicode"
    internal let kDriverHomeCurrencyIsoCodeKey: String = "currency_iso_code"



    // MARK: Properties
	public var result: Int?
	public var msg: String?
    public var currencyUnicode: String?
    public var currencyIsoCode: String?


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
		result = json[kDriverHomeResultKey].int
		msg = json[kDriverHomeMsgKey].string
        currencyUnicode = json[kDriverHomeCurrencyUnicodeKey].string
        currencyIsoCode = json[kDriverHomeCurrencyIsoCodeKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if result != nil {
			dictionary.updateValue(result! as AnyObject, forKey: kDriverHomeResultKey)
		}
		if msg != nil {
			dictionary.updateValue(msg! as AnyObject, forKey: kDriverHomeMsgKey)
		}
        if currencyUnicode != nil {
            dictionary.updateValue(currencyUnicode! as AnyObject, forKey: kDriverHomeCurrencyUnicodeKey)
        }

        if currencyIsoCode != nil {
            dictionary.updateValue(msg! as AnyObject, forKey: kDriverHomeCurrencyIsoCodeKey)
        }


        return dictionary
    }

}
