//
//  Globals.swift
//  AirbnbNano
//
//  Created by Sergio Daniel Leztark on 9/25/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation
import XCGLogger

let log = XCGLogger.default

protocol PresenterProtocol : class {
    associatedtype View = ViewProtocol
    
    func attachView(view: View)
}

protocol ViewProtocol : class {
    
}

protocol RepositoryProtocol : class {
    
}

protocol ModelProtocol : class {
    
}
