//
//  ListingsPresenter.swift
//  AirbnbNano
//
//  Created by Sergio Daniel Leztark on 9/28/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation


protocol ListingsPresenterProtocol : PresenterProtocol {
    
    var listings: [ListingEntity] { get }
    
}


class ListingsPresenter : ListingsPresenterProtocol {
    
    weak var vc: ListingsViewControllerProtocol?
    
    var listings: [ListingEntity] = [ListingEntity]()
    
    var repository: ListingsRepository
    
    
    init(withRepository repository: ListingsRepository) {
        self.repository = repository
    }
    
    
    func attachView(view: ListingsViewControllerProtocol) {
        vc = view
    }
    
    
    func onLoad() {
        repository.getListings(by: { listings in
            self.listings = listings
            self.vc?.reload()
        }, orFailWith: { error in
            log.error(error)
        })
    }
    
    
    func beforeAppear() {
        
    }
    
}
