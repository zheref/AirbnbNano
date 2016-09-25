//
//  LocalAppStatusDataStore.swift
//  AirbnbNano
//
//  Created by Sergio Daniel Leztark on 9/25/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation

class LocalAppStatusDataStore: AppStatusDataStoreProtocol {
    
    private static let LoggedInEmailKey = "LoggedInEmail"
    
    func isUserLoggedIn(answeringThrough answer: IsLoggedInAnswer) {
        let defaults = UserDefaults.standard
        
        answer(defaults.object(forKey: LocalAppStatusDataStore.LoggedInEmailKey) as? String)
    }
    
    func notifyUserHasLoggedIn(withEmail email: String) {
        let defaults = UserDefaults.standard
        
        defaults.set(email, forKey: LocalAppStatusDataStore.LoggedInEmailKey)
    }
    
    func notifyUserHasLoggedOut() {
        let defaults = UserDefaults.standard
        
        defaults.removeObject(forKey: LocalAppStatusDataStore.LoggedInEmailKey)
    }
    
}
