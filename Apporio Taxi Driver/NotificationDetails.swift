//
//  Details.swift
//
//  Created by AppOrio on 04/09/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class NotificationDetails: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kDetailsPushImageKey: String = "push_image"
	internal let kDetailsPushAppKey: String = "push_app"
	internal let kDetailsPushIdKey: String = "push_id"
	internal let kDetailsPushMessageHeadingKey: String = "push_message_heading"
	internal let kDetailsPushMessageKey: String = "push_message"
    internal let kDetailsPushWebUrlkey: String = "push_web_url"


    // MARK: Properties
	public var pushImage: String?
	public var pushApp: String?
	public var pushId: String?
	public var pushMessageHeading: String?
	public var pushMessage: String?
     public var pushWebUrl: String?


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
		pushImage = json[kDetailsPushImageKey].string
		pushApp = json[kDetailsPushAppKey].string
		pushId = json[kDetailsPushIdKey].string
		pushMessageHeading = json[kDetailsPushMessageHeadingKey].string
		pushMessage = json[kDetailsPushMessageKey].string
         pushWebUrl = json[kDetailsPushWebUrlkey].string

    }


    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if pushImage != nil {
			dictionary.updateValue(pushImage! as AnyObject, forKey: kDetailsPushImageKey)
		}
		if pushApp != nil {
			dictionary.updateValue(pushApp! as AnyObject, forKey: kDetailsPushAppKey)
		}
		if pushId != nil {
			dictionary.updateValue(pushId! as AnyObject, forKey: kDetailsPushIdKey)
		}
		if pushMessageHeading != nil {
			dictionary.updateValue(pushMessageHeading! as AnyObject, forKey: kDetailsPushMessageHeadingKey)
		}
		if pushMessage != nil {
			dictionary.updateValue(pushMessage! as AnyObject, forKey: kDetailsPushMessageKey)
		}
        if pushWebUrl != nil {
            dictionary.updateValue(pushWebUrl! as AnyObject, forKey: kDetailsPushWebUrlkey)
        }


        return dictionary
    }

}
