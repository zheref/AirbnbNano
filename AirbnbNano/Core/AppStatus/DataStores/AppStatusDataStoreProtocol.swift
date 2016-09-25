//
//  AppStatusDataStoreProtocol.swift
//  AirbnbNano
//
//  Created by Sergio Daniel Leztark on 9/25/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation

typealias IsLoggedInAnswer = (String?) -> Void

protocol AppStatusDataStoreProtocol : DataStoreProtocol {
    
    func isUserLoggedIn(answeringThrough answer: IsLoggedInAnswer)
    
    func notifyUserHasLoggedIn(withEmail email: String)
    
    func notifyUserHasLoggedOut()
    
}
