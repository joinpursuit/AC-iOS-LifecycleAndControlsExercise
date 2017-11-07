//
//  SettingsViewController.swift
//  SongsTableViewSearchBar
//
//  Created by Masai Young on 11/7/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var rowNumberLabel: UILabel!
    @IBOutlet weak var selectedColorLabel: UIView!
    @IBOutlet weak var segmentedController: UISegmentedControl!
    @IBOutlet weak var alternatingColorSwitch: UISwitch!
    
    @IBOutlet weak var rowStepper: UIStepper!
    @IBAction func switchToggled(_ sender: Any) {
        Settings.alternatingCells = !Settings.alternatingCells
    }
    
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var redSlider: UISlider!
    
    @IBAction func segmentedControlChanged(_ sender: UISegmentedControl) {
        Settings.caseOfLetters = Settings.letterCase(rawValue: sender.selectedSegmentIndex)!
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        Settings.numberOfRows = Int(sender.value)
        rowNumberLabel.text = String(Settings.numberOfRows)
    }
    
    @IBAction func redSliderChanged(_ sender: UISlider) {
        Settings.red = CGFloat(sender.value)
        selectedColorLabel.backgroundColor = Settings.selectedColor
        self.view.backgroundColor = Settings.selectedColorInversed
    }
    
    @IBAction func blueSliderChanged(_ sender: UISlider) {
        Settings.blue = CGFloat(sender.value)
        selectedColorLabel.backgroundColor = Settings.selectedColor
        self.view.backgroundColor = Settings.selectedColorInversed
    }
    
    @IBAction func greenSliderChanged(_ sender: UISlider) {
        Settings.green = CGFloat(sender.value)
        selectedColorLabel.backgroundColor = Settings.selectedColor
        self.view.backgroundColor = Settings.selectedColorInversed
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rowNumberLabel.text = String(Settings.numberOfRows)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        segmentedController.selectedSegmentIndex = Settings.caseOfLetters.rawValue
        alternatingColorSwitch.setOn(Settings.alternatingCells, animated: true)
        rowStepper.maximumValue = Double(Settings.numberOfRows)
        rowStepper.value = Double(Settings.numberOfRows)
        redSlider.setValue(Float(Settings.red), animated: true)
        blueSlider.setValue(Float(Settings.blue), animated: true)
        greenSlider.setValue(Float(Settings.green), animated: true)
        selectedColorLabel.backgroundColor = Settings.selectedColor
        self.view.backgroundColor = Settings.selectedColorInversed
        print("rowStepperValue: \(rowStepper.value) numberOfRow value: \(Settings.numberOfRows)")
        
    }
}

//class Settings {
//
//    static var alternatingCells: Bool = false
//    static var numberOfRows: Int = Song.loveSongs.count
//    static var caseOfLetters: letterCase = .proper
//    static var selectedColor: UIColor{ return UIColor(displayP3Red: Settings.red, green: Settings.green, blue: Settings.blue, alpha: 1) }
//    static var selectedColorInversed: UIColor{ return UIColor(displayP3Red: 1 - Settings.red, green: 1 - Settings.green, blue: 1 - Settings.blue, alpha: 1) }
//
//    static var red: CGFloat = 0.2
//    static var blue: CGFloat = 0.7
//    static var green: CGFloat = 0.5
//
//    enum letterCase: Int {
//        case lower, upper, proper
//    }
//
//    struct settingColor {
//        let red: Int
//        let blue: Int
//        let green: Int
//    }
//
//}

