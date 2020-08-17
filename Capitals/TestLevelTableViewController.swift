//
//  TestLevelTableViewController.swift
//  Capitals
//
//  Created by Samvid Konchada on 1/30/20.
//  Copyright © 2020 Samvid Konchada. All rights reserved.
//

import UIKit
import AVFoundation

class TestLevelTableViewController: UITableViewController {
    
    var audioPlayer = AVAudioPlayer()

        var regions : [Region] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            
            self.navigationItem.setHidesBackButton( true, animated: false)
            
            let bSound = Bundle.main.path(forResource: "buttonClickedSound", ofType: "mp3")
            
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: bSound!))
                
            }
            catch{
                print(error)
            }


            
            func stateCreate (name : String, capital : String, region : Region){
                
                let state = State()
                state.name = name
                state.capital = capital
                region.states.append(state)
                
            }
            //MARK
            
            
            
            let northEast = Region()
            northEast.name = "North East"
            
            let southEast = Region()
            southEast.name = "South East"
            
            let west = Region()
            west.name = "West"
            
            let southWest = Region()
            southWest.name = "South West"
            
            let midWest = Region()
            midWest.name = "Mid West"
            
            let canada = Region()
                   canada.name = "Canada"
            
            let europe = Region()
            europe.name = "Europe"
            
            let south_america = Region()
            south_america.name = "South America"
            
            
            regions = [northEast, southEast, west, southWest, midWest, canada, europe, south_america]
            
            stateCreate(name: "Maine", capital: "Augusta", region: northEast)
            stateCreate(name: "Vermont", capital: "Montpelier", region: northEast)
            stateCreate(name: "New Hampshire", capital: "Concord", region: northEast)
            stateCreate(name: "Massachusetts", capital: "Boston", region: northEast)
            stateCreate(name: "Rhode Island", capital: "Providence", region: northEast)
            stateCreate(name: "Connecticut", capital: "Hartford", region: northEast)
            stateCreate(name: "New York", capital: "Albany", region: northEast)
            stateCreate(name: "Pennsylvania", capital: "Harrisburg", region: northEast)
            stateCreate(name: "New Jersey", capital: "Trenton", region: northEast)
            stateCreate(name: "Deleware", capital: "Dover", region: northEast)
            stateCreate(name: "Maryland", capital: "Annapolis", region: northEast)
            
            stateCreate(name: "West Virginia", capital: "Charleston", region: southEast)
            stateCreate(name: "Virginia", capital: "Richmond", region: southEast)
            stateCreate(name: "Kentucky", capital: "Frankfort", region: southEast)
            stateCreate(name: "Tennessee", capital: "Nashville", region: southEast)
            stateCreate(name: "North Carolina", capital: "Raleigh", region: southEast)
            stateCreate(name: "South Carolina", capital: "Columbia", region: southEast)
            stateCreate(name: "Georgia", capital: "Atlanta", region: southEast)
            stateCreate(name: "Florida", capital: "Tallahassee", region: southEast)
            stateCreate(name: "Alabama", capital: "Montgomery", region: southEast)
            stateCreate(name: "Mississippi", capital: "Jackson", region: southEast)
            stateCreate(name: "Arkansas", capital: "Little Rock", region: southEast)
            stateCreate(name: "Louisiana", capital: "Baton Rouge", region: southEast)
            
            stateCreate(name: "Ohio", capital: "Columbus", region: midWest)
            stateCreate(name: "Indiana", capital: "Indianapolis", region: midWest)
            stateCreate(name: "Michigan", capital: "Lansing", region: midWest)
            stateCreate(name: "Illinois", capital: "Springfield", region: midWest)
            stateCreate(name: "Missouri", capital: "Jefferson City", region: midWest)
            stateCreate(name: "Wisconsin", capital: "Madison", region: midWest)
            stateCreate(name: "Minnesota", capital: "Saint Paul", region: midWest)
            stateCreate(name: "Iowa", capital: "Des Moines", region: midWest)
            stateCreate(name: "Kansas", capital: "Topeka", region: midWest)
            stateCreate(name: "Nebraska", capital: "Lincoln", region: midWest)
            stateCreate(name: "South Dakota", capital: "Pierre", region: midWest)
            stateCreate(name: "North Dakota", capital: "Bismarck", region: midWest)
            
            
            stateCreate(name: "Texas", capital: "Austin", region: southWest)
            stateCreate(name: "Oklahoma", capital: "Oklahoma City", region: southWest)
            stateCreate(name: "New Mexico", capital: "Santa Fe", region: southWest)
            stateCreate(name: "Arizona", capital: "Phoenix", region: southWest)
            
            stateCreate(name: "Colorado", capital: "Denver", region: west)
            stateCreate(name: "Wyoming", capital: "Cheyenne", region: west)
            stateCreate(name: "Montana", capital: "Helena", region: west)
            stateCreate(name: "Idaho", capital: "Boise", region: west)
            stateCreate(name: "Washington", capital: "Olympia", region: west)
            stateCreate(name: "Oregon", capital: "Salem", region: west)
            stateCreate(name: "Utah", capital: "Salt Lake City", region: west)
            stateCreate(name: "Nevada", capital: "Carson City", region: west)
            stateCreate(name: "California", capital: "Sacramento", region: west)
            stateCreate(name: "Alaska", capital: "Juneau", region: west)
            stateCreate(name: "Hawaii", capital: "Honolulu", region: west)
            
            
            stateCreate(name: "Alberta", capital: "Edmonton", region: canada)
            stateCreate(name: "British Columbia", capital: "Victoria", region: canada)
            stateCreate(name: "Manitoba", capital: "Winnipeg", region: canada)
            stateCreate(name: "New Brunswick", capital: "Fredericton", region: canada)
            stateCreate(name: "Newfoundland and Labrador", capital: "St. John's", region: canada)
            stateCreate(name: "Nova Scotia", capital: "Halifax", region: canada)
            stateCreate(name: "Ontario", capital: "Toronto", region: canada)
            stateCreate(name: "Prince Edward Island", capital: "Charlottetown", region: canada)
            stateCreate(name: "Quebec", capital: "Quebec City", region: canada)
            stateCreate(name: "Saskatchewan", capital: "Regina", region: canada)
            stateCreate(name: "Yukon", capital: "Whitehorse", region: canada)
            stateCreate(name: "Northwest Territories", capital: "Yellowknife", region: canada)
            stateCreate(name: "Nunavut", capital: "Iqaluit", region: canada)
            
            stateCreate(name: "Albania", capital: "Tirana", region: europe)
            stateCreate(name: "Andorra", capital: "Andorra la Vella", region: europe)
            stateCreate(name: "Armenia", capital: "Yerevan", region: europe)
            stateCreate(name: "Austria", capital: "Vienna", region: europe)
            stateCreate(name: "Azerbaijan", capital: "Baku", region: europe)
            stateCreate(name: "Belarus", capital: "Minsk", region: europe)
            stateCreate(name: "Belgium", capital: "Brussels", region: europe)
            stateCreate(name: "Bosnia and Herzegovina", capital: "Sarajevo", region: europe)
            stateCreate(name: "Bulgaria", capital: "Sofia", region: europe)
            stateCreate(name: "Croatia", capital: "Zagreb", region: europe)
            stateCreate(name: "Cyprus", capital: "Nicosia", region: europe)
            stateCreate(name: "Czechia", capital: "Prague", region: europe)
            stateCreate(name: "Denmark", capital: "Copenhagen", region: europe)
            stateCreate(name: "Estonia", capital: "Tallinn", region: europe)
            stateCreate(name: "Finland", capital: "Helsinki", region: europe)
            stateCreate(name: "France", capital: "Paris", region: europe)
            stateCreate(name: "Georgia", capital: "Tbillisi", region: europe)
            stateCreate(name: "Germany", capital: "Berlin", region: europe)
            stateCreate(name: "Greece", capital: "Athens", region: europe)
            stateCreate(name: "Hungary", capital: "Budapest", region: europe)
            stateCreate(name: "Iceland", capital: "Reykjavik", region: europe)
            stateCreate(name: "Ireland", capital: "Dublin", region: europe)
            stateCreate(name: "Italy", capital: "Rome", region: europe)
            stateCreate(name: "Kazakhstan", capital: "Nur-Sultan", region: europe)
            stateCreate(name: "Kosovo", capital: "Pristina", region: europe)
            stateCreate(name: "Latvia", capital: "Riga", region: europe)
            stateCreate(name: "Liechtenstein", capital: "Vaduz", region: europe)
            stateCreate(name: "Lithuania", capital: "Vilnius", region: europe)
            stateCreate(name: "Luxembourg", capital: "Luxembourg", region: europe)
            stateCreate(name: "Malta", capital: "Valletta", region: europe)
            stateCreate(name: "Moldova", capital: "Chisinau", region: europe)
            stateCreate(name: "Monaco", capital: "Monaco", region: europe)
            stateCreate(name: "Montenegro", capital: "Podgorica", region: europe)
            stateCreate(name: "Netherlands", capital: "Amsterdam", region: europe)
            stateCreate(name: "North Macedonia", capital: "Skopje", region: europe)
            stateCreate(name: "Norway", capital: "Oslo", region: europe)
            stateCreate(name: "Poland", capital: "Warsaw", region: europe)
            stateCreate(name: "Portugal", capital: "Lisbon", region: europe)
            stateCreate(name: "Romania", capital: "Bucharest", region: europe)
            stateCreate(name: "Russia", capital: "Moscow", region: europe)
            stateCreate(name: "San Marino", capital: "San Marino", region: europe)
            stateCreate(name: "Serbia", capital: "Belgrade", region: europe)
            stateCreate(name: "Slovakia", capital: "Bratislava", region: europe)
            stateCreate(name: "Slovenia", capital: "Ljubljana", region: europe)
            stateCreate(name: "Spain", capital: "Madrid", region: europe)
            stateCreate(name: "Sweden", capital: "Stockholm", region: europe)
            stateCreate(name: "Switzerland", capital: "Bern", region: europe)
            stateCreate(name: "Turkey", capital: "Ankara", region: europe)
            stateCreate(name: "Ukraine", capital: "Kyiv", region: europe)
            stateCreate(name: "United Kingdom", capital: "London", region: europe)
            stateCreate(name: "Vatican City (Holy See)", capital: "Vatican City", region: europe)
            
            stateCreate(name: "Argentina", capital: "Buenos Aires", region: south_america)
            stateCreate(name: "Bolivia", capital: "Sucre", region: south_america)
            stateCreate(name: "Brazil", capital: "Brasilia", region: south_america)
            stateCreate(name: "Chile", capital: "Santiago", region: south_america)
            stateCreate(name: "Colombia", capital: "Bogotá", region: south_america)
            stateCreate(name: "Ecuador", capital: "Quito", region: south_america)
            stateCreate(name: "Guyana", capital: "Georgetown", region: south_america)
            stateCreate(name: "Paraguay", capital: "Asunción", region: south_america)
            stateCreate(name: "Peru", capital: "Lima", region: south_america)
            stateCreate(name: "Suriname", capital: "Paramaribo", region: south_america)
            stateCreate(name: "Uruguay", capital: "Montevideo", region: south_america)
            stateCreate(name: "Venezuela", capital: "Caracas", region: south_america)
            stateCreate(name: "French Guiana", capital: "Cayenne", region: south_america)
            stateCreate(name: "Falkland Islands", capital: "Stanley", region: south_america)

            print("Did redo ?")
 
        }
        
        //how many rows
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return regions.count
        }


        
        //what is in cell
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell()

            // Configure the cell...
            print("Table view loading ?")
            
            let region = regions[indexPath.row]
            
            
            cell.textLabel?.text = region.name

            
            
            return cell
            }
        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
               let selectedRegionTest = regions[indexPath.row]
            
            audioPlayer.play()
                
               performSegue(withIdentifier: "startTest", sender: selectedRegionTest)
           }

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let DeVC = segue.destination as! RegionInfoViewController
            let selectedRegionTest = sender as! Region
            DeVC.myRegion = selectedRegionTest
        }
        
    @IBAction func home(_ sender: Any) {
        audioPlayer.play()
        
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as! [UIViewController];

               for aViewController in viewControllers {
                   if(aViewController is StartScreenViewController){
                        self.navigationController!.popToViewController(aViewController, animated: true);
                   }
               }
        
    }
    
    }


