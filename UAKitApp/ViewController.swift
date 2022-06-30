//
//  ViewController.swift
//  UAKitApp
//
//  Created by Дима Губеня on 25.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Label
       
        mainLabel.font = mainLabel.font.withSize(35)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
        
        // Segment Control
        segmentedControl.insertSegment(withTitle: "Third", at: 2, animated: false)
        
        //Slider
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .darkGray
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .blue
        mainLabel.text = String(slider.value)
        
        //Date Picker
        //datePicker.locale = Locale.current
        datePicker.locale = Locale(identifier: "ru_UA")
    }


    @IBAction func chooseSegment() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "The first segment selected"
            mainLabel.textColor = .brown
        case 1:
            mainLabel.text = "The second segment selected"
            mainLabel.textColor = .red
        case 2:
            mainLabel.text = "The third segment selected"
            mainLabel.textColor = .green
        default: break
        }
    }
    
    @IBAction func sliderAction() {
        mainLabel.text = String(slider.value)
        let sliderValue = CGFloat(slider.value)
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(sliderValue)
    }
    
   
    @IBAction func doneButtonPressed() {
        guard let inputText = userNameTextField.text, !inputText.isEmpty else {
            showAlert(with: "Text field is empty", and: "Please enter your name")
            print("Text field is empty")
            return
        }
        
        if let _ = Double(inputText) {
            showAlert(with: "Wrong Format", and: "Please enter your name")
            print("Wrong Format")
            return
        }
        
        mainLabel.text = inputText
        userNameTextField.text = ""
    }
    
    @IBAction func choseeDate() {
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .medium
        dateFormater.locale = Locale(identifier: "ru_UA")
        mainLabel.text = dateFormater.string(from: datePicker.date)
    }
}

// MARK: - UIAlertController

extension ViewController {
    private func showAlert(with title: String, and message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.userNameTextField.text = ""
        }
        alert.addAction(okAction)
    present(alert, animated: true)
    }
    
}
