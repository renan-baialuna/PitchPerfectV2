//
//  ViewController.swift
//  PitchPerfectV2
//
//  Created by Renan Baialuna on 15/12/20.
//  Copyright © 2020 Renan Baialuna. All rights reserved.
//

import UIKit

class RecordSoundViewController: UIViewController {
    
    var navBar: UINavigationBar! = nil
    
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

    @objc func stopRecording(sender: UIButton!) {
        let nextView = PlaySoundViewController()
        navigationController?.pushViewController(nextView, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Record sound"
        view.backgroundColor = .white
        self.view.addSubview(recordButton)
        self.view.addSubview(statusLabel)
        self.view.addSubview(stopButton)
        setupRecordButton()
    }


}

