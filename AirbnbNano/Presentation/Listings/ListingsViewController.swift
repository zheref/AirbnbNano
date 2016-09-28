//
//  ListingsViewController.swift
//  AirbnbNano
//
//  Created by Sergio Daniel Leztark on 9/27/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import UIKit


class ListingsViewController : UITableViewController {
    
    override func viewDidLoad() {
        let store = NetworkListingsDataStore()
        
        store.getListings(by: { listings in
            
        }, orFailWith: { error in
            
        })
    }
    
}
