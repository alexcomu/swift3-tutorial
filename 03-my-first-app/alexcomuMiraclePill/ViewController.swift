//
//  ViewController.swift
//  alexcomuMiraclePill
//
//  Created by Alex Comunian on 31/08/16.
//  Copyright © 2016 Hackademy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var stateButton: UIButton!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryTextField: UITextField!
    @IBOutlet weak var zipcodeLabel: UILabel!
    @IBOutlet weak var zipcodeTextField: UITextField!
    @IBOutlet weak var successView: UIView!
    
    let states = ["SPAIN", "ITALY", "GERMANY", "FRANCE", "PORTUGAL"]

    override func viewDidLoad() {
        super.viewDidLoad()
        statePicker.dataSource = self
        statePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func changeHiddenProperties(){
        statePicker.isHidden = !statePicker.isHidden
        countryLabel.isHidden = !countryLabel.isHidden
        countryTextField.isHidden = !countryTextField.isHidden
        zipcodeLabel.isHidden = !zipcodeLabel.isHidden
        zipcodeTextField.isHidden = !zipcodeTextField.isHidden
    }

    @IBAction func stateButtonPressed(_ sender: AnyObject) {
        changeHiddenProperties()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        stateButton.setTitle(states[row], for: UIControlState.normal)
        changeHiddenProperties()
    }

    @IBAction func buyButtonPressed(_ sender: AnyObject) {
        successView.isHidden = false
    }
}

