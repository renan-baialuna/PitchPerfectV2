//
//  PlaySoundViewController.swift
//  PitchPerfectV2
//
//  Created by Renan Baialuna on 17/12/20.
//  Copyright © 2020 Renan Baialuna. All rights reserved.
//

import UIKit

class PlaySoundViewController: UIViewController {

//    enum buttonsImages: String, CaseIterable {
//        case Echo
//        case Fast
//        case HigthPitch
//        case LowPitch
//        case Reverb
//        case Slow
//    }
    
    let buttonsImages = ["Echo", "Fast", "HigthPitch", "LowPitch", "Reverb", "Slow"]
    
    private func setupRecordButton() {
        
        
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
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupRecordButton()
        
    }
    
    @objc func playSound(sender: UIButton) {
        print(sender.tag)
    }
}
