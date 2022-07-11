//
//  Msg.swift
//
//  Created by Rakesh kumar on 19/12/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class MsgCar: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.

    internal let kMsgCarTypeIdKey: String = "car_type_id"
    internal let kMsgCarTypeImageKey: String = "car_type_image"
    internal let kMsgCityIdKey: String = "city_id"
    internal let kMsgCarTypeNameKey: String = "car_type_name"
    internal let kMsgCarNameOtherKey: String = "car_name_other"
    internal let kMsgStatusKey: String = "status"
    
    
    // MARK: Properties
    public var carTypeId: String?
    public var carTypeImage: String?
    public var cityId: String?
    public var carTypeName: String?
    public var carNameOther: String?
    public var status: String?
    
    
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
        carTypeId = json[kMsgCarTypeIdKey].string
        carTypeImage = json[kMsgCarTypeImageKey].string
        cityId = json[kMsgCityIdKey].string
        carTypeName = json[kMsgCarTypeNameKey].string
        carNameOther = json[kMsgCarNameOtherKey].string
        status = json[kMsgStatusKey].string
        
    }
    
    
    /**
     Generates description of the object in the form of a NSDictionary.
     - returns: A Key value pair containing all valid values in the object.
     */
    public func dictionaryRepresentation() -> [String : AnyObject ] {
        
        var dictionary: [String : AnyObject ] = [ : ]
        if carTypeId != nil {
            dictionary.updateValue(carTypeId! as AnyObject, forKey: kMsgCarTypeIdKey)
        }
        if carTypeImage != nil {
            dictionary.updateValue(carTypeImage! as AnyObject, forKey: kMsgCarTypeImageKey)
        }
        if cityId != nil {
            dictionary.updateValue(cityId! as AnyObject, forKey: kMsgCityIdKey)
        }
        if carTypeName != nil {
            dictionary.updateValue(carTypeName! as AnyObject, forKey: kMsgCarTypeNameKey)
        }
        if carNameOther != nil {
            dictionary.updateValue(carNameOther! as AnyObject, forKey: kMsgCarNameOtherKey)
        }
        if status != nil {
            dictionary.updateValue(status! as AnyObject, forKey: kMsgStatusKey)
        }
        
        return dictionary
    }
    
}

/*	internal let kMsgCarTypeIdKey: String = "car_type_id"
	internal let kMsgCarNameArabicKey: String = "car_name_arabic"
	internal let kMsgCityIdKey: String = "city_id"
	internal let kMsgCarTypeNameKey: String = "car_type_name"
	internal let kMsgCarTypeImageKey: String = "car_type_image"
	internal let kMsgStatusKey: String = "status"


    // MARK: Properties
	public var carTypeId: String?
	public var carNameArabic: String?
	public var cityId: String?
	public var carTypeName: String?
	public var carTypeImage: String?
	public var status: String?


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
		carTypeId = json[kMsgCarTypeIdKey].string
		carNameArabic = json[kMsgCarNameArabicKey].string
		cityId = json[kMsgCityIdKey].string
		carTypeName = json[kMsgCarTypeNameKey].string
		carTypeImage = json[kMsgCarTypeImageKey].string
		status = json[kMsgStatusKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if carTypeId != nil {
			dictionary.updateValue(carTypeId!, forKey: kMsgCarTypeIdKey)
		}
		if carNameArabic != nil {
			dictionary.updateValue(carNameArabic!, forKey: kMsgCarNameArabicKey)
		}
		if cityId != nil {
			dictionary.updateValue(cityId!, forKey: kMsgCityIdKey)
		}
		if carTypeName != nil {
			dictionary.updateValue(carTypeName!, forKey: kMsgCarTypeNameKey)
		}
		if carTypeImage != nil {
			dictionary.updateValue(carTypeImage!, forKey: kMsgCarTypeImageKey)
		}
		if status != nil {
			dictionary.updateValue(status!, forKey: kMsgStatusKey)
		}

        return dictionary
    }

}*/
