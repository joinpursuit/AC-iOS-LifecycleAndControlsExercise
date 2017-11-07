//
//  ViewController.swift
//  LifecycleControls
//
//  Created by C4Q  on 11/7/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var songs = Song.loveSongs
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return min(songs.count, Settings.maxNumberOfRows)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let song = songs[indexPath.row]
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "Song Cell", for: indexPath)
        switch Settings.capitalization {
        case .lower:
            cell.textLabel?.text = song.name.lowercased()
            cell.detailTextLabel?.text = song.artist.lowercased()
        case .upper:
            cell.textLabel?.text = song.name.uppercased()
            cell.detailTextLabel?.text = song.artist.uppercased()
        case .proper:
            //TO DO
            cell.textLabel?.text = song.name.capitalized
            cell.detailTextLabel?.text = song.artist.capitalized
        }
        cell.backgroundColor = UIColor(displayP3Red: Settings.cellColor.red, green: Settings.cellColor.green, blue: Settings.cellColor.blue, alpha: 1.0)
        if Settings.alternatingCells && indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor(displayP3Red: 1 - Settings.cellColor.red, green: 1 - Settings.cellColor.green, blue: 1 - Settings.cellColor.blue, alpha: 1.0)
        }
        return cell
    }
    
}

