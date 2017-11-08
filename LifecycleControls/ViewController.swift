//
//  ViewController.swift
//  LifecycleControls
//
//  Created by C4Q  on 11/7/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var songList = Song.loveSongs
//    var formatText = Settings.formatText
    @IBOutlet weak var tableViewSongList: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewSongList.delegate = self
        self.tableViewSongList.dataSource = self
        Settings.numberOfRows = songList.count
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableViewSongList.reloadData()
    }
    
    //MARK - Table View Data Source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Settings.numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let colorRed = Settings.colorRed
        let colorGreen = Settings.colorGreen
        let colorBlue = Settings.colorBlue
        let song = songList[indexPath.row]
        var nameSong = song.name
        var nameArtist = song.artist
        let cell = tableViewSongList.dequeueReusableCell(withIdentifier: "Cell SongList", for: indexPath)
        switch Settings.formatText {
        case .lower:
            nameSong = song.name.lowercased()
            nameArtist = song.artist.lowercased()
        case .upper:
            nameSong = song.name.uppercased()
            nameArtist = song.artist.uppercased()
        case .proper:
            nameSong = song.name
            nameArtist = song.artist
        }
        cell.textLabel?.text = nameSong
        cell.detailTextLabel?.text = nameArtist
        if Settings.evenRow {
            if indexPath.row % 2 == 0 {
                cell.backgroundColor = UIColor(displayP3Red: CGFloat(colorRed), green: CGFloat(colorGreen), blue: CGFloat(colorBlue), alpha: 1)
            }
        } else {
            cell.backgroundColor = UIColor(displayP3Red: CGFloat(colorRed), green: CGFloat(colorGreen), blue: CGFloat(colorBlue), alpha: 1)
        }
        
        return cell
    }
}

