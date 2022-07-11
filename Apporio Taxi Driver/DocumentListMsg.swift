//
//  Msg.swift
//
//  Created by AppOrio on 11/09/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class DocumentListMsg: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kMsgDocumnetVarificationStatusKey: String = "documnet_varification_status"
	internal let kMsgDocumentNameKey: String = "document_name"
	internal let kMsgDocumentIdKey: String = "document_id"
	internal let kMsgCityDocumentStatusKey: String = "city_document_status"
	internal let kMsgCityIdKey: String = "city_id"
	internal let kMsgCityDocumentIdKey: String = "city_document_id"


    // MARK: Properties
	public var documnetVarificationStatus: String?
	public var documentName: String?
	public var documentId: String?
	public var cityDocumentStatus: String?
	public var cityId: String?
	public var cityDocumentId: String?


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
		documnetVarificationStatus = json[kMsgDocumnetVarificationStatusKey].string
		documentName = json[kMsgDocumentNameKey].string
		documentId = json[kMsgDocumentIdKey].string
		cityDocumentStatus = json[kMsgCityDocumentStatusKey].string
		cityId = json[kMsgCityIdKey].string
		cityDocumentId = json[kMsgCityDocumentIdKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if documnetVarificationStatus != nil {
			dictionary.updateValue(documnetVarificationStatus! as AnyObject, forKey: kMsgDocumnetVarificationStatusKey)
		}
		if documentName != nil {
			dictionary.updateValue(documentName! as AnyObject, forKey: kMsgDocumentNameKey)
		}
		if documentId != nil {
			dictionary.updateValue(documentId! as AnyObject, forKey: kMsgDocumentIdKey)
		}
		if cityDocumentStatus != nil {
			dictionary.updateValue(cityDocumentStatus! as AnyObject, forKey: kMsgCityDocumentStatusKey)
		}
		if cityId != nil {
			dictionary.updateValue(cityId! as AnyObject, forKey: kMsgCityIdKey)
		}
		if cityDocumentId != nil {
			dictionary.updateValue(cityDocumentId! as AnyObject, forKey: kMsgCityDocumentIdKey)
		}

        return dictionary
    }

}
