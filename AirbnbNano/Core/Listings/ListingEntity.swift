//
//  ListingEntity.swift
//  AirbnbNano
//
//  Created by Sergio Daniel Leztark on 9/27/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation

class ListingEntity {
    
    var bathroomsQuantity: Int16 = 0
    var bedroomKind: String?
    var bedroomsQuantity: Int16 = 0
    var bedsQuantity: Int16 = 0
    var estateKind: String?
    var guestsCapacity: Int16 = 0
    var housingDescription: String?
    var latitude: Float = 0
    var longitude: Float = 0
    var name: String?
    var nightPrice: NSDecimalNumber?
    var picture: NSData?
    var pictureUrl: String?
    var publicAddress: String?
    var userEmail: String?
    
    
    static func from(dict: [String: Any]) -> ListingEntity {
        if let listingInfo = dict["listing"] as? [String: Any] {
            let listing = ListingEntity()
            listing.name = listingInfo["name"] as? String
            listing.pictureUrl = listingInfo["picture_url"] as? String
            listing.estateKind = listingInfo["property_type"] as? String
            return listing
        } else {
            log.error("Could not cast")
            return ListingEntity()
        }
    }
    
    
    static func from(dicts: [[String: Any]]) -> [ListingEntity] {
        var entities = [ListingEntity]()
        
        for dict in dicts {
            entities.append(from(dict: dict))
        }
        
        return entities
    }
    
}
