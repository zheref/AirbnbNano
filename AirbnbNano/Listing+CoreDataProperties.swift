//
//  Listing+CoreDataProperties.swift
//  AirbnbNano
//
//  Created by Sergio Daniel Leztark on 9/27/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation
import CoreData


extension Listing {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Listing> {
        return NSFetchRequest<Listing>(entityName: "Listing");
    }

    @NSManaged public var bathroomsQuantity: Int16
    @NSManaged public var bedroomKind: String?
    @NSManaged public var bedroomsQuantity: Int16
    @NSManaged public var bedsQuantity: Int16
    @NSManaged public var estateKind: String?
    @NSManaged public var guestsCapacity: Int16
    @NSManaged public var housingDescription: String?
    @NSManaged public var latitude: Float
    @NSManaged public var longitude: Float
    @NSManaged public var name: String?
    @NSManaged public var nightPrice: NSDecimalNumber?
    @NSManaged public var picture: NSData?
    @NSManaged public var publicAddress: String?
    @NSManaged public var userEmail: String?

}
