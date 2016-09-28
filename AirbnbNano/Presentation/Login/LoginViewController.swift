//
//  LoginViewController.swift
//  AirbnbNano
//
//  Created by Sergio Daniel Leztark on 9/24/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import UIKit


protocol LoginViewControllerProtocol : ViewProtocol {
    func performSegue(withIdentifier identifier: String, sender: Any?)
}


class LoginViewController : UIViewController, LoginViewControllerProtocol {
    
    var presenter: LoginPresenter = LoginPresenter(
        withSessionRepository: SessionRepository(withDataStore: FacebookSessionDataStore()))
    
    override func viewDidLoad() {
        presenter.attachView(view: self)
        
        presenter.onLoad()
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.beforeAppear()
    }
    
    
    @IBAction func onSignInWithFacebookTouchUpInside(_ sender: UIButton) {
        presenter.onSignInWithFacebook()
    }
    
}
