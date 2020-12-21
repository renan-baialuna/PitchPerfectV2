//
//  ViewController.swift
//  PitchPerfectV2
//
//  Created by Renan Baialuna on 15/12/20.
//  Copyright © 2020 Renan Baialuna. All rights reserved.
//

import UIKit

class RecordSoundViewController: UIViewController {
    
    let recordButton: UIButton = {
        let button = UIButton()
        let playButton  = UIButton(type: .custom)
           if let image = UIImage(named: "RecordButton") {
                button.setImage(image, for: .normal)
           }
        return button
    }()
    
    let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Tap to Record"
        label.textAlignment = .center
        return label
    }()
    
    let stopButton: UIButton = {
        let button = UIButton()
        let playButton  = UIButton(type: .custom)
           if let image = UIImage(named: "StopRecordButton") {
               button.setImage(image, for: .normal)
           }
        button.addTarget(self, action: #selector(stopRecording), for: .touchUpInside)
        return button
    }()
    
    private func setupRecordButton() {
        recordButton.sizeToFit()
               
        //        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        recordButton.translatesAutoresizingMaskIntoConstraints = false
        recordButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        recordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        recordButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        recordButton.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        statusLabel.topAnchor.constraint(equalTo: recordButton.bottomAnchor, constant: 10).isActive = true
        statusLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        statusLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        stopButton.translatesAutoresizingMaskIntoConstraints = false
        stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stopButton.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 30).isActive = true
        stopButton.widthAnchor.constraint(equalToConstant: 64).isActive = true
        stopButton.heightAnchor.constraint(equalTo: stopButton.widthAnchor).isActive = true
        
    }
    func setNavigationBar() {
        let screenSize: CGRect = UIScreen.main.bounds
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: 1004))
        let navItem = UINavigationItem(title: "")
//        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: #selector(done))
//        navItem.rightBarButtonItem = doneItem
        navBar.setItems([navItem], animated: false)
        self.view.addSubview(navBar)
    }

    @objc func done() {
        

        
    }

    @objc func stopRecording(sender: UIButton!) {

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        
        // Do any additional setup after loading the view.
        self.view.addSubview(recordButton)
        self.view.addSubview(statusLabel)
        self.view.addSubview(stopButton)
        setupRecordButton()
        
        
        

        
        
        
        
//        let stackView   = UIStackView()
//        self.view.addSubview(stackView)
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//
//        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//
//        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        stackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//
//        stackView.axis  = NSLayoutConstraint.Axis.vertical
//        stackView.distribution  = UIStackView.Distribution.equalSpacing
////        stackView.alignment = UIStackView.Alignment.center
//        stackView.spacing   = 16.0
//
//        stackView.addArrangedSubview(button)
//        stackView.addArrangedSubview(button2)
    }


}

