//
//  APIManager.swift
//  iTunesMediaDemo
//
//  Created by Ashutosh's Macbook on 1/9/20.
//  Copyright © 2020 Ashutosh's Macbook. All rights reserved.
//

import Foundation

import Alamofire
import SwiftyJSON
import Reachability

class APIManager {

    func reachabilityChanged(note: NSNotification) {
        
        let reachability = note.object as! Reachability
        
        if reachability.connection != .unavailable {
            if reachability.connection == .wifi {
                //"Reachable via WiFi"
            } else {
                //"Reachable via Cellular"
            }
        } else {
            //"Network not reachable"
        }
    }
    
    func getFromServer(requestURL : String, completion: @escaping ((_ responseObj: APIResponse) -> Void)) {
        URLCache.shared.removeAllCachedResponses()

        var strURL = URL_BASE + requestURL
        strURL = strURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        Alamofire.request(strURL).responseJSON { (responseData) -> Void in
            if (responseData.result.error != nil) {
                let objResponse = APIResponse.init()
                objResponse.status = false
                objResponse.message = responseData.result.error?.localizedDescription
                completion(objResponse)
            } else {
                if((responseData.result.value) != nil) {
                    let swiftyJsonVar = JSON(responseData.result.value!)
                    let objResponse = APIResponse.init(dictResp: swiftyJsonVar)
                    completion(objResponse!)
                }
            }
        }
    }
    
    func fetchMediaFromServer(requestParameter: String!, completion:@escaping ((_ response: APIResponse) -> Void)) {
        
        getFromServer(requestURL: requestParameter) { (responseObj) in
            do {
                if responseObj.status && responseObj.response != nil {
                    let resp = responseObj.response as! NSDictionary
                    print(resp)
                    completion(responseObj)
                } else {
                    completion(responseObj)
                }
            }
        }
    }

}
