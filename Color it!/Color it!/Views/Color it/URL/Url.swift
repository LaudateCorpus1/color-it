//
//  ColorItViewController.swift
//  Hue
//
//  Created by Nicolás Acosta on 25/11/2020.
//

import Foundation
import UIKit


class UrlVC : ColorItVC {
    
    @IBOutlet weak var inputImageURL: UITextField!
    
    @IBOutlet weak var colorItButton: UIButton!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputImageURL.layer.cornerRadius = 5
        inputImageURL.layer.borderWidth = 1
        inputImageURL.layer.borderColor = white.cgColor
        
        colorItButton.layer.cornerRadius = 5
        colorItButton.setTitleColor(white, for: .normal)
        colorItButton.gradientLayer(colors: [violet, red, orange])
        
    }
    
    @IBAction func colorItButton(_ sender: Any) {
        
        inputImageURL.resignFirstResponder()
        activityIndicator.startAnimating()
        
        
        let _ = ImageDataBuilder(fromURL: inputImageURL.text!) {
            (data) in
            
            self.imageDataForSegue = data
            
            do {
                try DataHelper.shared.saveData()
            } catch {
                self.okAlert(title: "Error", message: "Could not save data")
            }
            
            self.activityIndicator.stopAnimating()
            
            self.imageViewerSegue()
            
            self.imageDataForSegue = nil
            
            try! DataHelper.shared.saveData()
            
            
        } error: { (error) in
            
            self.okAlert(title: "Error", message: "Error processing your photo. Check the URL and your internet connection.")
            
        }

            
    }
    
    
}



extension UrlVC : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
    
}