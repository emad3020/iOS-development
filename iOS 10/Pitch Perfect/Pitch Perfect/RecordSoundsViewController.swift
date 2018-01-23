//
//  RecordSoundsViewController.swift
//  Pitch Perfect
//
//  Created by Emad on 6/27/17.
//  Copyright © 2017 askerlapAskerlap. All rights reserved.
//

import UIKit
import AVFoundation


class RecordSoundsViewController: UIViewController , AVAudioRecorderDelegate {

    //MARK: Properties
    var audioRecorder : AVAudioRecorder!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var recoringLabel: UILabel!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       stopRecordingButton.isEnabled = false
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
 

    @IBAction func recordAudio(_ sender: Any) {
        
        configureUI(isRecording: false)
        
        
        //define a path to store the audio file in decument
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) [0] as String
        
        //give the audio file name
        let recodingName = "recordedVoice.wav"
        
        //combine the name and the path in one array
        let pathArray = [dirPath, recodingName]
        
        //seperate the name and path with "/" in the array
        let filePath = URL(string: pathArray.joined(separator: "/"))
    
        
        //shared instance of audioSession to record and playback
        let session = AVAudioSession.sharedInstance()
        
        //set the instance for playing and recording
        try! session.setCategory(AVAudioSessionCategoryPlayback, with : .defaultToSpeaker)
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
    }
    
    @IBAction func stopRecording(_ sender: Any) {
        
        configureUI(isRecording: true)
      
        //stop the recoder
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
        performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        } else {
            print("recording was not successful")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording" {
            let playSoundVC = segue.destination as! PlaySoundsViewController
            let recordAudioURL = sender as! URL
            playSoundVC.recordAudioURL = recordAudioURL
        }
    }
    
    func configureUI(isRecording:Bool) {
        stopRecordingButton.isEnabled = !isRecording
        recordButton.isEnabled = isRecording
        if !isRecording{
            recoringLabel.text = "Recoridng in Progres"
        } else {
        recoringLabel.text = "Tap to Record"
        }
    }
}

