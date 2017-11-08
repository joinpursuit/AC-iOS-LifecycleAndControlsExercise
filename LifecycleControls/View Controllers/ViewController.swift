//
//  ViewController.swift
//  LifecycleControls
//
//  Created by C4Q  on 11/7/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    //Table View Variables
    @IBOutlet weak var songsTableView: UITableView!
    
    var songs: [Song] = []
    
    //Search Bar Variables
    @IBOutlet weak var songsSearchBar: UISearchBar!
    
    var searchTerm: String? {
        didSet {
            songsTableView.reloadData()
        }
    }
    
    var filteredSongs: [Song] {
        guard let searchTerm = searchTerm, searchTerm != "", let scopeButtonTitles = songsSearchBar.scopeButtonTitles else {
            return songs
        }
        
        let currentScopeIndex = songsSearchBar.selectedScopeButtonIndex
        let currentScopeName = scopeButtonTitles[currentScopeIndex]
        
        switch currentScopeName {
        case "Title":
            let filteredNames = songs.filter{$0.name.lowercased().contains(searchTerm.lowercased())}
            return filteredNames
        case "Artist":
            let filteredArtists = songs.filter{$0.artist.lowercased().contains(searchTerm.lowercased())}
            return filteredArtists
        default:
            return songs
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        songs = Song.loveSongs
        songsTableView.delegate = self
        songsTableView.dataSource = self
        songsSearchBar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        songsTableView.reloadData()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.resignFirstResponder()
    }
    
    //MARK: - Table View Delegate Methods
    
    
    //MARK: - Table View Data Source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return min(filteredSongs.count, Settings.numberOfRows)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath)
        let rowIsEven = indexPath.row % 2 == 0
        let currentSong = filteredSongs[indexPath.row]
        
        switch Settings.casing {
        case .lower:
            cell.textLabel?.text = currentSong.name.lowercased()
            cell.detailTextLabel?.text = currentSong.artist.lowercased()
        case .upper:
            cell.textLabel?.text = currentSong.name.uppercased()
            cell.detailTextLabel?.text = currentSong.artist.uppercased()
        case .proper:
            cell.textLabel?.text = currentSong.name
            cell.detailTextLabel?.text = currentSong.artist
        }
        
        switch Settings.shouldAlternate {
        case true:
            if rowIsEven {
                cell.backgroundColor = UIColor(displayP3Red: Settings.color.red, green: Settings.color.green, blue: Settings.color.blue, alpha: 1)
            } else {
                let inversedRedColor: CGFloat = 1 - Settings.color.red
                let inversedGreenColor: CGFloat = 1 - Settings.color.green
                let inversedBlueColor: CGFloat = 1 - Settings.color.blue
                cell.backgroundColor = UIColor(displayP3Red: inversedRedColor, green: inversedGreenColor, blue: inversedBlueColor, alpha: 1)
            }
        case false:
            cell.backgroundColor = UIColor(displayP3Red: Settings.color.red, green: Settings.color.green, blue: Settings.color.blue, alpha: 1)
        }
        
        return cell
    }
    
    //MARK: - Search Bar Delegate Methods
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchTerm = searchText
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        songsTableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        songsSearchBar.showsScopeBar = true
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        songsSearchBar.showsScopeBar = false
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        songsSearchBar.resignFirstResponder()
    }
    
    //MARK: - Navigation
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "settingsSegue", sender: sender)
    }
}

