//
//  Settings.swift
//  LifecycleControls
//
//  Created by C4Q on 11/7/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation
import UIKit

enum Format {
    case lower
    case upper
    case proper
}

class Settings {
    static var evenRow = false
    static var colorRed = 0.0
    static var colorGreen = 1.0
    static var colorBlue = 0.0
    static var numberOfRows = 0
    static var formatText: Format = .proper
}
