//
//  RegionInfoViewController.swift
//  Capitals
//
//  Created by Samvid Konchada on 5/23/20.
//  Copyright © 2020 Samvid Konchada. All rights reserved.
//

import UIKit
import AVFoundation
import GoogleMobileAds

class RegionInfoViewController: UIViewController {

    @IBOutlet var regionNameLabel: UILabel!
    @IBOutlet var highscoreLabel: UILabel!
    var myRegion  = Region()
    @IBOutlet var infoad: GADBannerView!
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoad.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        infoad.rootViewController = self
        infoad.load(GADRequest())
        
        self.navigationItem.setHidesBackButton( true, animated: false)
        
        let bSound = Bundle.main.path(forResource: "buttonClickedSound", ofType: "mp3")
        
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: bSound!))
            
        }
        catch{
            print(error)
        }
        
        print(myRegion.name)

        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
                    if let coredataHighscoresAll = try? context.fetch(Highscore.fetchRequest()) as? [Highscore]{
                        
                        print(coredataHighscoresAll)
                        
                        if var myHighscore = coredataHighscoresAll.first(where: {$0.region == myRegion.name}) {
                            highscoreLabel.text = "\(myHighscore.highscore) out of \(myRegion.states.count) states"
                            regionNameLabel.text = myRegion.name
                           
                        } else {
                            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
                            let newHighscoreObject = Highscore(context: context)
                                newHighscoreObject.region = myRegion.name
                                    newHighscoreObject.highscore = 0
                                    (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                                highscoreLabel.text = "0 out of \(myRegion.states.count) states"
                                regionNameLabel.text = myRegion.name
                                }
                            
                        }
                        
                    }
        }

        

        
        
  

        // Do any additional setup after loading the view.
    }
    


    @IBAction func homeButtonInfo(_ sender: Any) {
        audioPlayer.play()
        
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as! [UIViewController];
        
        for aViewController in viewControllers {
            if(aViewController is StartScreenViewController){
                self.navigationController!.popToViewController(aViewController, animated: true);
            }
        }
        
    }
    
    @IBAction func goButton(_ sender: Any) {
        audioPlayer.play()
        
        performSegue(withIdentifier: "goToTest", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DeVC = segue.destination as! RealTestViewController
        DeVC.myRegion = myRegion
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        audioPlayer.play()
        
        self.navigationController!.popViewController(animated: true)
        
    }
    
    
    
    
}
