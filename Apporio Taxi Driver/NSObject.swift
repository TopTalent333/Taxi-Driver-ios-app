//
//  NSObject.swift
//  TaxiAppDriver
//
//  Created by Rakesh kumar on 23/08/16.
//  Copyright © 2016 Apporio. All rights reserved.
//

import KVNProgress

extension NSObject
    
{
    
    func onProgressState(_ value: Int) {
        
        
        if (value == 0)
        {
            KVNProgress.show()
        }
        
        
        if (value == 1)
        {
            KVNProgress.dismiss()
        }
        
    }
    
    func onErrorsState(_ message: String) {
        
       
        
        KVNProgress.dismiss()
        
         KVNProgress.showError(withStatus: message)
        
        /*if(errorCode == -1009)
        {
            KVNProgress.showError(withStatus: NSLocalizedString("The Internet connection appears to be offline", comment: ""))
            
            
        }
        if (errorCode == -1001)
        {
            KVNProgress.showError(withStatus: NSLocalizedString("The request timed out.", comment: ""))
            
            
        }
            
        else if(errorCode == -1012)
        {
            KVNProgress.showError(withStatus: NSLocalizedString("The operation couldn't be completed.", comment: ""))
            
            
        }
            
        else if(errorCode == -2102)
        {
            KVNProgress.showError(withStatus: NSLocalizedString("The request timed out.", comment: ""))
            
            
        }
            
            
        else if(errorCode == -1005)
        {
            KVNProgress.showError(withStatus: NSLocalizedString("The network connection was lost.", comment: ""))
            
            
        }
        else if(errorCode == -1003)
        {
            KVNProgress.showError(withStatus: NSLocalizedString("A server with the specified hostname could not be found.", comment: ""))
            
            
        }
            
            
        else {
            
            KVNProgress.showError(withStatus: NSLocalizedString("There Is SomeThing Wrong", comment: ""))
        }*/
        
        
        print(message)
        
        
        
    }
    
}
