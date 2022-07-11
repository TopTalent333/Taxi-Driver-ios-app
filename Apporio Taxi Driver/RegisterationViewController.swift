//
//  RegisterationViewController.swift
//  Apporio Taxi Driver
//
//  Created by AppOrio on 06/06/17.
//  Copyright © 2017 apporio. All rights reserved.
//

import UIKit
import DropDown


class RegisterationViewController: UIViewController,ParsingStates, UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    
    var username: String = ""
    var carimage: UIImage = UIImage()
    var email: String = ""
    var mobile: String = ""
    var pwd: String = ""
    var carmodelid: String = ""
    var carnumber: String = ""
    var cartypeid: String = ""
    var cityid: String = ""
    var data: RegisterDriver!
    var carModelData: CarModel!
    var cartypeData: CarType!
    var cityData: CityTypeModel!
    var cartypeArray = [String]()
    var cityArray = [String]()
    var carModelArray = [String]()
    let dropDown = DropDown()
    let dropDown1 = DropDown()
    let dropDown2 = DropDown()
 
    
    
    @IBOutlet weak var boundaryview: UIView!
    
  
    @IBOutlet weak var register_btn: UIButton!
    @IBOutlet weak var carNoField: UITextField!
    @IBOutlet weak var pwdField: UITextField!
    @IBOutlet weak var mobileField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
   
    @IBOutlet weak var city_view: UIView!
    @IBOutlet weak var carModel_view: UIView!
    @IBOutlet weak var carType_view: UIView!
    
    @IBOutlet weak var citytextlabel: UILabel!
    
    @IBOutlet weak var cartypetextlabel: UILabel!
    
    @IBOutlet weak var carmodeltextlabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var DriverCarView: UIView!
    
    @IBOutlet weak var DriverCarImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        boundaryview.layer.cornerRadius = 5
        boundaryview.layer.borderWidth = 1.0
        boundaryview.layer.borderColor = UIColor.lightGray.cgColor
        
        DriverCarImage.layer.cornerRadius = DriverCarImage.bounds.size.width/2
        DriverCarImage.clipsToBounds = true
        
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(EditProfileViewController.imageTapped(_:)))
        DriverCarImage.isUserInteractionEnabled = true
        DriverCarImage.addGestureRecognizer(tapGestureRecognizer)
        
        APIManager.sharedInstance.delegate = self
        APIManager.sharedInstance.viewcityType()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillLayoutSubviews() {
        
       
        
        super.viewWillLayoutSubviews()
        self.scrollView.frame = self.scrollView.bounds
        self.scrollView.contentSize.height =  700
        self.scrollView.contentSize.width = 0
    }
    
    
    @IBAction func backbtn(_ sender: Any) {
        dismissViewcontroller()
    }
    
    func imageTapped(_ img: AnyObject)
    {
        let imagePicker = UIImagePickerController()
        
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
        imagePicker.allowsEditing = false
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
         let image = info[UIImagePickerControllerOriginalImage] as! UIImage
            
             carimage = self.RBResizeImage(image, targetSize: CGSize(width: 500, height: 500))
            
            DriverCarImage.image = image
       
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func select_city_btn(_ sender: Any) {
        
        dropDown2.anchorView = city_view
        dropDown2.topOffset = CGPoint(x:0, y: self.city_view.bounds.height)
        
        self.dropDown2.width = 200
        self.dropDown2.cellHeight = 50
        
        
        self.dropDown2.show()
        
        dropDown2.selectionAction = { [unowned self] (index: Int, item: String) in
            print("Selected item: \(item) at index: \(index)")
            
            GlobalVariables.cityid = self.cityData.msg![index].cityId!
            print(GlobalVariables.cityid)
            GlobalVariables.city = self.cityData.msg![index].cityName!
            self.citytextlabel.text = item
            
            if GlobalVariables.cityid != ""{
                
                APIManager.sharedInstance.delegate = self
                APIManager.sharedInstance.viewCarType(cityId: GlobalVariables.cityid)
            }
            
            
            self.dropDown2.hide()
        }
        
        

    }
    
    
    @IBAction func select_car_type_btn(_ sender: Any) {
        
        if citytextlabel.text == "Select City" {
            let alert = UIAlertController(title: "", message: NSLocalizedString("Please select city first ",comment: ""), preferredStyle: .alert)
            let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
        else {
            
            
            
            dropDown.anchorView = carType_view
            dropDown.topOffset = CGPoint(x:0, y: self.carType_view.bounds.height)
            
            self.dropDown.width = 200
            self.dropDown.cellHeight = 50
            
            
            self.dropDown.show()
            
            dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
                print("Selected item: \(item) at index: \(index)")
                
                GlobalVariables.cartypeid = self.cartypeData.msg![index].carTypeId!
                print(GlobalVariables.cartypeid)
                // GlobalVariables.cityid = self.cartypeData.msg![index].cityId!
                self.cartypetextlabel.text = item
                if GlobalVariables.cartypeid != ""{
                    
                    APIManager.sharedInstance.delegate = self
                    APIManager.sharedInstance.viewCarModels(carTypeid: GlobalVariables.cartypeid)
                }
                self.dropDown.hide()
            }
            
        }

    }

    @IBAction func select_car_model_btn(_ sender: Any) {
        
        if cartypetextlabel.text == "Select Car Type" {
            let alert = UIAlertController(title: "", message:NSLocalizedString("Please select car type first ", comment: ""), preferredStyle: .alert)
            let action = UIAlertAction(title:  NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
        else {
            
            
            dropDown1.anchorView = carModel_view
            dropDown1.topOffset = CGPoint(x:0, y: self.carModel_view.bounds.height)
            
            self.dropDown1.width = 200
            self.dropDown1.cellHeight = 50
            
            
            self.dropDown1.show()
            
            dropDown1.selectionAction = { [unowned self] (index: Int, item: String) in
                print("Selected item: \(item) at index: \(index)")
                
                GlobalVariables.carModelid = self.carModelData.msg![index].carModelId!
                print(GlobalVariables.carModelid)
                GlobalVariables.carModelName = self.carModelData.msg![index].carModelName!
                self.carmodeltextlabel.text = item
                self.dropDown1.hide()
            }
        }

    }
    
    
    @IBAction func Register_btn_click(_ sender: Any) {
        
        username = usernameField.text!
        email = emailField.text!
        mobile = mobileField.text!
        pwd = pwdField.text!
        cityid = GlobalVariables.cityid
        cartypeid = GlobalVariables.cartypeid
        carmodelid = GlobalVariables.carModelid
        carnumber = carNoField.text!

        
        if ((username == "") || (email == "") || (mobile == "") || (pwd == "") || (self.carmodelid == "") || (carnumber == "") || (self.cartypeid == "") || (self.cityid == "")){
            
            let alert = UIAlertController(title:NSLocalizedString("Registeration Failed!", comment: ""), message:NSLocalizedString("Fields cannot be blank", comment: ""), preferredStyle: .alert)
            let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
            
        else if ((mobile.characters.count < 10) || (mobile.characters.count > 10 ))
        {
            let alert = UIAlertController(title: NSLocalizedString("Registeration Failed!", comment: ""), message:NSLocalizedString("Mobile number must be 10  digits", comment: ""), preferredStyle: .alert)
            let action = UIAlertAction(title:  NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
            
        else if (carmodeltextlabel.text == "Select Car Model")
        {
            let alert = UIAlertController(title: NSLocalizedString("Registeration Failed!", comment: ""), message:NSLocalizedString("Please Select Model ", comment: ""), preferredStyle: .alert)
            let action = UIAlertAction(title:  NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
            
        else if (cartypetextlabel.text == "Select Car Type")
        {
            let alert = UIAlertController(title: "", message:NSLocalizedString("Please Select CarType ", comment: ""), preferredStyle: .alert)
            let action = UIAlertAction(title:  NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
            
            
            
            
        else if (!email.contains("@"))
        {
            let alert = UIAlertController(title: NSLocalizedString("Registeration Failed!", comment: ""), message:NSLocalizedString(" Wrong Email format ", comment: ""), preferredStyle: .alert)
            let action = UIAlertAction(title:  NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
            
        else if (email.contains(" "))
        {
            let alert = UIAlertController(title: "", message:NSLocalizedString(" Email id must not contain space ", comment: ""), preferredStyle: .alert)
            let action = UIAlertAction(title:  NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
        }
        
        else if carimage == UIImage() {
            let alert = UIAlertController(title: NSLocalizedString("Upload Image", comment: ""), message: NSLocalizedString("Please upload car image first ", comment: ""), preferredStyle: .alert)
            let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { _ in
                
            }
            alert.addAction(action)
            self.present(alert, animated: true){}
            
        }
            
        else
        {
            
            
            
                APIManager.sharedInstance.delegate = self
                APIManager.sharedInstance.registerDriver(email: email, phone: mobile, pass: pwd, name: username, cartype_id: cartypeid, carmodelId: carmodelid, carnumber: carnumber, cityid: cityid, carImage: carimage)
                
        }

    }
    
    
    func onSuccessState(_ data: AnyObject , resultCode: Int) {
        
        if resultCode == 33 {
            
            
            self.data = data as! RegisterDriver
            if(self.data.result == 1){
                
                
            NsUserDefaultManager.SingeltonInstance.registerDriver(insurance: (self.data.details?.insurance!)!, rc: (self.data.details?.rc!)!, licence: (self.data.details?.license!)!, did: (self.data.details?.deviceId!)!, carModelId: (self.data.details?.carModelId!)!, otherDoc: (self.data.details?.otherDocs!)!, driverId: (self.data.details?.driverId!)!, driverImg: (self.data.details?.driverImage!)!, driverEmail: (self.data.details?.driverEmail!)!, driverName: (self.data.details?.driverName!)!, flag: (self.data.details?.flag!)!, long: (self.data.details?.currentLong!)!, cityid: (self.data.details?.cityId!)!, carNo: (self.data.details?.carNumber!)!, password: (self.data.details?.driverPassword!)!, lat: (self.data.details?.currentLat!)!, phoneNo: (self.data.details?.driverPhone!)!, carType: (self.data.details?.carTypeId!)!, onOff: (self.data.details?.onlineOffline!)!, status: (self.data.details?.status!)!, loginLogout: (self.data.details?.loginLogout!)!,driverToken: (self.data.details?.driverToken!)!,detailStatus : (self.data.details?.detailStatus)!,carmodelname : (self.data.details?.carModelName!)! , cartypename : (self.data.details?.carTypeName!)!,cityname : (self.data.details?.cityname!)!,Driverstatusimage: (self.data.details?.driverstatusimage)!,Driverstatusmessage: (self.data.details?.driverstatusmessage)!, DriverCarImage: (self.data.details?.drivercarImage!)!)
                
                
              /*  let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: UploadDocumentViewController = storyboard.instantiateViewController(withIdentifier: "UploadDocumentViewController") as! UploadDocumentViewController
                self.present(next, animated: true, completion: nil)*/
                
                let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let next: DocumentStatusViewController = storyboard.instantiateViewController(withIdentifier: "DocumentStatusViewController") as! DocumentStatusViewController
                self.present(next, animated: true, completion: nil)
                
            }else{
                
                let alert = UIAlertController(title: self.data.msg!, message: self.data.msg!, preferredStyle: .alert)
                let action = UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) { _ in
                    
                }
                alert.addAction(action)
                self.present(alert, animated: true){}
                
            }
            
            
        }
        
        if resultCode == 22 {
            
            self.cartypeData = data as! CarType
            if self.cartypeData.result == 1 {
                
                cartypeArray.removeAll()
                
                for items in  self.cartypeData.msg!
                {
                    
                    if(UserDefaults.standard.object(forKey: "PreferredLanguage") as! String == "en"){
                        
                        cartypeArray.append(items.carTypeName!)
                    }else{
                        cartypeArray.append(items.carTypeName!)
                    }
                    
                    
                    
                    
                    dropDown.dataSource = cartypeArray
                    
                }
            }
        }
        
        
        if resultCode == 11 {
            
            self.carModelData = data as! CarModel
            if self.carModelData.result == 1 {
                
                carModelArray.removeAll()
                
                for items in  self.carModelData.msg!
                {
                    
                    if(UserDefaults.standard.object(forKey: "PreferredLanguage") as! String == "en"){
                        
                        carModelArray.append(items.carModelName!)
                    }else{
                        carModelArray.append(items.carModelName!)
                        
                    }
                    
                    
                    
                    dropDown1.dataSource = carModelArray
                    
                }
            }
        }
        
        
        if resultCode == 1003 {
            
            self.cityData = data as! CityTypeModel
            
            if self.cityData.result == 1 {
                
                cityArray.removeAll()
                
                for items in  self.cityData.msg!
                {
                    
                    if(UserDefaults.standard.object(forKey: "PreferredLanguage") as! String == "en"){
                        
                        cityArray.append(items.cityName!)
                    }else{
                        cityArray.append(items.cityName!)
                    }
                    
                    
                    //  cityArray.append(items.cityName!)
                    //selectcity_field.text = items.cityName
                    
                    print(cityArray)
                    
                    dropDown2.dataSource = cityArray
                    
                }
            }
        }
        
        
        
        
        
    }
    
    // ********************* Textfield delegate ***************************
    
    
    override func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true;
    }
    

    
    
}

extension RegisterationViewController
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


