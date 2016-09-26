//
//  FacebookSessionDataStore.swift
//  AirbnbNano
//
//  Created by Sergio Daniel Leztark on 9/25/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation
import FBSDKLoginKit

class FacebookSessionDataStore : SessionDataStoreProtocol {
    
    func loginByTunneling(fromSender sender: Any?,
                          andReturningBy returner: @escaping SigningInProcessResultReturner) {
        let manager = FBSDKLoginManager()
        
        manager.logIn(withReadPermissions: ["public_profile", "email"],
                      from: sender! as! UIViewController) { (result, error) in
                        
            if let error = error {
                log.error(error.localizedDescription)
                returner(.Error)
            } else if result!.isCancelled {
                returner(.Cancelled)
            } else {
                returner(.Succeeded)
            }
        }
    }
    
    
    func getUserEmail(byReturner returner: @escaping UserEmailReturner, orFailingWith thrower: @escaping Thrower) {
        let request = FBSDKGraphRequest(graphPath: "me",
                                        parameters: ["fields": "email,name"],
                                        tokenString: FBSDKAccessToken.current().tokenString,
                                        version: nil, httpMethod: "GET")
        
        request?.start(completionHandler: { (connection, result, error) in
            log.verbose(connection?.description)
            
            if let error = error {
                thrower(error)
            } else {
                if let dict = result as? [String: AnyObject] {
                    returner(dict["email"]! as! String)
                } else {
                    log.error("Could not cast result into dictionary")
                }
            }
        })
    }
    
}
