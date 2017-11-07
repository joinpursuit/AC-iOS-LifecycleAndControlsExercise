////
////  Settings.swift
////  SongsTableViewSearchBar
////
////  Created by Masai Young on 11/7/17.
////  Copyright © 2017 C4Q . All rights reserved.



import Foundation
import UIKit

class Settings {

    static var alternatingCells: Bool = false
    static var numberOfRows: Int = Song.loveSongs.count
    static var caseOfLetters: letterCase = .proper
    static var selectedColor: UIColor{ return UIColor(displayP3Red: Settings.red, green: Settings.green, blue: Settings.blue, alpha: 1) }
    static var selectedColorInversed: UIColor{ return UIColor(displayP3Red: 1 - Settings.red, green: 1 - Settings.green, blue: 1 - Settings.blue, alpha: 1) }

    static var red: CGFloat = 0.8
    static var blue: CGFloat = 0.6
    static var green: CGFloat = 0.7

    enum letterCase: Int {
        case lower, upper, proper
    }

}

