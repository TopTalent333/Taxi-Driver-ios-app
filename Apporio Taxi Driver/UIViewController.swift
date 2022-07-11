//
//  UIViewController.swift
//  TaxiAppDriver
//
//  Created by Rakesh kumar on 23/08/16.
//  Copyright © 2016 Apporio. All rights reserved.
//

import Foundation

import UIKit

extension UIViewController : UITextFieldDelegate
    
{
    
    
    
    
    public func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    //
    //    func prefersStatusBarHidden() -> Bool {
    //    return true
    //    }
    //
    //
    func dismissViewcontroller()
    {
        self.dismiss(animated: true, completion: nil)
    }
}
