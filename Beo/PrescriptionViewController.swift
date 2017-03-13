//
//  PrescriptionViewController.swift
//  Beo
//
//  Created by Eanna Boland on 04/03/2017.
//  Copyright © 2017 Eanna Boland. All rights reserved.
//

import UIKit

class PrescriptionViewController: UIViewController {
    
    
    //Outlets
    @IBOutlet weak var PharmaText: UITextField!
    @IBOutlet weak var PrescipText: UITextField!
    @IBOutlet weak var DosageText: UITextField!
    @IBOutlet weak var QRDisplay: UIImageView!

    
    
    //Actions
    @IBAction func generateQRCode(_ sender: AnyObject) {
        QRDisplay.image = generateQRCodeFromString(string: "Pharmacy:\r\n" + PharmaText.text! + ",\r\nPresciption:\r\n" + PrescipText.text!+",\r\nDosage:\r\n" + DosageText.text!)
    }
    
    
    //Functions
    func generateQRCodeFromString(string: String) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii)
        let filter = CIFilter(name: "CIQRCodeGenerator")
        
         filter?.setValue(data, forKey: "inputMessage")
        
        let transform = CGAffineTransform(scaleX:10, y: 10)
        let output = filter?.outputImage?.applying(transform)
        
        if (filter != nil){
            return UIImage(ciImage: output!)
        }
        return nil;
    }
}


