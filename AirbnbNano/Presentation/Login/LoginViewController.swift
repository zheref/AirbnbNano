//
//  LoginViewController.swift
//  AirbnbNano
//
//  Created by Sergio Daniel Leztark on 9/24/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import UIKit


protocol LoginViewControllerProtocol {
    func performSegue(withIdentifier identifier: String, sender: Any?)
}


class LoginViewController : UIViewController, LoginViewControllerProtocol {
    
    var presenter: LoginPresenterProtocol!
    
    
    override func viewDidLoad() {
        //presenter.onLoginDidLoad()
        super.viewDidLoad()
    }
    
    
    @IBAction func onSignInWithFacebookTouchUpInside(_ sender: UIButton) {
        
    }
    
}
