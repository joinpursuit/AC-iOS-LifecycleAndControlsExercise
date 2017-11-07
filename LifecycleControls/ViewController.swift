//
//  ViewController.swift
//  LifecycleControls
//
//  Created by C4Q  on 11/7/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate  {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let songArr = Song.loveSongs
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.searchBar.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        tableView.reloadData()
        print(Settings.backgroundColor)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Settings.rowCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Song Cell", for: indexPath)
        let song = songArr[indexPath.row]
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.artist
        
        switch Settings.textShouldBe {
        case .lowercase:
            cell.textLabel?.text = cell.textLabel?.text?.lowercased()
            cell.detailTextLabel?.text = cell.detailTextLabel?.text?.lowercased()
        case .uppercase:
            cell.textLabel?.text = cell.textLabel?.text?.uppercased()
            cell.detailTextLabel?.text = cell.detailTextLabel?.text?.uppercased()
        case .capitalized:
            cell.textLabel?.text = cell.textLabel?.text?.capitalized
            cell.detailTextLabel?.text = cell.detailTextLabel?.text?.capitalized
        }
        
        
        
        print(Settings.backgroundColor)
        cell.backgroundColor = Settings.backgroundColor
        if Settings.alternatingColors && indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor(red: CGFloat(1.0 - Settings.redVal),  green: CGFloat(1.0 - Settings.greenVal), blue: CGFloat(1.0 - Settings.blueVal), alpha: 1)
        }
        
        return cell
    }
}

