//
//  LoginPresenter.swift
//  AirbnbNano
//
//  Created by Sergio Daniel Leztark on 9/24/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation


protocol LoginPresenterProtocol : PresenterProtocol {
    
    func onLoginDidLoad()
    
    func onLoginWillAppear()
    
    func onSignInWithFacebook()
    
}


class LoginPresenter : LoginPresenterProtocol {
    
    weak var vc: LoginViewControllerProtocol?
    
    init() {
        
    }
    
    func attachView(view: LoginViewControllerProtocol) {
        vc = view
    }
    
    func onLoginDidLoad() {
        
    }
    
    func onLoginWillAppear() {
        vc?.performSegue(withIdentifier: KSegues.LoginToMain, sender: vc)
    }
    
    func onSignInWithFacebook() {
        vc?.performSegue(withIdentifier: KSegues.LoginToMain, sender: vc)
    }
    
}
