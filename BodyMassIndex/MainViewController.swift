//
//  ViewController.swift
//  BodyMassIndex
//
//  Created by Dmytro Morozov on 21.11.15.
//  Copyright © 2015 Dmytro Morozov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var massLabel: UILabel!
    
    @IBOutlet weak var massSlider: UISlider!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var heightSlider: UISlider!

    @IBOutlet weak var indexLabel: UILabel!
    
    let indexer = Indexer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateMassLabelText(massSlider.value)
        updateHeightLabelText(heightSlider.value)
    }
    
    func updateMassLabelText(value: Float) {
        massLabel.text = NSString(format: "%.1f kg", value) as String
    }
    
    func updateHeightLabelText(value: Float) {
        heightLabel.text = NSString(format: "%.2f m", value) as String
    }
    
    func updateIndexLabel(mass: Float, height: Float) {
        let index = indexer.calculate(Double(mass), height: Double(height))
        if index == nil {
            indexLabel.hidden = true
        } else {
            indexLabel.text = indexer.categorize(index!).rawValue
            indexLabel.hidden = false
        }
    }
    
    @IBAction func onMassChanged(sender: UISlider) {
        updateMassLabelText(sender.value)
        updateIndexLabel(sender.value, height: heightSlider.value)
    }
    
    @IBAction func onHeightChanged(sender: UISlider) {
        updateHeightLabelText(sender.value)
        updateIndexLabel(massSlider.value, height: sender.value)
    }
    
}