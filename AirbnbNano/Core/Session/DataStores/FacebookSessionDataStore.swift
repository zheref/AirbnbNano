//
//  FacebookSessionDataStore.swift
//  AirbnbNano
//
//  Created by Sergio Daniel Leztark on 9/25/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation

import FacebookCore
import FacebookLogin

class FacebookSessionDataStore : SessionDataStoreProtocol {
    
    func loginByTunneling(fromSender sender: Any?,
                          andReturningBy returner: @escaping SigningInProcessResultReturner) {
        let manager = LoginManager()
        
        manager.logIn([.publicProfile, .email, .userFriends],
                      viewController: sender! as? UIViewController) { loginResult in
                        
            switch loginResult {
                case .failed(let error):
                    log.error(error)
                    returner(.Error)
                case .cancelled:
                    print("User cancelled login.")
                    returner(.Cancelled)
                case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                    log.verbose("Logged in!")
                    returner(.Succeeded)
            }
        }
    }
    
    
    func getUserEmail(byReturner returner: @escaping UserEmailReturner, orFailingWith thrower: @escaping Thrower) {
        let request = GraphRequest(graphPath: "me",
                                   parameters: ["fields": "email"],
                                   accessToken: AccessToken.current,
                                   httpMethod: .GET,
                                   apiVersion: GraphAPIVersion(floatLiteral: 2.7))
        
        request.start { (response: HTTPURLResponse?, result: GraphRequestResult<GraphRequest>) in
            
            switch result {
            case .failed(let error):
                thrower(error)
            case .success(let response):
                if let dict = response.dictionaryValue {
                    returner(dict["email"]! as! String)
                } else {
                    log.error("Could not cast result into dictionary")
                }
            }
        }
    }
    
    
    func getUserPicAndName(by returner: @escaping UserPicAndNameReturner, orFailWith thrower: @escaping Thrower) {
        let request = GraphRequest(graphPath: "me",
                                   parameters: ["fields": "name"],
                                   accessToken: AccessToken.current,
                                   httpMethod: .GET,
                                   apiVersion: GraphAPIVersion(floatLiteral: 2.7))
        
        request.start { (response: HTTPURLResponse?, result: GraphRequestResult<GraphRequest>) in
            
            switch result {
            case .failed(let error):
                thrower(error)
            case .success(let response):
                if let dict = response.dictionaryValue {
                    returner(dict["name"]! as! String, dict["id"]! as! String)
                } else {
                    log.error("Could not cast result into dictionary")
                }
            }
        }
    }
    
}
