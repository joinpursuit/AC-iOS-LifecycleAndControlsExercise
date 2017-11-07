//
//  SettingsViewController.swift
//  LifecycleControls
//
//  Created by C4Q  on 11/7/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var settingSwitch: UISwitch!
    @IBOutlet weak var settingStepper: UIStepper!
    @IBOutlet weak var settingSegment: UISegmentedControl!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupViews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        self.settingStepper.value = Double(Settings.maxNumberOfRows)
        self.stepperLabel.text = String(Int(Settings.maxNumberOfRows))
        
        self.redSlider.value = Float(Settings.cellColor.red)
        redLabel.text = "Red: " + Settings.cellColor.red.description
        
        self.greenSlider.value = Float(Settings.cellColor.green)
        greenLabel.text = "Green: " + Settings.cellColor.green.description
        
        self.blueSlider.value = Float(Settings.cellColor.blue)
        blueLabel.text = "Green: " + Settings.cellColor.blue.description
        
        self.settingSwitch.isOn = Settings.alternatingCells
        self.settingSegment.selectedSegmentIndex = Settings.capitalization.rawValue
        self.colorView.backgroundColor = UIColor(displayP3Red: Settings.cellColor.red, green: Settings.cellColor.green, blue: Settings.cellColor.blue, alpha: 1.0)
    }
    
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        Settings.alternatingCells = !Settings.alternatingCells
    }
    
    @IBAction func stepperPressed(_ sender: UIStepper) {
        Settings.maxNumberOfRows = Int(sender.value)
        stepperLabel.text = String(Int(sender.value))
    }
    
    @IBAction func segmentedControlSwitched(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            Settings.capitalization = .lower
        case 1:
            Settings.capitalization = .upper
        case 2:
            Settings.capitalization = .proper
        default:
            break
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            Settings.cellColor.red = CGFloat(sender.value)
            redLabel.text = "Red: " + String(sender.value)
        case 1:
            Settings.cellColor.green = CGFloat(sender.value)
            greenLabel.text = "Green: " + String(sender.value)
        case 2:
            Settings.cellColor.blue = CGFloat(sender.value)
            blueLabel.text = "Blue: " + String(sender.value)
        default:
            break
        }
        self.colorView.backgroundColor = UIColor(displayP3Red: Settings.cellColor.red, green: Settings.cellColor.green, blue: Settings.cellColor.blue, alpha: 1.0)
    }
    
}
