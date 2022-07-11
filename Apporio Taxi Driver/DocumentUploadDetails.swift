//
//  Details.swift
//
//  Created by AppOrio on 11/09/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class DocumentUploadDetails: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kDetailsDocumnetVarificationStatusKey: String = "documnet_varification_status"
	internal let kDetailsDocumentExpiryDateKey: String = "document_expiry_date"
	internal let kDetailsDocumentIdKey: String = "document_id"
	internal let kDetailsDriverIdKey: String = "driver_id"
	internal let kDetailsDocumentPathKey: String = "document_path"
	internal let kDetailsDriverDocumentIdKey: String = "driver_document_id"


    // MARK: Properties
	public var documnetVarificationStatus: String?
	public var documentExpiryDate: String?
	public var documentId: String?
	public var driverId: String?
	public var documentPath: String?
	public var driverDocumentId: String?


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
		documnetVarificationStatus = json[kDetailsDocumnetVarificationStatusKey].string
		documentExpiryDate = json[kDetailsDocumentExpiryDateKey].string
		documentId = json[kDetailsDocumentIdKey].string
		driverId = json[kDetailsDriverIdKey].string
		documentPath = json[kDetailsDocumentPathKey].string
		driverDocumentId = json[kDetailsDriverDocumentIdKey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if documnetVarificationStatus != nil {
			dictionary.updateValue(documnetVarificationStatus! as AnyObject, forKey: kDetailsDocumnetVarificationStatusKey)
		}
		if documentExpiryDate != nil {
			dictionary.updateValue(documentExpiryDate! as AnyObject, forKey: kDetailsDocumentExpiryDateKey)
		}
		if documentId != nil {
			dictionary.updateValue(documentId! as AnyObject, forKey: kDetailsDocumentIdKey)
		}
		if driverId != nil {
			dictionary.updateValue(driverId! as AnyObject, forKey: kDetailsDriverIdKey)
		}
		if documentPath != nil {
			dictionary.updateValue(documentPath! as AnyObject, forKey: kDetailsDocumentPathKey)
		}
		if driverDocumentId != nil {
			dictionary.updateValue(driverDocumentId! as AnyObject, forKey: kDetailsDriverDocumentIdKey)
		}

        return dictionary
    }

}
