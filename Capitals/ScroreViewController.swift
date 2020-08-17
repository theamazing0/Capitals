//
//  ScroreViewController.swift
//  Capitals
//
//  Created by Samvid Konchada on 2/8/20.
//  Copyright © 2020 Samvid Konchada. All rights reserved.
//

import UIKit
import AVFoundation
import GoogleMobileAds

class ScroreViewController: UIViewController {
    var audioPlayer = AVAudioPlayer()
    
    @IBOutlet var nLabel: UILabel!
    @IBOutlet var highscoreLabel: UILabel!
    

    @IBOutlet var scoreadI: GADBannerView!
    var myRegion = Region()
    @IBOutlet var scoreadII: GADBannerView!
    var myScore = 0
    var myCount = 0
    var newTAudioPlayer = AVAudioPlayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreadI.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        scoreadI.rootViewController = self
        scoreadI.load(GADRequest())
        
        scoreadII.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        scoreadII.rootViewController = self
        scoreadII.load(GADRequest())
        
        self.navigationItem.setHidesBackButton( true, animated: false)
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            if let coredataHighscoresAll = try? context.fetch(Highscore.fetchRequest()) as? [Highscore]{
                
                print(coredataHighscoresAll)
                
                if var myHighscore = coredataHighscoresAll.first(where: {$0.region == myRegion.name}) {
                    
                    
                    if myHighscore.highscore < myScore {
                        
                        let alert = UIAlertController(title: "Congratultions!", message: "You just beat your old highscore of \(String(myHighscore.highscore)) out of \(String(myCount)) states. Your new highscore is \(String(myScore)) out of \(String(myCount)) states.", preferredStyle: .alert)
                        alert.view.tintColor = .systemGreen
                        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                            NSLog("The \"OK\" alert occured.")
                            
                        }))
                        self.present(alert, animated: true, completion: nil)
                        
                        
                        
                        
                        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
                            if var myHighscoreRegionName = myHighscore.region{
                                context.delete(myHighscore)
                                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                                let newHighscoreObject = Highscore(context: context)
                                newHighscoreObject.region = myHighscoreRegionName
                                newHighscoreObject.highscore = Int16(myScore)
                                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                                
                                print("if has been entered")
                                
                                print("Current myscore:")
                                print(myScore)
                                print(myCount)
                                highscoreLabel.text = "Your new Highscore is \(myScore) out of \(myCount) states"
                                print(highscoreLabel.text)
                            }
                            
                        }
                        
                        
                    }else {
                        print("else has been entered")
                        
                        print("Current my highscore:")
                        print(String(myHighscore.highscore))
                        print(myScore)
                        print(myCount)
                        
                        highscoreLabel.text = "Your Highscore is \(String(myHighscore.highscore)) out of \(String(myCount)) states"
                        print(highscoreLabel.text)
                        
                        
                        
                    }
                    
                    
                    
                    
                    
                }
                newTAudioPlayer.stop()
                
                let bSound = Bundle.main.path(forResource: "buttonClickedSound", ofType: "mp3")
                
                
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: bSound!))
                    
                }
                catch{
                    print(error)
                }
                
                print(myScore , myCount)
                
                nLabel.text = "Your score is \(String(myScore)) out of \(String(myCount)) states."
                myScore = 0
                myCount = 0
                
            }
        }
        
        print(highscoreLabel.text)
    }
    
    
    
    @IBAction func okClicked(_ sender: Any) {
        audioPlayer.play()
        print("This is the code recognized")
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as! [UIViewController];
        
        for aViewController in viewControllers {
            if(aViewController is TestLevelTableViewController){
                self.navigationController!.popToViewController(aViewController, animated: true);
            }
        }
        
    }
    
    @IBAction func home3(_ sender: Any) {
        audioPlayer.play()
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as! [UIViewController];
        
        for aViewController in viewControllers {
            if(aViewController is StartScreenViewController){
                self.navigationController!.popToViewController(aViewController, animated: true);
            }
        }
    }
    
    
}


