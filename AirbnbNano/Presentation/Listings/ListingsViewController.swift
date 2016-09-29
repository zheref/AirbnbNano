//
//  ListingsViewController.swift
//  AirbnbNano
//
//  Created by Sergio Daniel Leztark on 9/27/16.
//  Copyright © 2016 zheref. All rights reserved.
//

import UIKit


protocol ListingsViewControllerProtocol : ViewProtocol {
    func reload()
}


class ListingsViewController : UITableViewController, ListingsViewControllerProtocol {
    
    var presenter: ListingsPresenter = ListingsPresenter(
        withRepository: ListingsRepository(withDataStore: NetworkListingsDataStore()))
    
    var lastChosenListing: ListingEntity?
    
    
    override func viewDidLoad() {
        presenter.attachView(view: self)
        presenter.onLoad()
    }
    
    
    func reload() {
        tableView.reloadData()
    }
    
}


extension ListingsViewController {
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.listings.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: KReuseIdentifiers.ListingCell,
                                                 for: indexPath) as! ListingCell
        cell.apply(model: presenter.listings[indexPath.row])
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        lastChosenListing = presenter.listings[indexPath.row]
        performSegue(withIdentifier: KSegues.ListToDetail, sender: self)
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
}
