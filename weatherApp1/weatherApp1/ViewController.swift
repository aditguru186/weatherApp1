//
//  ViewController.swift
//  weatherApp1
//
//  Created by Aditya Guru on 18/09/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var textView1:UITextView?
    @IBOutlet var btnLoadLocalJSON:UIButton?
    @IBOutlet var btnLoadFromAPI:UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
       
    
    }

    @IBAction func fetchJSONDetailsFromLocal(_ sender: Any) {
        ///Reading and parsing json from local bundle
        let fetchData:FetchDataFromAPI = FetchDataFromAPI("Hyderabad")
        let localJSONData = fetchData.readLocalFile(forName: "demo")
        let jsonData = fetchData.parseJSON(jsonData: localJSONData!)
        let stringToBeShown = "Title : \(jsonData!.title ?? "")\nDescription : \(jsonData!.description ?? "JSON Not Found")"
        ///
        textView1!.text = stringToBeShown
    }
    @IBAction func fetchWeatherDetailsFromAPI(_ sender: Any) {
        let fetchData:FetchDataFromAPI = FetchDataFromAPI("Hyderabad")
        textView1?.text = fetchData.getDetails()
    }
    
}

