//
//  Protocols.swift
//  TaxiAppDriver
//
//  Created by Rakesh kumar on 23/08/16.
//  Copyright © 2016 Apporio. All rights reserved.
//

protocol writeValueBackDelegate{
    func writeValueBack(value:String, id: String , resultCode:Int )
    
}
class Protocols{
    static var delegate:writeValueBackDelegate!
}