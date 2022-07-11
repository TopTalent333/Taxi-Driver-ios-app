//
//  Msg.swift
//
//  Created by AppOrio on 14/02/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class MsgCity: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.

    internal let kMsgCityNameKey: String = "city_name"
    internal let kMsgCityNameOtherKey: String = "city_name_other"
    internal let kMsgStatusKey: String = "status"
    internal let kMsgCityIdKey: String = "city_id"
    
    
    // MARK: Properties
    public var cityName: String?
    public var cityNameOther: String?
    public var status: String?
    public var cityId: String?
    
    
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
        cityName = json[kMsgCityNameKey].string
        cityNameOther = json[kMsgCityNameOtherKey].string
        status = json[kMsgStatusKey].string
        cityId = json[kMsgCityIdKey].string
        
    }
    
    
    /**
     Generates description of the object in the form of a NSDictionary.
     - returns: A Key value pair containing all valid values in the object.
     */
    public func dictionaryRepresentation() -> [String : AnyObject ] {
        
        var dictionary: [String : AnyObject ] = [ : ]
        if cityName != nil {
            dictionary.updateValue(cityName! as AnyObject, forKey: kMsgCityNameKey)
        }
        if cityNameOther != nil {
            dictionary.updateValue(cityNameOther! as AnyObject, forKey: kMsgCityNameOtherKey)
        }
        if status != nil {
            dictionary.updateValue(status! as AnyObject, forKey: kMsgStatusKey)
        }
        if cityId != nil {
            dictionary.updateValue(cityId! as AnyObject, forKey: kMsgCityIdKey)
        }
        
        return dictionary
    }
    
}

    
    
/*	internal let kMsgCityNameKey: String = "city_name"
	internal let kMsgCityIdKey: String = "city_id"
	internal let kMsgStatusKey: String = "status"
	internal let kMsgCityNameArabicKey: String = "city_name_arabic"


    // MARK: Properties
	public var cityName: String?
	public var cityId: String?
	public var status: String?
	public var cityNameArabic: String?


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
		cityName = json[kMsgCityNameKey].string
		cityId = json[kMsgCityIdKey].string
		status = json[kMsgStatusKey].string
		cityNameArabic = json[kMsgCityNameArabicKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if cityName != nil {
			dictionary.updateValue(cityName!, forKey: kMsgCityNameKey)
		}
		if cityId != nil {
			dictionary.updateValue(cityId!, forKey: kMsgCityIdKey)
		}
		if status != nil {
			dictionary.updateValue(status!, forKey: kMsgStatusKey)
		}
		if cityNameArabic != nil {
			dictionary.updateValue(cityNameArabic!, forKey: kMsgCityNameArabicKey)
		}

        return dictionary
    }

}*/
