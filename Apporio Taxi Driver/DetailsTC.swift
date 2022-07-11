//
//  Details.swift
//
//  Created by Rakesh kumar on 19/12/16
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public class DetailsTC: NSObject {

    // MARK: Declaration for string constants to be used to decode and also serialize.


    internal let kDetailsTitleKey: String = "title"
    internal let kDetailsPageIdKey: String = "page_id"
    internal let kDetailsNameKey: String = "name"
    internal let kDetailsTitleArabicKey: String = "title_arabic"
    internal let kDetailsDescriptionValueKey: String = "description"
    internal let kDetailsTitleFrenchKey: String = "title_french"
    internal let kDetailsDescriptionArabicKey: String = "description_arabic"
    internal let kDetailsDescriptionFrenchKey: String = "description_french"
    
    
    // MARK: Properties
    public var title: String?
    public var pageId: String?
    public var name: String?
    public var titleArabic: String?
    public var descriptionValue: String?
    public var titleFrench: String?
    public var descriptionArabic: String?
    public var descriptionFrench: String?
    
    
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
        title = json[kDetailsTitleKey].string
        pageId = json[kDetailsPageIdKey].string
        name = json[kDetailsNameKey].string
        titleArabic = json[kDetailsTitleArabicKey].string
        descriptionValue = json[kDetailsDescriptionValueKey].string
        titleFrench = json[kDetailsTitleFrenchKey].string
        descriptionArabic = json[kDetailsDescriptionArabicKey].string
        descriptionFrench = json[kDetailsDescriptionFrenchKey].string
        
    }
    
    
    /**
     Generates description of the object in the form of a NSDictionary.
     - returns: A Key value pair containing all valid values in the object.
     */
    public func dictionaryRepresentation() -> [String : AnyObject ] {
        
        var dictionary: [String : AnyObject ] = [ : ]
        if title != nil {
            dictionary.updateValue(title! as AnyObject, forKey: kDetailsTitleKey)
        }
        if pageId != nil {
            dictionary.updateValue(pageId! as AnyObject, forKey: kDetailsPageIdKey)
        }
        if name != nil {
            dictionary.updateValue(name! as AnyObject, forKey: kDetailsNameKey)
        }
        if titleArabic != nil {
            dictionary.updateValue(titleArabic! as AnyObject, forKey: kDetailsTitleArabicKey)
        }
        if descriptionValue != nil {
            dictionary.updateValue(descriptionValue! as AnyObject, forKey: kDetailsDescriptionValueKey)
        }
        if titleFrench != nil {
            dictionary.updateValue(titleFrench! as AnyObject, forKey: kDetailsTitleFrenchKey)
        }
        if descriptionArabic != nil {
            dictionary.updateValue(descriptionArabic! as AnyObject, forKey: kDetailsDescriptionArabicKey)
        }
        if descriptionFrench != nil {
            dictionary.updateValue(descriptionFrench! as AnyObject, forKey: kDetailsDescriptionFrenchKey)
        }
        
        return dictionary
    }
    
}


    
   /* internal let kDetailsTitleKey: String = "title"
    internal let kDetailsPageIdKey: String = "page_id"
    internal let kDetailsDescriptionOtherKey: String = "description_other"
    internal let kDetailsTitleOtherKey: String = "title_other"
    internal let kDetailsDescriptionValueKey: String = "description"
    
    
    // MARK: Properties
    public var title: String?
    public var pageId: String?
    public var descriptionOther: String?
    public var titleOther: String?
    public var descriptionValue: String?
    
    
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
        title = json[kDetailsTitleKey].string
        pageId = json[kDetailsPageIdKey].string
        descriptionOther = json[kDetailsDescriptionOtherKey].string
        titleOther = json[kDetailsTitleOtherKey].string
        descriptionValue = json[kDetailsDescriptionValueKey].string
        
    }
    
    
    /**
     Generates description of the object in the form of a NSDictionary.
     - returns: A Key value pair containing all valid values in the object.
     */
    public func dictionaryRepresentation() -> [String : AnyObject ] {
        
        var dictionary: [String : AnyObject ] = [ : ]
        if title != nil {
            dictionary.updateValue(title! as AnyObject, forKey: kDetailsTitleKey)
        }
        if pageId != nil {
            dictionary.updateValue(pageId! as AnyObject, forKey: kDetailsPageIdKey)
        }
        if descriptionOther != nil {
            dictionary.updateValue(descriptionOther! as AnyObject, forKey: kDetailsDescriptionOtherKey)
        }
        if titleOther != nil {
            dictionary.updateValue(titleOther! as AnyObject, forKey: kDetailsTitleOtherKey)
        }
        if descriptionValue != nil {
            dictionary.updateValue(descriptionValue! as AnyObject, forKey: kDetailsDescriptionValueKey)
        }
        
        return dictionary
    }
    
}*/

