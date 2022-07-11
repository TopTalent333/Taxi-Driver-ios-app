//
//  Msg.swift
//
//  Created by Rakesh kumar on 31/01/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class MsgDocument: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kMsgMerchantIdKey: String = "merchant_id"
	internal let kMsgDocumentNameKey: String = "document_name"
	internal let kMsgStatusKey: String = "status"
	internal let kMsgDocumentTypeIdKey: String = "document_type_id"


    // MARK: Properties
	public var merchantId: String?
	public var documentName: String?
	public var status: String?
	public var documentTypeId: String?


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
		merchantId = json[kMsgMerchantIdKey].string
		documentName = json[kMsgDocumentNameKey].string
		status = json[kMsgStatusKey].string
		documentTypeId = json[kMsgDocumentTypeIdKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if merchantId != nil {
			dictionary.updateValue(merchantId! as AnyObject, forKey: kMsgMerchantIdKey)
		}
		if documentName != nil {
			dictionary.updateValue(documentName! as AnyObject, forKey: kMsgDocumentNameKey)
		}
		if status != nil {
			dictionary.updateValue(status! as AnyObject, forKey: kMsgStatusKey)
		}
		if documentTypeId != nil {
			dictionary.updateValue(documentTypeId! as AnyObject, forKey: kMsgDocumentTypeIdKey)
		}

        return dictionary
    }

}
