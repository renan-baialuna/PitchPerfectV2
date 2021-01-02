//
//  ViewController.swift
//  PitchPerfectV2
//
//  Created by Renan Baialuna on 15/12/20.
//  Copyright © 2020 Renan Baialuna. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController {
    
    var navBar: UINavigationBar! = nil
    var audioRecorder: AVAudioRecorder!
    
//MARK: Set up UI
    
    let recordButton: UIButton = {
        let button = UIButton()
        let playButton  = UIButton(type: .custom)
           if let image = UIImage(named: "RecordButton") {
                button.setImage(image, for: .normal)
           }
        button.addTarget(self, action: #selector(recordAudio), for: .touchUpInside)
        return button
    }()
    
    let recordingLabel: UILabel = {
        let label = UILabel()
        label.text = "Tap to Record"
        label.textAlignment = .center
        return label
    }()
    
    let stopRecordButton: UIButton = {
        let button = UIButton()
        let playButton  = UIButton(type: .custom)
           if let image = UIImage(named: "StopRecordButton") {
               button.setImage(image, for: .normal)
           }
        button.addTarget(self, action: #selector(stopRecording), for: .touchUpInside)
        return button
    }()
    
//MARK: UI Layout
    
    private func setupRecordButton() {
        recordButton.sizeToFit()
        recordButton.translatesAutoresizingMaskIntoConstraints = false
        recordButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        recordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        recordButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        recordButton.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        recordingLabel.translatesAutoresizingMaskIntoConstraints = false
        recordingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        recordingLabel.topAnchor.constraint(equalTo: recordButton.bottomAnchor, constant: 10).isActive = true
        recordingLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        recordingLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        stopRecordButton.translatesAutoresizingMaskIntoConstraints = false
        stopRecordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stopRecordButton.topAnchor.constraint(equalTo: recordingLabel.bottomAnchor, constant: 30).isActive = true
        stopRecordButton.widthAnchor.constraint(equalToConstant: 64).isActive = true
        stopRecordButton.heightAnchor.constraint(equalTo: stopRecordButton.widthAnchor).isActive = true
    }
    
//MARK: Button functions

    @objc func stopRecording(sender: UIButton!) {
        configUI(.stopedRecording)
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    @objc func recordAudio() {
        configUI(.recording)
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.default, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
//MARK: Adjust UI
        
    enum status: Int {
        case recording = 0, stopedRecording
    }
    
    func configUI(_ status: status) {
        switch status {
        case .recording:
            recordingLabel.text = "Recording in progress"
            stopRecordButton.isEnabled = true
            recordButton.isEnabled = false
        case .stopedRecording:
            recordingLabel.text = "tap to record"
            recordButton.isEnabled = true
            stopRecordButton.isEnabled = false
        }
    }
    
//MARK: Basic life circle functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Record sound"
        view.backgroundColor = .white
        self.view.addSubview(recordButton)
        self.view.addSubview(recordingLabel)
        self.view.addSubview(stopRecordButton)
        setupRecordButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configUI(.stopedRecording)
        
    }

}

// MARK: - Audio Recorder Delegate

extension RecordSoundViewController: AVAudioRecorderDelegate {
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            let nextView = PlaySoundViewController()
            nextView.recordedAudioURL = audioRecorder.url
            navigationController?.pushViewController(nextView, animated: true)
        } else {
            print("unsucessifull recording")
        }
    }
}
