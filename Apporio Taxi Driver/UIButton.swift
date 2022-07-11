//
//  UIButton.swift
//  TaxiAppDriver
//
//  Created by Rakesh kumar on 23/08/16.
//  Copyright © 2016 Apporio. All rights reserved.
//


import Foundation
import UIKit

class CustomButton: UIButton {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.layer.cornerRadius = 5.0
        
        self.layer.borderColor = CustomButton.getColorFromHex(hexString: "#999999").cgColor
        self.layer.borderWidth = 1.5
        self.layer.masksToBounds = true 
        self.tintColor = UIColor.white
        
        
    }
    
    class func getColorFromHex(hexString:String)->UIColor{
        
        var rgbValue : UInt32 = 0
        let scanner:Scanner =  Scanner(string: hexString)
        
        scanner.scanLocation = 1
        scanner.scanHexInt32(&rgbValue)
        
        return UIColor(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0, blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: CGFloat(1.0))
    }
    
}
