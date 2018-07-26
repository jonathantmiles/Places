//
//  PlacesTableViewController.swift
//  Places
//
//  Created by Jonathan T. Miles on 7/26/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

protocol PlacesTableViewControllerDelegate: class {
    func placeWasSelected(place: Place)
}

class PlacesTableViewController: UITableViewController, PlacesPresenter {
    
    // Refresh data when we appear or re-appear on screen
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        tableView.reloadData()
    }
    
    // MARK: - UITableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let place = placeController?.places[indexPath.row] else { return }
        
        delegate?.placeWasSelected(place: place)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placeController?.places.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaceCell", for: indexPath)

        let place = placeController?.places[indexPath.row]
        cell.textLabel?.text = place?.name

        return cell
    }
 

    // MARK: - Properties
    
    var placeController: PlaceController? {
        didSet {
            tableView.reloadData()
        }
    }
    
    weak var delegate: PlacesTableViewControllerDelegate?
}
