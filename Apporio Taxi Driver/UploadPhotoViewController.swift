//
//  UploadPhotoViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 11/09/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit

class UploadPhotoViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate,ParsingStates {
    
    @IBOutlet weak var datelabeltext: UILabel!
    
    var documentuploaddata: DocumentUploadModel!
    
    
    @IBOutlet weak var innerview: UIView!
    
    @IBOutlet weak var selectimageview: UIImageView!
    
     var viewcontrollerself : UIViewController!
    
    
    var driverid = NsUserDefaultManager.SingeltonInstance.getuserdetails(key: NsUserDefaultManager.KeyDriverid)!
    

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
    
    @IBAction func back_btn_click(_ sender: Any) {
        dismissViewcontroller()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
         if GlobalVariables.movefromcalender == 4{
            datelabeltext.text = GlobalVariables.documentdateselected
           // GlobalVariables.movefromcalender = 0
        }
    }
    
    
    @IBAction func Select_photo_gallery_btn(_ sender: Any) {
        
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.savedPhotosAlbum){
            print("Button capture")
            let imagePicker = UIImagePickerController()
            
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
        }
        
        
        
        
    }
    
    @IBAction func Capturefromcamera_btn(_ sender: Any) {
        
        
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
        
        GlobalVariables.dynamicdocumentimage = self.RBResizeImage(image, targetSize: CGSize(width: 500, height: 500))
            
           // width: self.view.frame.size.width,height: 500)
        
        selectimageview.image = image
     
        self.dismiss(animated: true, completion: nil)
        
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next: CalenderViewController = storyboard.instantiateViewController(withIdentifier: "CalenderViewController") as! CalenderViewController
        next.checkmovefrom = "uploaddocument"
         GlobalVariables.movefromcalender = 4
        self.present(next, animated: true, completion: nil)
        
        
    }
    
    
    @IBAction func selectdatebtn_click(_ sender: Any) {
        
        
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let next: CalenderViewController = storyboard.instantiateViewController(withIdentifier: "CalenderViewController") as! CalenderViewController
        next.checkmovefrom = "uploaddocument"
        GlobalVariables.movefromcalender = 4
        self.present(next, animated: true, completion: nil)

    }
    
    
    @IBAction func submitbtn_click(_ sender: Any) {
        
       
        
        if GlobalVariables.dynamicdocumentimage == UIImage() {
            let alert = UIAlertController(title: NSLocalizedString("Upload Documents", comment: ""), message: NSLocalizedString("Please upload document image first ", comment: ""), preferredStyle: .alert)
            let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
            
        }else if GlobalVariables.documentdateselected == "DD MM YYYY" {
            let alert = UIAlertController(title:  NSLocalizedString("Upload Documents", comment: ""), message: NSLocalizedString("Please enter document Expiration Date", comment: ""), preferredStyle: .alert)
            let action = UIAlertAction(title:  NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
            
        }else{
             GlobalVariables.movefromcalender = 0
            
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.UploadDocumentImage(DriverId: self.driverid, Documentexpirydate: GlobalVariables.documentdateselected, DocumentId:  GlobalVariables.selecteddocumentId, DocumentImage: GlobalVariables.dynamicdocumentimage)
        
        }
    }

    
     func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
        documentuploaddata = data as! DocumentUploadModel
        
        if documentuploaddata.result == 1 {
            GlobalVariables.documentdateselected = "DD MM YYYY"
            
            GlobalVariables.dynamicdocumentimage = UIImage()
            dismissViewcontroller()
            self.viewcontrollerself.viewWillAppear(true)
        }else{
            
            let alert = UIAlertController(title: "", message: self.documentuploaddata.msg, preferredStyle: .alert)
            let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}

            
            
        }
        

        
    }
    

    
  
}



extension UploadPhotoViewController
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

