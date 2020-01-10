//
//  APIResponse.swift
//  iTunesMediaDemo
//
//  Created by Ashutosh's Macbook on 1/9/20.
//  Copyright © 2020 Ashutosh's Macbook. All rights reserved.
//

import Foundation

import os.log
import SwiftyJSON

class APIResponse: NSObject, NSCoding {
    
    //MARK: Properties
    
    var status: Bool!
    var message: String?
    var response: Any?
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("APIResponse")
    
    //MARK: Types
    struct PropertyKey {
        static let status   = "status"
        static let message  = "message"
        static let response = "feed"
    }
    
    //MARK: Initialization
    override init() {
        // Initialize stored properties.
        self.status = false
        self.message    = ""
        self.response   = ""
    }
    
    init?(Status: Bool, Message: String?, Response: Any?) {
        
        // The name must not be empty
        guard Response != nil else {
            return nil
        }
        
        // Initialize stored properties.
        self.status     = Status
        self.message    = Message
        self.response   = Response
    }
    
    init?(dictResp: JSON) {
        // Initialize stored properties.
        self.status     = dictResp[PropertyKey.status].boolValue
        self.message    = dictResp[PropertyKey.message].stringValue
        self.response   = dictResp[PropertyKey.response].dictionaryObject
    }
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(status, forKey: PropertyKey.status)
        aCoder.encode(message, forKey: PropertyKey.message)
        aCoder.encode(response, forKey: PropertyKey.response)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        // The response is required. If we cannot decode a response string, the initializer should fail.
        guard let response = aDecoder.decodeObject(forKey: PropertyKey.response) else {
            if #available(iOS 10.0, *) {
                os_log("Unable to decode the response for a APIResponse object.", log: OSLog.default, type: .debug)
            } else {
                // Fallback on earlier versions
            }
            return nil
        }
        
        let status  = aDecoder.decodeObject(forKey: PropertyKey.status) as! Bool
        let message = aDecoder.decodeObject(forKey: PropertyKey.message) as! String
        
        self.init(Status: status, Message: message, Response: response)
    }
}
