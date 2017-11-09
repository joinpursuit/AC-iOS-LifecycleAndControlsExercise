//
//  Settings.swift
//  LifecycleControls
//
//  Created by C4Q on 11/7/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation


enum Case {
    case lowercase, uppercase, capitalized
}

class Settings {
    static var numberOfRows: Int = Song.loveSongs.count
    
   static var textCase: Case = .capitalized
    static var backgroundColor: (red: Float, green: Float, blue: Float) = (red: 1, green: 1, blue: 1)
   static var ifAlternated: Bool = false
    
 
}
