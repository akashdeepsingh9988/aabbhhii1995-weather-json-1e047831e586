//
//  ViewController.swift
//  AFStarter
//
//  Created by parrot on 2018-11-13.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON 


class ViewController: UIViewController {
    
    // MARK: OUTLETS
    // -----------------------
    
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var rainChanceLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func weatherButtonPressed(_ sender: Any) {
        print("Get weather Button pressed")
        
        // go to the url
        let URL = "https://api.darksky.net/forecast/b3e8194ffdcd710e0b10398f88c49063/43.6532,-79.3832?units=ca"
        
        // get data from the website
        Alamofire.request(URL, method:.get, parameters:nil).responseJSON {
            (response) in
            
            //will send a huge data
            if (response.result.isSuccess){
                print("I got something from the weather website")
                print("Response from website:")
                print("===========")
                print(response.data)
                
                // see what is in the data
                do{
                    let json = try JSON(data: response.data!)
                    //print(json)
                    
                    print("Latitude: \(json["latitude"])")
                    print("Longitude: \(json["longitude"])")
                    print("Temperature: \(json["currently"]["temperature"])")
                    
//                    let date = Date(timeIntervalSince1970: 1542381864)
//                    let dateFormatter = DateFormatter()
//                    DateFormatter.timeStyle = DateFormatter.Style.medium
//                    DateFormatter.dateStyle = DateFormatter.Style.medium
//                    let localDate = dateFormatter.string(from: date)
//                    print(localDate)
                    
                    self.tempLabel.text = "\(json["currently"]["temperature"])°C"
                    self.conditionLabel.text = "\(json["currently"]["summary"])"
                    self.rainChanceLabel.text = "\(json["currently"]["precipProbability"])%"
                    self.windSpeedLabel.text = "\(json["currently"]["windSpeed"])km/h"
                    self.humidityLabel.text = "\(json["currently"]["humidity"])%"
                    
                    
                    
                    
                    
                    
                }
                catch{
                    print("Error parsing the data")
                }
            }
            else{
                print("Error getting data from website")
            }
        }
        // parse the data you need
        
        // go something with the data
    }
    
}

