//
//  colors.swift
//  Hue
//
//  Created by Nicolás Acosta on 25/11/2020.
//

import Foundation
import UIKit


extension UIViewController {
    
    var violet      :   UIColor { return UIColor(red: 0.659, green: 0.129, blue: 0.420, alpha: 1.000) }
    var red         :   UIColor { return UIColor(red: 0.945, green: 0.094, blue: 0.298, alpha: 1.000) }
    var orange      :   UIColor { return UIColor(red: 0.953, green: 0.412, blue: 0.263, alpha: 1.000) }
    var yellow      :   UIColor { return UIColor(red: 0.969, green: 0.863, blue: 0.400, alpha: 1.000) }
    var blue        :   UIColor { return UIColor(red: 0.180, green: 0.584, blue: 0.600, alpha: 1.000) }
    var lightblue   :   UIColor { return UIColor(red: 0.220, green: 0.717, blue: 0.737, alpha: 1.000) }
    
    var white       :   UIColor { return UIColor.white }
    
    
    //  Agregar esto a override func viewDidLayoutSubviews()
    func gradientLayer(colors: [UIColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.colors = colors.map({$0.cgColor})
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func blueGradientLayer() {
        gradientLayer(colors: [blue,lightblue])
    }
    

}


extension UIView {
    
    func gradientLayer(colors: [UIColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.colors = colors.map({$0.cgColor})
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = 5
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
}



