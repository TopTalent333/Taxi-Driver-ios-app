//
//  Terms&ConditionViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 07/06/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit

class Terms_ConditionViewController: UIViewController,ParsingStates {
    
      var data: TCClass!
    @IBOutlet weak var textview: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.tc()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backbtn(_ sender: Any) {
        
        dismissViewcontroller()
    }
    
    func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
        self.data = data as! TCClass
        
        
        if(UserDefaults.standard.object(forKey: "PreferredLanguage") as! String == "en"){
            
            
            do {
                let str = try NSAttributedString(data: (self.data.details?.descriptionValue)!.data(using: String.Encoding.unicode, allowLossyConversion: true)!, options: [NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType], documentAttributes: nil)
                
                textview.attributedText =  str
            } catch {
                print(error)
            }
            
            
           // textview.text = (self.data.details?.descriptionValue)!.html2String
        }else{
            
            do {
                let str = try NSAttributedString(data: (self.data.details?.descriptionValue)!.data(using: String.Encoding.unicode, allowLossyConversion: true)!, options: [NSDocumentTypeDocumentAttribute : NSHTMLTextDocumentType], documentAttributes: nil)
                
                textview.attributedText =  str
            } catch {
                
                
                print(error)
            }
            
            //textview.text = (self.data.details?.descriptionOther)!.html2String
            
        }
        
        
        
    }


   

}
