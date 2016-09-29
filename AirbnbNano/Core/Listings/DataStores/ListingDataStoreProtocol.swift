//
//  ListingDataStoreProtocol.swift
//  AirbnbNano
//
//  Created by Sergio Daniel Leztark on 9/27/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation

typealias ListingsReturner = ([ListingEntity]) -> Void

protocol ListingsDataStoreProtocol : DataStoreProtocol {
    
    func getListings(by returner: @escaping ListingsReturner, orFailWith thrower: Thrower)
    
}
