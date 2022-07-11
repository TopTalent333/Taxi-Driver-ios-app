//
//  API_URLs.swift
//  TaxiAppDriver
//
//  Created by Rakesh kumar on 22/08/16.
//  Copyright © 2016 Apporio. All rights reserved.
//


    
    public class API_URLs {
        
     //  public static var basedomain = "http://apporio.co.uk/apporiotaxi/api/"
     //  public static var imagedomain = "http://apporio.co.uk/apporiotaxi/"
        
     //   public static var basedomain = "http://apporioinfolabs.com/apporiotaxi/api/"
      //  public static var imagedomain = "http://apporioinfolabs.com/apporiotaxi/"
        
        public static var basedomain = GlobalVariables.DriverBaseUrl
         public static var imagedomain = GlobalVariables.DriverImageBaseUrl
        
        
        
      //  public static var rentaldomain = "http://apporioinfolabs.com/Apporiotaxi_new/Rental/"
        
        
        public static var rentaldomain = "http://www.tyradmin.co.za/tagyourride/index.php?/Rental/"
        
        
        
        public static var rentalridesync = rentaldomain + "Ride_Sync"
        
        public static var rentaldrivercancel = rentaldomain + "Rental_Driver_Cancel_Ride"
        
        public static var rentalrideinfo = rentaldomain + "Ride_Info"
        
        public static var rentalrideaccept = rentaldomain + "Rental_Ride_Accept"
        
        public static var rentalridereject = rentaldomain + "Rental_Driver_Reject_Ride"
        
        public static var rentalridearrive = rentaldomain + "Rental_Driver_Arrive"
        
        public static var rentalridestart = rentaldomain + "Rental_Driver_Start_Ride"
        
        public static var rentalrideend = rentaldomain + "Rental_Driver_End_Ride"
        
        public static var rentalcancelreason = rentaldomain + "Common/Cancel_Reasons"
        
       
        
         public static var emergencycontacturl =  "http://www.tyradmin.co.za/tagyourride/index.php?/Common/SOS"
        
         public static var emergencycontactmessage = "http://www.tyradmin.co.za/tagyourride/index.php?/Common/SOS_Request"
        
        
         public static var sosmessageurl = basedomain + "sos_message.php?ride_id="
        
        public static var yourride = "http://www.tyradmin.co.za/tagyourride/index.php?/Driver/Driver_Ride_History"
        
         public static var RentalViewRideInfo = "http://www.tyradmin.co.za/tagyourride/index.php?/User/Ride_Details"
        
          public static var Rentalridefareinfo = "http://www.tyradmin.co.za/tagyourride/index.php?/Rental/Done_Ride_Info"
        
          public static var Rentalratinginfo = "http://www.tyradmin.co.za/tagyourride/index.php?/Rental/Rating"
        
        public static var customersupport = "http://www.tyradmin.co.za/tagyourride/index.php?/Common/Customer_support"
        
        public static var driverreport  = "http://www.tyradmin.co.za/tagyourride/index.php?/Driver/Driver_Report"
        
         public static var NotificationUrl = "http://www.tyradmin.co.za/tagyourride/index.php?/Common/Notification"
       
       public static var UploadDocumentStep =  basedomain + "upload_document.php"


        public static var DemoRegister = basedomain + "demo_register_driver.php"

       // public static var customersupport = basedomain + "customer_support.php?driver_id="

      // http://apporio.co.uk/apporiotaximulti/
        public static var Register = basedomain + "register_driver.php"
        public static var register2 = basedomain + "register_driver_docs.php?driver_id="
       // public static var registerTesting = basedomain + "register_driver_testing.php?driver_email="
        public static var documentType = basedomain + "document_type.php?"
        public static var loginMobile = basedomain + "login_driver.php?driver_email_phone="
        public static var ChangePassword = basedomain + "change_password_driver.php?driver_id="
        public static var forgotpassword = basedomain + "forgot_password_driver.php?driver_email="
        public static var Editprofile = basedomain + "edit_profile_driver.php?"
        public static var viewProfile = basedomain + "view_profile_driver.php?driver_id="
        public static var GoOnline = basedomain + "online_offline.php?driver_id="
        public static var logoutDriver = basedomain + "logout_driver.php?driver_id="
        public static var ViewUserInfo = basedomain + "view_user_info.php?user_id="
        
        public static var DriverHome = basedomain + "driver_latlong.php"
        public static var DriverArrived = basedomain + "ride_arrived.php?ride_id="
        public static var RideEnd = basedomain + "ride_end_meter.php"
        public static var RideBegin = basedomain + "ride_start.php"
        public static var UpdateDriverLocation = basedomain + "ride_lat_long.php?ride_id="
        public static var trackRide = basedomain + "track_latlong.php?ride_id="
        
        public static var AddDeviceID = basedomain + "deviceid_driver.php?driver_id="
        
        public static var ViewRideInfo = basedomain + "view_ride_info_driver.php?ride_id="
        public static var AcceptRide = basedomain + "ride_accept.php?ride_id="
        public static var RejectRide = basedomain + "ride_reject.php?ride_id="
        
        public static var RateCustomer = basedomain + "rating_driver.php?driver_id="
        
        
        public static var TermsAndConditions = basedomain + "tc.php?"
        public static var Aboutus = basedomain + "about.php?"
        
        public static var ViewcarModels = basedomain + "car_model.php?car_type_id="
        
        public static var ViewCity = basedomain + "city.php?"

        
        public static var Viewcars = basedomain + "car_by_city.php?city_id="
        public static var callSupport = basedomain + "call_support.php?"
      //  public static var yourride = basedomain + "view_rides_driver.php?driver_id="
        public static var driverearning = basedomain + "driver_earnings.php?driver_id="
         public static var driverearning1 = basedomain + "driver_account.php?driver_id="
        
        public static var weeklystatementurl = basedomain + "week_amount.php?driver_id="
        
        public static var daystatement = basedomain + "daily_amount.php?driver_id="
        public static var drivercancelreason = basedomain + "cancel_reason_driver.php?"
        
        public static var Cancelbydriver = basedomain + "ride_cancel_driver.php?ride_id="
        
        public static var driversync = basedomain + "new_ride_sync.php?ride_id="
        
       
        
         public static var viewdonerideinfo = basedomain + "view_done_ride_info.php?done_ride_id="
        
        public static var driversyncurl = basedomain + "driver_sync.php?driver_id="
        
         public static var changedropLoc = basedomain + "change_drop_location.php"
        
        public static var heatmapurl = basedomain + "heatmap.php?driver_id="
        
        public static var documentlisturl = basedomain + "document_list.php?city_id="
        
        
       
        
       
        
        
    
}
