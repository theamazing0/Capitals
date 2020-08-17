//
//  StartScreenViewController.swift
//  Capitals
//
//  Created by Samvid Konchada on 1/1/20.
//  Copyright © 2020 Samvid Konchada. All rights reserved.
//

import UIKit
import AVFoundation
import GoogleMobileAds


class StartScreenViewController: UIViewController {

    var audioPlayer = AVAudioPlayer()

    @IBOutlet var startad: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton( true, animated: false)
        
        startad.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        startad.rootViewController = self
        startad.load(GADRequest())
        
        
        let bSound = Bundle.main.path(forResource: "buttonClickedSound", ofType: "mp3")
        
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: bSound!))
            
        }
        catch{
            print(error)
        }
    }
    
    @IBAction func flashcardsButton(_ sender: Any) {
        
        
        audioPlayer.play()
        
        
        performSegue(withIdentifier: "startToTable", sender: nil)
    }
    
    @IBAction func testButton(_ sender: Any) {
        
        audioPlayer.play()
        performSegue(withIdentifier: "startToTestTable", sender: nil)
    }
}
    




