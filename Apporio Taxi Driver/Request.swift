import UIKit
import Alamofire
//TODO: This class uses our test integration server; please adapt it to use your own backend API.
class Request: NSObject {
    
    // Test merchant server domain
    static let serverDomain = "http://www.tyradmin.co.za/api"
    static let notifyDomain = "http://www.tyradmin.co.za/notify"
    
    static func requestTokenCheckoutID(url:String, completion: @escaping ([String:String]) -> Void) {
        Alamofire.request(url).validate().responseJSON { response in
            switch response.result {
            case .success:
                print(response.value)
                if let data = response.value as? [String:Any] {
                    let result = data["result"] as! String
                    let msg = data["msg"] as! [String:String]
                    if result == "1"{
                        completion(msg)
                    } else {
                        completion(["result":"0"])
                    }
                } else {
                    completion(["result":"0"])
                }
            case .failure:
                completion(["result":"0"])
            }
        }
    }
    static func requestPaymentStatus1(resourcePath: String, completion: @escaping ([String:Any]) -> Void) {
        Alamofire.request(serverDomain+"/pay_with_token_req.php",method:.post,parameters:["resourcePath":resourcePath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!]).validate().responseJSON { response in
            print(response)
            switch response.result {
            case .success:
                print(response)
                let res = response.value as! [String:Any]
                completion(res)
            case .failure:
                completion(["result":"0"])
            }
        }
    }
}

