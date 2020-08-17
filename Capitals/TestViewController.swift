//
//  TestViewController.swift
//  Capitals
//
//  Created by Samvid Konchada on 1/11/20.
//  Copyright © 2020 Samvid Konchada. All rights reserved.
//

import UIKit
import AVFoundation
import GoogleMobileAds

class TestViewController: UIViewController {
    
    var audioPlayer = AVAudioPlayer()
    @IBOutlet var showLook: UIButton!
    
    @IBOutlet var flashcardsad: GADBannerView!
    @IBOutlet var nextLook: UIButton!
    var myRegion = Region()
    var curStateIndex = 0
    var tableVC : LevelTableViewController? = nil
    
    //----------------------------------------------------------------------------------------------------------
    
    @IBOutlet var qLabel: UILabel!
    @IBOutlet var aLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        flashcardsad.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        flashcardsad.rootViewController = self
        flashcardsad.load(GADRequest())
        
        self.navigationItem.setHidesBackButton( true, animated: false)
        showLook.layer.cornerRadius = showLook.frame.size.height / 10
        nextLook.layer.cornerRadius = nextLook.frame.size.height / 10
        
        let bSound = Bundle.main.path(forResource: "buttonClickedSound", ofType: "mp3")
        
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: bSound!))
            
        }
        catch{
            print(error)
        }
        
        
        title =  myRegion.name + " Flashcards"
        
        
        
      let mystate0 = String(myRegion.states[curStateIndex].name)
        print(myRegion.states.count)
       qLabel.text = "What is the capital of \(mystate0) ? "
        aLabel.text = ""
        

        
    }
    
    @IBAction func showButton(_ sender: Any) {
        audioPlayer.play()
        aLabel.text = String(myRegion.states[curStateIndex].capital)
    }
    
    @IBAction func nextButton(_ sender: Any) {
        audioPlayer.play()
        curStateIndex = curStateIndex + 1
        print("gettting into next button")
        if curStateIndex == myRegion.states.count{
            print("asghjkjhgfds")
           curStateIndex = 0
            navigationController?.popViewController(animated: true)
        }
        let mystate0 = String(myRegion.states[curStateIndex].name)
         print(myRegion.states.count)
        qLabel.text = "What is the capital of \(mystate0) ? "
         aLabel.text = ""
        
    }
    @IBAction func table2(_ sender: Any) {
        audioPlayer.play()
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as! [UIViewController];

                    for aViewController in viewControllers {
                        if(aViewController is
                            LevelTableViewController){
                             self.navigationController!.popToViewController(aViewController, animated: true);
                        }
                    }
    }
    
    @IBAction func home5(_ sender: Any) {
        audioPlayer.play()
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as! [UIViewController];

                    for aViewController in viewControllers {
                        if(aViewController is StartScreenViewController){
                             self.navigationController!.popToViewController(aViewController, animated: true);
                        }
                    }
    }
}
