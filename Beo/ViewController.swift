//
//  ViewController.swift
//  Beo
//
//  Created by Eanna Boland on 20/02/2017.
//  Copyright © 2017 Eanna Boland. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var datePickertxt: UITextField!
    let datePicker = UIDatePicker()
    
    @IBAction func Segue(_ sender: AnyObject) {
        performSegue(withIdentifier: "TestSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        createDatePicker()
        
    }

    func createDatePicker() {
        //format the picker
        datePicker.datePickerMode = .dateAndTime
        
        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        //bar Button
        let donebutton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([donebutton], animated: false)
        
        datePickertxt.inputAccessoryView = toolbar
        
        //assigning date picker to text field
        datePickertxt.inputView = datePicker
    }

    func donePressed (){
        
        // format done
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        
        datePickertxt.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    
    }

}

