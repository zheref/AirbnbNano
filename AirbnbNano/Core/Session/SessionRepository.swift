//
//  SessionRepository.swift
//  AirbnbNano
//
//  Created by Sergio Daniel Leztark on 9/25/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation
import FBSDKLoginKit

class SessionRepository : RepositoryProtocol {
    
    var dataStore: SessionDataStoreProtocol
    
    init(withDataStore dataStore: SessionDataStoreProtocol) {
        self.dataStore = dataStore
    }
    
    func loginWithFacebook(fromSender sender: Any?,
                           andReturningBy returner: @escaping SigningInProcessResultReturner) {
        dataStore.loginByTunneling(fromSender: sender, andReturningBy: {
            (result) -> Void in
            
            if result == .Succeeded {
                let appStatusDataStore = LocalAppStatusDataStore()
                
                self.dataStore.getUserEmail(byReturner: { (email) in
                    appStatusDataStore.notifyUserHasLoggedIn(withEmail: email)
                }, orFailingWith: { (error) in
                    log.severe(error.localizedDescription)
                })
            }
            
            returner(result)
        })
    }
    
}
