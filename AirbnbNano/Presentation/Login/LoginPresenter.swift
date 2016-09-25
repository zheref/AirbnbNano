//
//  LoginPresenter.swift
//  AirbnbNano
//
//  Created by Sergio Daniel Leztark on 9/24/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import Foundation


protocol LoginPresenterProtocol {
    
    func onLoginDidLoad()
    
}


class LoginPresenter : LoginPresenterProtocol {
    
    var vc: LoginViewControllerProtocol!
    
    init(forView view: LoginViewControllerProtocol) {
        vc = view
    }
    
    func onLoginDidLoad() {
        vc.performSegue(withIdentifier: KSegues.LoginToMain, sender: self)
    }
    
}
