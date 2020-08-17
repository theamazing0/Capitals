//
//  RealTestViewController.swift
//  Capitals
//
//  Created by Samvid Konchada on 1/30/20.
//  Copyright © 2020 Samvid Konchada. All rights reserved.
//

import UIKit
import AVFoundation
import GoogleMobileAds

class RealTestViewController: UIViewController {
    @IBOutlet var testad: GADBannerView!
    
    var bAudioPlayer = AVAudioPlayer()
    var cAudioPlayer = AVAudioPlayer()
    var wAudioPlayer = AVAudioPlayer()
    var isCorrect = true
    var isGoingOut = false
    var regions : [Region] = []
    
    
    @IBOutlet var timeLeftLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var nextLook: UIButton!
    
    
    var myRegion = Region()
    var myHighScore = Highscore()
    var curStateIndex = 0
    var tableVC : TestLevelTableViewController? = nil
    var score = 0
    var answerB : UIButton? = nil
    var seconds = 20
    var timer = Timer()
    var isTimerRunning = false
    var tAudioPlayer = AVAudioPlayer()
    
    let tSound = Bundle.main.path(forResource: "Tick-Tick-Tick_Sound", ofType: "mp3")
    
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(RealTestViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    
    @objc func updateTimer() {
        
        do{
            tAudioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: tSound!))
            
        }
        catch{
            print(error)
        }
        
        tAudioPlayer.play()
        seconds -= 1
        if seconds < 0 {
            tAudioPlayer.stop()
            timer.invalidate()
            timeLeftLabel.textColor = .clear
            isCorrect = false
            if  isGoingOut == false {
                let alert = UIAlertController(title: "Time Up!", message: "You ran out of time." , preferredStyle: .alert)
                alert.view.tintColor = .systemGreen
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                    
                }))
                self.present(alert, animated: true, completion: nil)
                print("time-up wrong recognized")
                print(answerB?.currentTitle, " is correct")
                wAudioPlayer.play()
            }
            
            answerB?.backgroundColor = .green
            
            answerB?.setTitleColor(UIColor.label, for: .normal)
            
            
            
            
            button1.isEnabled = false
            button3.isEnabled = false
            button2.isEnabled = false
            nextLook.isEnabled = true
            
            
            
        }
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 0
        formatter.paddingPosition = .beforePrefix
        formatter.paddingCharacter = "0"
        formatter.minimumIntegerDigits = 2
        
        var formattedseconds = formatter.string(from: NSNumber(value: seconds))
        timeLeftLabel.text = "Time Left: 00:\(formattedseconds ?? "00")"
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testad.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        testad.rootViewController = self
        testad.load(GADRequest())
        
        self.navigationItem.setHidesBackButton( true,animated: false)
        
        button1.layer.cornerRadius = button1.frame.size.height / 10
        button2.layer.cornerRadius = button2.frame.size.height / 10
        button3.layer.cornerRadius = button3.frame.size.height / 10
        
        
        let bSound = Bundle.main.path(forResource: "buttonClickedSound", ofType: "mp3")
        
        
        do {
            bAudioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: bSound!))
            
        }
        catch{
            print(error)
        }
        
        let cSound = Bundle.main.path(forResource: "correct_sound", ofType: "mp3")
        
        
        do {
            cAudioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: cSound!))
            
        }
        catch{
            print(error)
        }
        
        let wSound = Bundle.main.path(forResource: "wrong", ofType: "mp3")
        
        
        do {
            wAudioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: wSound!))
            
        }
        catch{
            print(error)
        }
        
        
        
        questionCreate()
        
        
        
        
        
        
    }
    
    func questionCreate() {
        runTimer()
        let capitalsOptions : Array = [ "Montgomery","Juneau","Phoenix","Little Rock","Sacramento","Denver","Hartford","Dover","Tallahassee","Atlanta","Honolulu","Boise","Springfield","Indianapolis","Des Moines","Topeka","Frankfort","Baton Rouge","Augusta","Annapolis","Boston","Lansing","St. Paul","Jackson","Jefferson City","Helena","Lincoln","Carson City","Concord","Trenton","Santa Fe","Albany","Raleigh","Bismarck","Columbus","Oklahoma City","Salem","Harrisburg","Providence","Columbia","Pierre","Nashville","Austin","Salt Lake City","Montpelier","Richmond","Olympia","Charleston","Madison","Cheyenne", "St.John's", "Halifax", "Fredericton", "Quebec City", "Toronto", "Winnipeg", "Regina", "Edmonton", "Victoria", "Iqaluit", "Yellowknife", "Whitehorse", "Tirana", "Andorra la Vella", "Yerevan", "Vienna", "Baku", "Minsk", "Brussels", "Sarajevo", "Sofia", "Zagreb", "Nicosia", "Prague", "Copenhagen", "Tallinn", "Helsinki", "Paris", "Tbillisi", "Berlin", "Athens", "Budapest", "Reykjavik", "Dublin", "Rome","Nur-Sultan", "Pristina", "Riga", "Vaduz", "Vilnius", "Luxembourg", "Valletta", "Chisinau", "Monaco", "Podgorica", "Amsterdam", "Skopje", "Oslo", "Warsaw","Lisbon", "Bucharest", "Moscow", "San Marino", "Belgrade", "Bratislava", "Ljubljana", "Madrid", "Stockholm", "Bern", "Ankara", "Kyiv", "London", "Vatican City", "Buenos Aires", "Sucre", "Brasilia", "Santiago", "Bogotá", "Quito", "Georgetown", "Asunción", "Lima", "Paramaribo", "Montevideo", "Caracas", "Cayenne", "Stanley"]
        
        
        //Finished Generating Capitals Options
        
        
        
        title =  myRegion.name + " Test"
        
        //First Question generating
        
        
        //generating none equal answers function
        
        func getRandomOptions() -> Array<String> {
            
            var currentAnswer = answerB?.currentTitle
            
            var randomOptions : Array = [capitalsOptions.randomElement(), capitalsOptions.randomElement()]
            
            var goOn = true
            
            while goOn == true {
                
                print("goOn")
                
                print(randomOptions)
                
                if(currentAnswer == randomOptions[0] || randomOptions[0] == randomOptions[1] || randomOptions[1] == currentAnswer){
                    randomOptions = [capitalsOptions.randomElement(), capitalsOptions.randomElement()]
                    print(randomOptions)
                    
                }
                else{
                    goOn = false
                }
            }
            return randomOptions as! Array<String>
            
            /*
             if button1.currentTitle == button2.currentTrle{
             
             } else if button1.currentTitle == button3.currentTitle{
             
             } else if button2.currentTitle == button1.currentTitle{
             
             } else if button2.currentTitle == button3.currentTitle{
             
             } else if button3.currentTitle == button1.currentTitle{
             
             } else if button3.currentTitle == button2.currentTitle{
             
             }
             */
            
        }
        
        //Done
        
        
        let mystate0 = String(myRegion.states[curStateIndex].name)
        print(myRegion.states.count)
        questionLabel.text = "What is the capital of \(mystate0) ? "
        var answerButton = Int.random(in: 1...3)
        print("answerbutton is", answerButton)
        if answerButton == 3 {
            button3.setTitle(myRegion.states[curStateIndex].capital, for : .normal)
            answerB = button3
            
            var options : Array = getRandomOptions()
            
            button2.setTitle(options[0], for : .normal)
            button1.setTitle(options[1], for : .normal)
            
        }
        else if answerButton == 2 {
            button2.setTitle(myRegion.states[curStateIndex].capital, for : .normal)
            answerB = button2
            
            var options : Array = getRandomOptions()
            
            button3.setTitle(options[0], for : .normal)
            button1.setTitle(options[1], for : .normal)
            
        }
        else {
            button1.setTitle(myRegion.states[curStateIndex].capital, for : .normal)
            answerB = button1
            
            var options : Array = getRandomOptions()
            
            button2.setTitle(options[0], for : .normal)
            button3.setTitle(options[1], for : .normal)
        }
        print(answerB?.currentTitle)
        
        
        
        
        
        nextLook.isEnabled = false
    }
    
    
    // Function for Buttons
    func showResult (answer : String, button : UIButton) {
        //check if ans is correct
        if answer == myRegion.states[curStateIndex].capital {
            isCorrect = true
            button.titleLabel!.textColor = .label
            answerB?.titleLabel!.textColor = .label
            score += 1
            let alert = UIAlertController(title: "Correct", message: "You are correct!", preferredStyle: .alert)
            alert.view.tintColor = .systemGreen
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
                
            }))
            self.present(alert, animated: true, completion: nil)
            button.backgroundColor = .green
            button.setTitleColor(UIColor.label, for: .normal)
            print("correct recognized")
            
            cAudioPlayer.play()
            
            
            
        } else {
            isCorrect = false
            let alert = UIAlertController(title: "Wrong", message: "You are incorrect." , preferredStyle: .alert)
            alert.view.tintColor = .systemGreen
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
                
            }))
            self.present(alert, animated: true, completion: nil)
            button.backgroundColor = .red
            answerB?.backgroundColor = .green
            button.setTitleColor(UIColor.label, for: .normal)
            answerB?.setTitleColor(UIColor.label, for: .normal)
            
            print("wrong recognized")
            print(answerB?.currentTitle, " is correct")
            wAudioPlayer.play()
            
        }
        button1.isEnabled = false
        button3.isEnabled = false
        button2.isEnabled = false
        nextLook.isEnabled = true
        //disable all buttons
        //launch alert based on correct or wrong
        
    }
    //Done
    
    
    
    
    //Function for create question
    
    //Done
    
    
    
    
    
    
    
    @IBAction func buttonOneClicked(_ sender: Any) {
        bAudioPlayer.play()
        timer.invalidate()
        timeLeftLabel.textColor = .clear
        //change button1 color.
        if var answer1 =  button1.currentTitle {
            showResult(answer : answer1, button : button1)
            if isCorrect {
                cAudioPlayer.play()
            } else {
                wAudioPlayer.play()
            }
        }
    }
    
    @IBAction func buttonTwoClicked(_ sender: Any) {
        bAudioPlayer.play()
        timer.invalidate()
        timeLeftLabel.textColor = .clear
        if var answer1 =  button2.currentTitle {
            showResult(answer : answer1, button : button2)
            if isCorrect {
                cAudioPlayer.play()
            } else {
                wAudioPlayer.play()
            }
        }
    }
    
    @IBAction func buttonThreeClicked(_ sender: Any) {
        bAudioPlayer.play()
        timer.invalidate()
        timeLeftLabel.textColor = .clear
        if var answer1 =  button3.currentTitle {
            showResult(answer : answer1, button : button3 )
            if isCorrect {
                cAudioPlayer.play()
            } else {
                wAudioPlayer.play()
            }
        }
    }
    
    @IBAction func nextClicked(_ sender: Any) {
        timeLeftLabel.text = "Time Left: 00:20"
        timeLeftLabel.textColor = .secondaryLabel
        seconds = 20
        bAudioPlayer.play()
        
        button1.setTitleColor(UIColor.secondaryLabel, for: .normal)
        button2.setTitleColor(UIColor.secondaryLabel, for: .normal)
        button3.setTitleColor(UIColor.secondaryLabel, for: .normal)
        
        nextLook.isEnabled = false
        
        curStateIndex = curStateIndex + 1
        if curStateIndex == myRegion.states.count{
            isGoingOut = true
            seconds = 0
            timer.invalidate()
            tAudioPlayer.stop()
            print("asghjkjhgfds")
            curStateIndex = 0
            
            performSegue(withIdentifier: "score", sender: nextClicked)
            
            score = 0
            
            
        }
        button1.backgroundColor = .systemBackground
        button2.backgroundColor = .systemBackground
        button3.backgroundColor = .systemBackground
        
        button1.isEnabled = true
        button3.isEnabled = true
        button2.isEnabled = true
        
        let mystate0 = String(myRegion.states[curStateIndex].name)
        print(myRegion.states.count)
        questionLabel.text = "What is the capital of \(mystate0) ? "
        questionCreate()
        
        
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let DesVC = segue.destination as! ScroreViewController
        DesVC.myScore = score
        DesVC.myCount = myRegion.states.count
        DesVC.newTAudioPlayer = tAudioPlayer
        DesVC.myRegion = myRegion
    }
    @IBAction func tableClicked(_ sender: Any) {
        timer.invalidate()
        isGoingOut = true
        bAudioPlayer.play()
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as! [UIViewController];
        
        for aViewController in viewControllers {
            if(aViewController is TestLevelTableViewController){
                self.navigationController!.popToViewController(aViewController, animated: true);
            }
        }
        
    }
    
    @IBAction func home2(_ sender: Any) {
        timer.invalidate()
        isGoingOut = true
        bAudioPlayer.play()
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as! [UIViewController];
        
        for aViewController in viewControllers {
            if(aViewController is StartScreenViewController){
                self.navigationController!.popToViewController(aViewController, animated: true);
            }
        }
    }
    
    
}


