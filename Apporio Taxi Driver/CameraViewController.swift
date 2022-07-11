//
//  CameraViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 01/07/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit

class CameraViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var viewcontrollerself : UIViewController!
    
    
    @IBOutlet weak var outerview: UIView!
    
    @IBOutlet weak var innerview: UIView!
    
    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var entermetervalue: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.clear
        view.isOpaque = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectcameraoption(_ sender: Any) {
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePicker = UIImagePickerController()
          
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
        
             
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageview.image = image
        
        GlobalVariables.meterimage = self.RBResizeImage(image, targetSize: CGSize(width: self.view.frame.size.width/3,height: 70))

        
       
        self.dismiss(animated: true, completion: nil)
        
        
    }

    @IBAction func okbtnclick(_ sender: Any) {
        
        GlobalVariables.meterreadingvalue = entermetervalue.text!
        
        
        if GlobalVariables.meterimage.isEqual("") {
            let alert = UIAlertController(title: "Add Details", message: "Please first add Meter Reading Image ", preferredStyle: .alert)
            let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
            
        } else  if GlobalVariables.meterreadingvalue.isEqual(""){
        
            let alert = UIAlertController(title: "Add Details", message: "Please first add Meter Reading value ", preferredStyle: .alert)
            let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        
        }else{
        
            self.dismissViewcontroller()
            self.viewcontrollerself.viewWillAppear(true)
        }

        
        
    }
  
}

extension CameraViewController
{
    
    
    func RBResizeImage(_ image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        let heightInPoints = newImage?.size.height
        let heightInPixels = heightInPoints! * (newImage?.scale)!
        print(heightInPixels)
        
        let widthInPoints = newImage?.size.width
        let widthInPixels = widthInPoints! * (newImage?.scale)!
        print(widthInPixels)
        
        
        return newImage!
    }
}

