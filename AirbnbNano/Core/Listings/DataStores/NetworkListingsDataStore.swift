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
    
    
    func getListings(by returner: ListingsReturner, orFailWith thrower: Thrower) {
        
        Alamofire.request(KUris.exampleLink).responseJSON { (payload: DataResponse<Any>) in
            print(payload.response)
            
            if let JSON = payload.result.value {
                print("JSON: \(JSON)")
            }
        }
    }
    
    
}
