//
//  Settings.swift
//  LifecycleControls
//
//  Created by C4Q on 11/7/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation
import UIKit

enum textFormat: Int {
    case lowercase, uppercase, capitalized
}


struct Settings {
    static var alternatingColors: Bool = false
    static var rowCount: Int = 10
    static var textShouldBe: textFormat = .lowercase
    static var redVal: Double = 1.0
    static var blueVal: Double = 1.0
    static var greenVal: Double = 1.0

    static var backgroundColor: UIColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
}
