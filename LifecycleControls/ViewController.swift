//
//  ViewController.swift
//  LifecycleControls
//
//  Created by C4Q  on 11/7/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    
    var searchTerm: String? {
        didSet {
           self.tableView.reloadData()
        }
    }
    var songs = [Song]()
    var numberOfRows: Int = Settings.numberOfRows
    var textCase: Case = Settings.textCase
    var ifAlternated = Settings.ifAlternated
    var backGroundColor = Settings.backgroundColor
 
    var filteredSongs: [Song] {
        var arr = [Song]()
        for i in 0..<numberOfRows {
    arr.append(songs[i])
        }
        return arr
    }
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.songs = Song.loveSongs
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.searchBar.delegate = self
    }
     override func viewWillAppear(_ animated: Bool) {
        self.backGroundColor = Settings.backgroundColor
        self.textCase = Settings.textCase
        self.ifAlternated = Settings.ifAlternated
        self.numberOfRows = Settings.numberOfRows
        self.tableView.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Song Cell", for: indexPath)
        
        if self.ifAlternated == false {
        cell.backgroundColor = UIColor(displayP3Red: CGFloat(backGroundColor.red), green: CGFloat(backGroundColor.green), blue: CGFloat(backGroundColor.blue), alpha: 1)
        } else {
        if indexPath.row % 2 == 0 {
          cell.backgroundColor = UIColor(displayP3Red: CGFloat(backGroundColor.red), green: CGFloat(backGroundColor.green), blue: CGFloat(backGroundColor.blue), alpha: 1)
        } else {
            cell.backgroundColor = UIColor(displayP3Red: CGFloat(1 - backGroundColor.red) , green: CGFloat(1 - backGroundColor.green), blue: CGFloat(1 - backGroundColor.blue), alpha: 1)
        }
        }
        switch self.textCase {
        case .lowercase:
            cell.textLabel?.text = filteredSongs[indexPath.row].name.lowercased()
            cell.detailTextLabel?.text = filteredSongs[indexPath.row].artist.lowercased()
        case .uppercase:
            cell.textLabel?.text = filteredSongs[indexPath.row].name.uppercased()
            cell.detailTextLabel?.text = filteredSongs[indexPath.row].artist.uppercased()
        case .capitalized:
        cell.textLabel?.text = filteredSongs[indexPath.row].name.capitalized
        cell.detailTextLabel?.text = filteredSongs[indexPath.row].artist.capitalized
    }
        return cell
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchTerm = searchBar.text
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchTerm = searchBar.text
        searchBar.resignFirstResponder()
    }
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SettingViewController {
            self.tableView?.backgroundColor = destination.colorView?.backgroundColor
            
        }
    }
}

