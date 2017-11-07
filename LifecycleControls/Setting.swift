//
//  Setting.swift
//  LifecycleControls
//
//  Created by C4Q  on 11/7/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation
import UIKit

enum CapitalizationOption: Int {
    case lower
    case upper
    case proper
}

class Settings {
    static var shouldIncludeDetail = true
    static var maxNumberOfRows = 50
    static var capitalization = CapitalizationOption.lower
    static var cellColor: (red: CGFloat, green: CGFloat, blue: CGFloat) = (1,1,1)
}
