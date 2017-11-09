//
//  SettingViewController.swift
//  LifecycleControls
//
//  Created by C4Q on 11/7/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var switchControl: UISwitch!
    @IBOutlet weak var switchLabel: UILabel!
    
    @IBOutlet weak var numberRowLabel: UILabel!
    @IBOutlet weak var stepperValueLabel: UILabel!
    @IBOutlet weak var stepperControl: UIStepper!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redColorSlider: UISlider!
    @IBOutlet weak var redColorLabel: UILabel!
    @IBOutlet weak var greenColorSlider: UISlider!
     @IBOutlet weak var greenColorLabel: UILabel!
    @IBOutlet weak var blueColorSlider: UISlider!
    @IBOutlet weak var blueColorLabel: UILabel!
   
   
    var numberOfRows: Int = Settings.numberOfRows
    var textCase: Case = Settings.textCase
    var backGroundColor = Settings.backgroundColor
    var ifAlternated: Bool = Settings.ifAlternated
    override func viewDidLoad() {
       
        super.viewDidLoad()
       self.numberOfRows = Int(self.stepperControl.value)
         self.colorView.backgroundColor = UIColor(displayP3Red: CGFloat(backGroundColor.red), green: CGFloat(backGroundColor.green), blue: CGFloat(backGroundColor.blue), alpha: 1)
        // Do any additional setup after loading the view.
    }
 
    @IBAction func switchToggled(_ sender: UISwitch) {
        self.ifAlternated = sender.isOn
        Settings.ifAlternated = self.ifAlternated
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
    self.numberOfRows = Int(sender.value)
    self.stepperValueLabel.text = "\(self.numberOfRows)"
    Settings.numberOfRows = self.numberOfRows
    }
    
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.textCase = .lowercase
        case 1:
            self.textCase = .uppercase
        default:
            self.textCase = .capitalized
        }
        Settings.textCase = self.textCase
    }
    
    @IBAction func redSliderValueChanged(_ sender: UISlider) {
        self.backGroundColor.red = sender.value
        self.redColorLabel.text = "Red: \(sender.value)"
        updateBackgroundColor()
       updateSettingsBackgroundColor()
    }
    
    @IBAction func greenSliderValueChanged(_ sender: UISlider) {
       self.backGroundColor.green = sender.value
        self.greenColorLabel.text = "Greeen: \(sender.value)"
        updateBackgroundColor()
        updateSettingsBackgroundColor()
    }
    
    @IBAction func blueSliderValueChanged(_ sender: UISlider) {
      self.backGroundColor.blue = sender.value
        self.blueColorLabel.text = "BLue: \(sender.value)"
        updateBackgroundColor()
       updateSettingsBackgroundColor()
    }
    func updateBackgroundColor() {
        
        self.colorView.backgroundColor = UIColor(displayP3Red: CGFloat(backGroundColor.red), green: CGFloat(backGroundColor.green), blue: CGFloat(backGroundColor.blue), alpha: 1)
    }
    func updateSettingsBackgroundColor() {
          Settings.backgroundColor = self.backGroundColor
    }
}
