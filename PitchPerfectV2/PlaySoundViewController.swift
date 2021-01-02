//
//  PlaySoundViewController.swift
//  PitchPerfectV2
//
//  Created by Renan Baialuna on 17/12/20.
//  Copyright © 2020 Renan Baialuna. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {

    
    let buttonsImages = ["Slow", "Fast", "HigthPitch", "LowPitch", "Echo", "Reverb"]
    enum ButtonType: Int {
        case slow = 0, fast, chipmunk, vader, echo, reverb
    }
    
    var recordedAudioURL: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    let stopButton = UIButton()
    
    private func setupButtons() {
        let stackView   = UIStackView()
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.center
        stackView.spacing   = 5.0
        
        self.view.addSubview(stackView)
        
        stackView.sizeToFit()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        let guide = self.view.safeAreaLayoutGuide
        stackView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 20).isActive = true
        stackView.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -20).isActive = true
        stackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -20).isActive = true
        
        var i = 0
        for _ in 0...(buttonsImages.count / 2 - 1) {
            let internalStack   = UIStackView()
            internalStack.axis  = NSLayoutConstraint.Axis.horizontal
            internalStack.distribution  = UIStackView.Distribution.equalSpacing
            internalStack.alignment = UIStackView.Alignment.center
            internalStack.spacing   = 5.0
            
            for _ in 0...1 {
                let button = UIButton()
                let image = UIImage(named: buttonsImages[i])
                button.setImage(image!, for: .normal)
                button.tag = i
                button.addTarget(self, action: #selector(playSound), for: .touchUpInside)
                internalStack.addArrangedSubview(button)
                i += 1
            }
            
            stackView.addArrangedSubview(internalStack)
            
        }
        
        stopButton.addTarget(self, action: #selector(stopSound), for: .touchUpInside)
        let image = UIImage(named: "StopRecordButton")
        stopButton.setImage(image!, for: .normal)
        
        stackView.addArrangedSubview(stopButton)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        setupAudio()
        view.backgroundColor = UIColor.white
        
    }
    
    @objc func playSound(sender: UIButton) {
//        print(sender.tag)
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .chipmunk:
            playSound(pitch: 1000)
        case .vader:
            playSound(pitch: -1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        configureUI(.playing)
    }
    
    @objc func stopSound() {
        stopAudio()
    }
}
