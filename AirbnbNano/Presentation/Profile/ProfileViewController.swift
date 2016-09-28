//
//  ProfileViewController.swift
//  AirbnbNano
//
//  Created by Sergio Daniel Leztark on 9/28/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import UIKit


protocol ProfileViewControllerProtocol : ViewProtocol {
    
    var profilePic: String { set get }
    
    var name: String { set get }
    
}


class ProfileViewController : UIViewController, ProfileViewControllerProtocol {
    
    @IBOutlet weak var profilePicImageView: UIImageView!
    @IBOutlet weak var completeNameLabel: UILabel!
    @IBOutlet weak var profilePicDownloadActivityIndicator: UIActivityIndicatorView!
    
    var presenter: ProfilePresenter = ProfilePresenter(
        withSessionRepository: SessionRepository(withDataStore: FacebookSessionDataStore()))
    
    var profilePic: String = "" {
        didSet {
            profilePicDownloadActivityIndicator.startAnimating()
            let request: URLRequest = URLRequest(url: URL(string: profilePic)!)
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    log.error(error)
                } else if let data = data {
                    self.profilePicImageView.image = UIImage(data: data)
                    self.profilePicDownloadActivityIndicator.stopAnimating()
                } else {
                    log.severe("Neither error nor data in HTTP response!!!")
                }
            }
            
            task.resume()
        }
    }
    
    var name: String = "Loading..." {
        didSet {
            completeNameLabel.text = name
        }
    }
    
    
    override func viewDidLoad() {
        presenter.attachView(view: self)
        presenter.onLoad()
    }
    
}
