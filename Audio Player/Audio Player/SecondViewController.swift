//
//  SecondViewController.swift
//  Audio Player
//
//  Created by Daniel Ro on 1/1/18.
//  Copyright © 2018 Daniel Ro. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var myImageView: UIImageView!
    
    
    @IBAction func play(_ sender: UIButton) {
        if audioPlayer.isPlaying == false {
            audioPlayer.play()
        }
    }
    
    @IBAction func pause(_ sender: UIButton) {
        if audioPlayer.isPlaying == true {
            audioPlayer.pause()
        }
    }
    
    
    @IBAction func shuffle(_ sender: UIButton) {
        thisSong = Int(arc4random_uniform(UInt32(songs.count)))
        playThis(thisOne: songs[thisSong])
        // load song name
        label.text = songs[thisSong]
    }
    
    @IBAction func prev(_ sender: UIButton) {
        if thisSong>0 {
            thisSong -= 1 //decrement song count
            playThis(thisOne: songs[thisSong])
        }
        else {
            thisSong = songs.count-1 //loop around
            playThis(thisOne: songs[thisSong])
        }
        // load song name
        label.text = songs[thisSong]
    }
    
    @IBAction func next(_ sender: UIButton) {
        if thisSong<songs.count-1 {
            thisSong += 1 //increment song count
            playThis(thisOne: songs[thisSong])
        }
        else {
            thisSong = 0 //loop around
            playThis(thisOne: songs[thisSong])
        }
        // load song name
        label.text = songs[thisSong]
    }
    
    @IBAction func slider(_ sender: UISlider) {
        audioPlayer.volume = sender.value
    }
    
    //function for playing song associated with song name
    func playThis(thisOne: String) {
        //play song associated with that name
        do {
            let audioPath = Bundle.main.path(forResource: thisOne, ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
            audioPlayer.play()
        } catch {
            print("Error")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // load song name
        label.text = songs[thisSong]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

