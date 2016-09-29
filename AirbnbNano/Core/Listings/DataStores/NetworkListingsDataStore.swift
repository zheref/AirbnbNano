//
//  NetworkListingDataStore.swift
//  AirbnbNano
//
//  Created by Sergio Daniel Leztark on 9/27/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation
import Alamofire


class NetworkListingsDataStore : ListingsDataStoreProtocol {
    
    
    func getListings(by returner: @escaping ListingsReturner, orFailWith thrower: Thrower) {
        
        Alamofire.request(KUris.exampleLink).responseJSON { (payload: DataResponse<Any>) in
            if let dict = payload.result.value as? [String: Any] {
                if let searchResults = dict["search_results"]! as? [[String:Any]] {
                    let parsedResults = ListingEntity.from(dicts: searchResults)
                    returner(parsedResults)
                } else {
                    log.error("Could not cast into array of dictionaries")
                }
            } else {
                log.error("Could not cast response data into dictionary")
            }
        }
    }
    
    
}
