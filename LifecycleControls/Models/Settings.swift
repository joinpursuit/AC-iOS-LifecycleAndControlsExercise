//
//  Settings.swift
//  LifecycleControls
//
//  Created by C4Q on 11/7/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation
import UIKit

class Settings {
    enum Casing {
        case lower
        case upper
        case proper
    }
    
    static var shouldAlternate: Bool = false
    static var numberOfRows: Int = 10
    static var segmentIndex: Int = 2 {
        didSet {
            switch segmentIndex {
            case 0:
                casing = .lower
            case 1:
                casing = .upper
            default:
                casing = .proper
            }
        }
    }
    static var casing: Casing = .proper
    static var color: (red: CGFloat, green: CGFloat, blue: CGFloat) = (red: 1, green: 1, blue: 1)
}
