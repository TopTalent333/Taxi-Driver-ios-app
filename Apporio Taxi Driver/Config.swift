import UIKit

class Config: NSObject {
    
    // MARK: - The default amount and currency that are used for all payments
    static let amount: Double = 1.00
    static let currency: String = "ZAR"
    
    // MARK: - The payment brands for Ready-to-use UI
    static let checkoutPaymentBrands = ["VISA", "MASTER" , "AMEX"]
    
    // MARK: - Other constants
    static let asyncPaymentCompletedNotificationKey = "AsyncPaymentCompletedNotificationKey"
    static let schemeURL = "com.tagyourride.driver.payment"
    static let mainColor: UIColor = UIColor.init(red: 63.0/255.0, green:14.0/255.0, blue: 65.0/255.0, alpha: 1.0)
}

