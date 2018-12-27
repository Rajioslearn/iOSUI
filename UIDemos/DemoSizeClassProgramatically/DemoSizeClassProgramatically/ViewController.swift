//
//  ViewController.swift
//  DemoSizeClassProgramatically
//
//  Created by Rajeshnath Chyarngayil Vishwanath on 12/27/18.
//  Copyright © 2018 Rajeshnath Chyarngayil Vishwanath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var redView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.red
        return view
    }()
    
    lazy var greenView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.green
        return view
    }()
    
    lazy var blueView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.blue
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Appy Contraints
        view.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
            
        let horizontalSizeClassChanged = (previousTraitCollection?.horizontalSizeClass != traitCollection.horizontalSizeClass)
        
        if horizontalSizeClassChanged {
            updateViews()
        }
        
    }
    
    private func updateViews() {
        switch traitCollection.horizontalSizeClass {
        case .compact:
            setViewForCompact()
            
        case .regular:
            setViewForRegular()
        
        case .unspecified:
            break
        }
    }
  
    func setViewForCompact() {
        setUpRedViewWith(dimension: 130)
        removeBlueViewIfExists()
        setUpGreenViewWith(dimension: 130)
    }
    
    func removeBlueViewIfExists() {
        if view.subviews.contains(blueView) {
            blueView.removeFromSuperview()
        }
    }
    
    func setViewForRegular() {
        setUpRedViewWith(dimension: 130)
        setUpBlueViewWith(dimension: 130)
        setUpGreenViewWith(dimension: 130)
    }
    
    func setUpRedViewWith(dimension: CGFloat) {
        view.addSubview(redView)
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            redView.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15),
            redView.widthAnchor.constraint(equalToConstant: dimension),
            redView.heightAnchor.constraint(equalToConstant: dimension),
        ])
    }
    
    func setUpGreenViewWith(dimension: CGFloat) {
        view.addSubview(greenView)
        
        NSLayoutConstraint.activate([
            greenView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            greenView.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15),
            greenView.safeAreaLayoutGuide.widthAnchor.constraint(equalToConstant: dimension),
            greenView.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: dimension),
        ])
    }
    
    func setUpBlueViewWith(dimension: CGFloat) {
        view.addSubview(blueView)
        
        NSLayoutConstraint.activate([
            blueView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            blueView.safeAreaLayoutGuide.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            blueView.safeAreaLayoutGuide.widthAnchor.constraint(equalToConstant: dimension),
            blueView.safeAreaLayoutGuide.heightAnchor.constraint(equalToConstant: dimension),
            ])
        
    }

}

