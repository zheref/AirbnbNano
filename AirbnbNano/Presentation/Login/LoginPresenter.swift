//
//  LoginPresenter.swift
//  AirbnbNano
//
//  Created by Sergio Daniel Leztark on 9/24/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation


protocol LoginPresenterProtocol : PresenterProtocol {
    
    func onSignInWithFacebook()
    
}


class LoginPresenter : LoginPresenterProtocol {
    
    var repository: SessionRepository
    
    weak var vc: LoginViewControllerProtocol?
    
    
    init(withSessionRepository repository: SessionRepository) {
        self.repository = repository
    }
    
    
    func attachView(view: LoginViewControllerProtocol) {
        vc = view
    }
    
    
    func onLoad() {
        
    }
    
    
    func beforeAppear() {
        
    }
    
    
    func onSignInWithFacebook() {
        repository.loginWithFacebook(fromSender: vc) { (result) in
            switch result {
            case .Cancelled:
                break
            case .Error:
                break
            case .Succeeded:
                break
            }
        }
    }
    
}
