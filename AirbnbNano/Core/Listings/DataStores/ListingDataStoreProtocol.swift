//
//  ListingDataStoreProtocol.swift
//  AirbnbNano
//
//  Created by Sergio Daniel Leztark on 9/27/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation

typealias ListingsReturner = ([Listing]) -> Void

protocol ListingsDataStoreProtocol {
    
    func getListings(by returner: ListingsReturner, orFailWith thrower: Thrower)
    
}
