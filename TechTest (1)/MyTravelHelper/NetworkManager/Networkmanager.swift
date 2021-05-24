//
//  Networkmanager.swift
//  MyTravelHelper
//
//  Created by Divyam on 25/05/21.
//  Copyright © 2021 Sample. All rights reserved.
//

import Foundation

class HttpClient  {
    
    
    private static var sharedNetworkManager: HttpClient = {
        let networkManager = HttpClient()
        return networkManager
    }()
    
    class func shared() -> HttpClient {
        return sharedNetworkManager
    }
    private init() {
        
    }
   
    func httpGet(url: String!, callback: @escaping (_ result: Data?,
                                              Error?) -> Void) {
        let task = Foundation.URLSession.shared.dataTask(with: NSURL(string: url)! as URL, completionHandler: { (data, response, error) -> Void in
                callback(data, error)
        })
         task.resume()
    }
    
 }
