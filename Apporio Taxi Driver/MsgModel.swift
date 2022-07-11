//
//  Msg.swift
//
//  Created by Rakesh kumar on 19/12/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class MsgModel: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.

    internal let kMsgCarTypeIdKey: String = "car_type_id"
    internal let kMsgCarModelNameKey: String = "car_model_name"
    internal let kMsgCarModelNameOtherKey: String = "car_model_name_other"
    internal let kMsgCarModelImageKey: String = "car_model_image"
    internal let kMsgCarModelIdKey: String = "car_model_id"
    internal let kMsgStatusKey: String = "status"
    
    
    // MARK: Properties
    public var carTypeId: String?
    public var carModelName: String?
    public var carModelNameOther: String?
    public var carModelImage: String?
    public var carModelId: String?
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
        carModelName = json[kMsgCarModelNameKey].string
        carModelNameOther = json[kMsgCarModelNameOtherKey].string
        carModelImage = json[kMsgCarModelImageKey].string
        carModelId = json[kMsgCarModelIdKey].string
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
        if carModelName != nil {
            dictionary.updateValue(carModelName! as AnyObject, forKey: kMsgCarModelNameKey)
        }
        if carModelNameOther != nil {
            dictionary.updateValue(carModelNameOther! as AnyObject, forKey: kMsgCarModelNameOtherKey)
        }
        if carModelImage != nil {
            dictionary.updateValue(carModelImage! as AnyObject, forKey: kMsgCarModelImageKey)
        }
        if carModelId != nil {
            dictionary.updateValue(carModelId! as AnyObject, forKey: kMsgCarModelIdKey)
        }
        if status != nil {
            dictionary.updateValue(status! as AnyObject, forKey: kMsgStatusKey)
        }
        
        return dictionary
    }
    
}

/*	internal let kMsgCarTypeIdKey: String = "car_type_id"
	internal let kMsgCarModelNameKey: String = "car_model_name"
	internal let kMsgCarModelImageKey: String = "car_model_image"
	internal let kMsgCarModelIdKey: String = "car_model_id"
	internal let kMsgStatusKey: String = "status"


    // MARK: Properties
	public var carTypeId: String?
	public var carModelName: String?
	public var carModelImage: String?
	public var carModelId: String?
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
		carModelName = json[kMsgCarModelNameKey].string
		carModelImage = json[kMsgCarModelImageKey].string
		carModelId = json[kMsgCarModelIdKey].string
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
		if carModelName != nil {
			dictionary.updateValue(carModelName!, forKey: kMsgCarModelNameKey)
		}
		if carModelImage != nil {
			dictionary.updateValue(carModelImage!, forKey: kMsgCarModelImageKey)
		}
		if carModelId != nil {
			dictionary.updateValue(carModelId!, forKey: kMsgCarModelIdKey)
		}
		if status != nil {
			dictionary.updateValue(status!, forKey: kMsgStatusKey)
		}

        return dictionary
    }

}*/
