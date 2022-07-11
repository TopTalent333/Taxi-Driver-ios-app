//
//  WebViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 04/09/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit

class WebViewController: UIViewController,UIWebViewDelegate {
    
    
    @IBOutlet weak var activityindicator: UIActivityIndicatorView!
    @IBOutlet weak var webview: UIWebView!
    
    var weblinkurl = ""


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let url = "http://peoplespensiontrust.com/dropping"
        
        let url1 = URL(string: weblinkurl)
        let request = URLRequest(url: url1!)
        webview.delegate = self
        
        activityindicator.hidesWhenStopped = true
        activityindicator.startAnimating()
        webview.loadRequest(request)

        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backbtn(_ sender: Any) {
        self.dismissViewcontroller()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        activityindicator.stopAnimating()
        
    }

    
    

   
}
