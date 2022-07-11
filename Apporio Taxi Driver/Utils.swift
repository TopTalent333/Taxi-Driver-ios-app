import UIKit

class Utils: NSObject {
    var message : String = ""
    static func SDKVersion() -> String? {
        if let path = Bundle.main.path(forResource: "OPPWAMobile-Resources.bundle/version", ofType: "plist") {
            if let versionDict = NSDictionary(contentsOfFile: path) as? [String: String] {
                return versionDict["OPPVersion"]
            }
        }
        return ""
    }
    
    static func amountAsString() -> String {
        return String(format: "%.2f", Config.amount) + " " + Config.currency
    }
    
    static func showResult(presenter: UIViewController, success: Bool, message: String?) {
        let title = success ? "Success" : "Failure"
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        presenter.present(alert, animated: true, completion: nil)
    }
    
    static func configureCheckoutSettings() -> OPPCheckoutSettings {
        let checkoutSettings = OPPCheckoutSettings.init()
        checkoutSettings.paymentBrands = Config.checkoutPaymentBrands
        checkoutSettings.schemeURL = Config.schemeURL
        checkoutSettings.skipCVV = OPPCheckoutSkipCVVMode.forStoredCards
        checkoutSettings.theme.navigationBarBackgroundColor = Config.mainColor
        checkoutSettings.theme.confirmationButtonColor = Config.mainColor
        checkoutSettings.theme.cellHighlightedBackgroundColor = Config.mainColor
        checkoutSettings.theme.sectionBackgroundColor = Config.mainColor.withAlphaComponent(0.05)
        
        return checkoutSettings
    }
}
