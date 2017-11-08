//
//  SettingViewController.swift
//  LifecycleControls
//
//  Created by C4Q on 11/7/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    
    var numberOfRows = 10 {
        didSet {
            labelNumberOfRows.text = String(Int(stepperNumberOfRows.value))
            Settings.numberOfRows = Int(stepperNumberOfRows.value)
            numberOfRows = Settings.numberOfRows
        }
    }
    var labelRed = "" {
        didSet {
            backgroundColor.backgroundColor = UIColor(displayP3Red: CGFloat(Settings.colorRed), green: CGFloat(Settings.colorGreen), blue: CGFloat(Settings.colorBlue), alpha: 1)
        }
    }
    var labelGreen = "" {
        didSet {
            backgroundColor.backgroundColor = UIColor(displayP3Red: CGFloat(Settings.colorRed), green: CGFloat(Settings.colorGreen), blue: CGFloat(Settings.colorBlue), alpha: 1)
        }
    }
    var labelBlue = "" {
        didSet {
            backgroundColor.backgroundColor = UIColor(displayP3Red: CGFloat(Settings.colorRed), green: CGFloat(Settings.colorGreen), blue: CGFloat(Settings.colorBlue), alpha: 1)
        }
    }
    
    @IBOutlet weak var stepperNumberOfRows: UIStepper!
    @IBOutlet weak var labelNumberOfRows: UILabel!
    @IBOutlet weak var textFormat: UISegmentedControl!
    @IBOutlet weak var backgroundColor: UIView!
    @IBOutlet weak var colorRed: UILabel!
    @IBOutlet weak var colorGreen: UILabel!
    @IBOutlet weak var colorBlue: UILabel!
    @IBOutlet weak var sliderRed: UISlider!
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    @IBOutlet weak var alterningCell: UISwitch!
    
    
    @IBAction func numberOfRows(_ sender: UIStepper) {
        numberOfRows += 1
    }
    
    
    @IBAction func alterningCell(_ sender: UISwitch) {
        if sender.isOn {
            Settings.evenRow = true
        } else {
            Settings.evenRow = false
        }
    }
    
    @IBAction func textFormat(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            Settings.formatText = .lower
        case 1:
            Settings.formatText = .upper
        case 2:
            Settings.formatText = .proper
        default:
            break
        }
    }
    
    @IBAction func sliderColor(_ sender: UISlider) {
        switch sender.tag {
        case 1:
            Settings.colorRed = Double(sender.value)
            labelRed = "Red: \(Settings.colorRed)"
        case 2:
            Settings.colorGreen = Double(sender.value)
            labelGreen = "Green: \(Settings.colorGreen)"
        case 3:
            Settings.colorBlue = Double(sender.value)
            labelBlue = "Blue: \(Settings.colorBlue)"
        default:
            break
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initStepper()
    }
    
    func initStepper() {
        stepperNumberOfRows.value = Double(Settings.numberOfRows)
        stepperNumberOfRows.minimumValue = 1
        stepperNumberOfRows.maximumValue = Double(Song.loveSongs.count)
        labelNumberOfRows.text = String(Int(stepperNumberOfRows.value))
        textFormat.selectedSegmentIndex = indexSegmentedControl()
        backgroundColor.backgroundColor = UIColor(displayP3Red: CGFloat(Settings.colorRed), green: CGFloat(Settings.colorGreen), blue: CGFloat(Settings.colorBlue), alpha: 1)
        colorRed.text = labelRed
        colorGreen.text = labelGreen
        colorBlue.text = labelBlue
        sliderRed.value = Float(Settings.colorRed)
        sliderGreen.value = Float(Settings.colorGreen)
        sliderBlue.value = Float(Settings.colorBlue)
        alterningCell.isOn = Settings.evenRow
    }
    
    func indexSegmentedControl () -> Int {
        switch Settings.formatText {
        case .lower:
            return 0
        case .upper:
            return 1
        case .proper:
            return 2
        }
    }
    
}
