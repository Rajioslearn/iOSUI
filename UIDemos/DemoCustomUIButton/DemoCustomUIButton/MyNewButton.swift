//
//  MyNewButton.swift
//  DemoCustomUIButton
//
//  Created by Rajeshnath Chyarngayil Vishwanath on 1/7/19.
//  Copyright © 2019 Rajeshnath Chyarngayil Vishwanath. All rights reserved.
//

import UIKit

class MyNewButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let color = UIColor.red
        let disabledColor = color.withAlphaComponent(0.3)
        
        let gradientColor1 = UIColor(red: 100.0 / 255.0, green: 100.0 / 255.0, blue: 100.0 / 255.0, alpha: 1).cgColor
        let gradientColor2 = UIColor(red: 50.0 / 255.0, green: 50.0 / 255.0, blue: 50.0 / 255.0, alpha: 1).cgColor
        
        let btnFont = "Noteworthy"
        let bthWidth = 200
        let btnHeight = 60
        
        // setting the frame radius and position
        
        self.frame.size = CGSize(width: bthWidth, height: btnHeight)
        self.frame.origin = CGPoint(x: (((superview?.frame.width)! / 2) - (self.frame.width / 2)), y: self.frame.origin.y)
        
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
        self.layer.borderWidth = 3.0
        self.layer.borderColor = color.cgColor
        
        // setting the title and font
        
        self.setTitleColor(color, for: .normal)
        self.setTitleColor(disabledColor, for: .disabled)
        self.titleLabel?.font = UIFont(name: btnFont, size: 25)
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.setTitle(self.titleLabel?.text?.capitalized, for: .normal)
        
        // create a gradient background
        
        let btnGradient = CAGradientLayer()
        btnGradient.frame = self.bounds
        btnGradient.colors = [gradientColor1, gradientColor2]
        self.layer.insertSublayer(btnGradient, at: 0)
        
        self.contentEdgeInsets.bottom = 4
        
        self.addTarget(self, action: #selector(onPress), for: UIControl.Event.touchUpInside)
    }
    
    @objc
    func onPress() {
        print("Pressed")
    }
}
