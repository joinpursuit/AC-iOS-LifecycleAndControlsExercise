//
//  SettingsTableViewController.swift
//  LifecycleControls
//
//  Created by C4Q on 11/7/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.allowsSelection = false
        numberOfRowsStepper.value = Double(Settings.numberOfRows)
        numberOfRowsLabel.text = Settings.numberOfRows.description
        numberOfRowsStepper.minimumValue = 0.0
        numberOfRowsStepper.maximumValue = 20.0
        numberOfRowsStepper.stepValue = 1.0
        casingSegmentedControl.selectedSegmentIndex = Settings.segmentIndex
        casingSegmentedControl.setEnabled(true, forSegmentAt: Settings.segmentIndex)
        redValueLabel.text = "Red: \(currentRedValue)"
        greenValueLabel.text = "Green: \(currentGreenValue)"
        blueValueLabel.text = "Blue: \(currentBlueValue)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        alternatingCellsSwitch.onTintColor = UIColor(displayP3Red: currentRedValue, green: currentGreenValue, blue: currentBlueValue, alpha: 1)
        alternatingCellsSwitch.isOn = alternatingCellsSwitchIsOn
        redSlider.value = Float(currentRedValue)
        greenSlider.value = Float(currentGreenValue)
        blueSlider.value = Float(currentBlueValue)
        tableView.backgroundColor = UIColor(displayP3Red: currentRedValue, green: currentGreenValue, blue: currentBlueValue, alpha: 1)
    }
    
    //Alternating Cells
    @IBOutlet weak var alternatingCellsSwitch: UISwitch!
    
    var alternatingCellsSwitchIsOn: Bool = Settings.shouldAlternate {
        didSet {
            Settings.shouldAlternate = alternatingCellsSwitchIsOn
        }
    }
    
    @IBAction func alternatingCellsSwitchToggled(_ sender: UISwitch) {
        alternatingCellsSwitchIsOn = sender.isOn
    }
    
    //Number Of Rows
    @IBOutlet weak var numberOfRowsLabel: UILabel!
    @IBOutlet weak var numberOfRowsStepper: UIStepper!
    
    var currentNumberOfRows: Int = Settings.numberOfRows {
        didSet {
            numberOfRowsLabel.text = currentNumberOfRows.description
            Settings.numberOfRows = currentNumberOfRows
        }
    }
    
    @IBAction func numberOfRowsStepperValueChanged(_ sender: UIStepper) {
        currentNumberOfRows = Int(sender.value)
    }
    
    //Casing
    @IBOutlet weak var casingSegmentedControl: UISegmentedControl!
    
    var currentSegmentIndex: Int = Settings.segmentIndex {
        didSet {
            Settings.segmentIndex = currentSegmentIndex
        }
    }
    
    @IBAction func casingSegmentedControlValueChanged(_ sender: UISegmentedControl) {
        currentSegmentIndex = sender.selectedSegmentIndex
    }
    
    //Cell Color
    //red
    @IBOutlet weak var redValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    
    var currentRedValue: CGFloat = Settings.color.red {
        didSet {
            Settings.color.red = currentRedValue
            redValueLabel.text = "Red: \(currentRedValue)"
        }
    }
    
    @IBAction func redSliderValueChanged(_ sender: UISlider) {
        currentRedValue = CGFloat(sender.value)
        tableView.backgroundColor = UIColor(displayP3Red: CGFloat(sender.value), green: Settings.color.green, blue: Settings.color.blue, alpha: 1)
        alternatingCellsSwitch.onTintColor = UIColor(displayP3Red: CGFloat(sender.value), green: currentGreenValue, blue: currentBlueValue, alpha: 1)
        tableView.reloadData()
    }

    //green
    @IBOutlet weak var greenValueLabel: UILabel!
    
    @IBOutlet weak var greenSlider: UISlider!
    
    var currentGreenValue: CGFloat = Settings.color.green {
        didSet {
            Settings.color.green = currentGreenValue
            greenValueLabel.text = "Green: \(currentGreenValue)"
        }
    }
    
    @IBAction func greenSliderValueChanged(_ sender: UISlider) {
        currentGreenValue = CGFloat(sender.value)
        tableView.backgroundColor = UIColor(displayP3Red: Settings.color.red, green: CGFloat(sender.value), blue: Settings.color.blue, alpha: 1)
        alternatingCellsSwitch.onTintColor = UIColor(displayP3Red: currentRedValue, green: CGFloat(sender.value), blue: currentBlueValue, alpha: 1)
        tableView.reloadData()
    }
    
    //blue
    @IBOutlet weak var blueValueLabel: UILabel!

    @IBOutlet weak var blueSlider: UISlider!
    
    var currentBlueValue: CGFloat = Settings.color.blue {
        didSet {
            Settings.color.blue = currentBlueValue
            blueValueLabel.text = "Blue: \(currentBlueValue)"
        }
    }
    
    @IBAction func blueSliderValueChanged(_ sender: UISlider) {
        currentBlueValue = CGFloat(sender.value)
        tableView.backgroundColor = UIColor(displayP3Red: Settings.color.red, green: Settings.color.green, blue: CGFloat(sender.value), alpha: 1)
        alternatingCellsSwitch.onTintColor = UIColor(displayP3Red: currentRedValue, green: currentGreenValue, blue: CGFloat(sender.value), alpha: 1)
        tableView.reloadData()
    }
    
    
}
