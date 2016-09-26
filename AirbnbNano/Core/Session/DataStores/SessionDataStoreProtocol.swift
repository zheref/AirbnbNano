//
//  SessionDataStoreProtocol.swift
//  AirbnbNano
//
//  Created by Sergio Daniel Leztark on 9/25/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation

enum SigningInProcessResult {
    case Succeeded
    case Cancelled
    case Error
}

typealias SigningInProcessResultReturner = (SigningInProcessResult) -> Void
typealias UserEmailReturner = (String) -> Void


protocol SessionDataStoreProtocol {
    func loginByTunneling(fromSender sender: Any?,
                          andReturningBy returner: @escaping SigningInProcessResultReturner)
    
    
    func getUserEmail(byReturner returner: @escaping UserEmailReturner, orFailingWith thrower: @escaping Thrower)
    
}
