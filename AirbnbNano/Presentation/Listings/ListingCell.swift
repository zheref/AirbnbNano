//
//  ListingCell.swift
//  AirbnbNano
//
//  Created by Sergio Daniel Leztark on 9/28/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import UIKit


class ListingCell : UITableViewCell {
    
    @IBOutlet weak var pictureImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var estateKind: UILabel!
    @IBOutlet weak var pictureLoadingActivityIndicator: UIActivityIndicatorView!
    
    
    func apply(model: ListingEntity) {
        nameLabel.text = model.name == nil ? "No title" : model.name!
        estateKind.text = model.estateKind == nil ? "Not specified" : model.estateKind!
        
        pictureImageView.image = nil
        
        if let pictureUrl = model.pictureUrl {
            pictureLoadingActivityIndicator.startAnimating()
            let request: URLRequest = URLRequest(url: URL(string: pictureUrl)!)
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    log.error(error)
                } else if let data = data {
                    self.pictureImageView.image = UIImage(data: data)
                    self.pictureLoadingActivityIndicator.stopAnimating()
                } else {
                    log.severe("Neither error nor data in HTTP response!!!")
                }
            }
            
            task.resume()
        }
    }
    
    
    
    
}
