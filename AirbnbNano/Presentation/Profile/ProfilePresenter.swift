//
//  ProfilePresenter.swift
//  AirbnbNano
//
//  Created by Sergio Daniel Leztark on 9/28/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation


protocol ProfilePresenterProtocol : PresenterProtocol {
    
}


class ProfilePresenter : ProfilePresenterProtocol {
    
    var repository: SessionRepository
    
    weak var vc: ProfileViewControllerProtocol?
    
    
    init(withSessionRepository repository: SessionRepository) {
        self.repository = repository
    }
    
    
    func attachView(view: ProfileViewControllerProtocol) {
        vc = view
    }
    
    
    func onLoad() {
        repository.getUserNameAndPic(by: { (name, imageUrl) in
            self.vc?.name = name
            self.vc?.profilePic = imageUrl
        }) { error in
            log.error(error)
        }
    }
    
    
    func beforeAppear() {
        
    }

    
}
