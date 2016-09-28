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


typealias Thrower = (Error) -> Void
typealias ErrorThrower = (NSError) -> Void


protocol PresenterProtocol : class {
    associatedtype View = ViewProtocol
    
    func attachView(view: View)
    
    func onLoad()
    
    func beforeAppear()
}

protocol ViewProtocol : class {
    
}

protocol RepositoryProtocol : class {
    
}

protocol ModelProtocol : class {
    
}

protocol DataStoreProtocol : class {
    
}
