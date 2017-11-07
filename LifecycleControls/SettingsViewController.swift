//
//  SettingsViewController.swift
//  LifecycleControls
//
//  Created by C4Q on 11/7/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var colorAlternatorSwitch: UISwitch!
    @IBOutlet weak var numberOfRowsLabel: UILabel!
    @IBOutlet weak var colorForCells: UIView!
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var rowstepper: UIStepper!
    
    func setColor() {
        guard colorForCells != nil && colorForCells.backgroundColor != nil else {
            return
        }
        colorForCells.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        print("view is appearing")
        redSlider.value = Float(Settings.redVal)
        blueSlider.value = Float(Settings.blueVal)
        greenSlider.value = Float(Settings.greenVal)
        setColor()
        
        rowstepper.value = Double(Settings.rowCount)
        numberOfRowsLabel.text = String(Settings.rowCount)
        
        colorAlternatorSwitch.isOn = Settings.alternatingColors
        
        segmentedControl.selectedSegmentIndex = Settings.textShouldBe.rawValue        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func alternatingCellsSwitched(_ sender: UISwitch) {
        Settings.alternatingColors = sender.isOn
    }
    
    @IBAction func sliderSlid(_ sender: Any) {
        setColor()
        Settings.redVal = Double(redSlider.value)
        Settings.blueVal = Double(blueSlider.value)
        Settings.greenVal = Double(greenSlider.value)
        Settings.backgroundColor = colorForCells.backgroundColor!
    }
    @IBAction func stepperStepped(_ sender: UIStepper) {
        numberOfRowsLabel.text = String(Int(sender.value))
        Settings.rowCount = Int(sender.value)
    }
    
    @IBAction func segmentSegmented(_ sender: UISegmentedControl) {
        Settings.textShouldBe = textFormat(rawValue: sender.selectedSegmentIndex)!

    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
