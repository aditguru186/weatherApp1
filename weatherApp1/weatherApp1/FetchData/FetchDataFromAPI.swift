//
//  File.swift
//  weatherApp1
//
//  Created by Aditya Guru on 18/09/21.
//

import Foundation

class FetchDataFromAPI{
    var API_key = "fae7190d7e6433ec3a45285ffcf55c86", city = "hyderabad"
    
    struct currentWeatherData:Codable{
        var coord:coordinates?
        var weather:weatherData?
        var mainData:mainData?
    }
    struct coordinates:Codable {
        var lat:String?
        var lon:String?
    }
    struct weatherData:Codable{
        var id:String?
        var main:String?
        var description:String?
    }
    struct mainData:Codable{
        var temp:Int?
        var feels_like:Int?
    }
    struct Demo_data:Codable{
        var title:String?
        var description:String?
    }
    
    init(_ cityAssigned:String){
        city = cityAssigned
    }
    func readLocalFile(forName name:String)->Data?{
        do{
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8){
                return jsonData
                
               }
        }
        catch{
            print(error)
        }
        return nil
    }
     func parseJSON(jsonData:Data)->Demo_data?{
        do{
            let decodedData:Demo_data = try JSONDecoder().decode(Demo_data.self, from: jsonData)
            return decodedData
        }
        catch{
            print(error)
        }
        return nil
    }
    
    func getDetails()->String{
        var deets:String?
        deets = ""
        var urlStr:String = "api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}"
        urlStr = urlStr.replacingOccurrences(of: "{city name}", with: city)
        urlStr = urlStr.replacingOccurrences(of: "{API key}", with: API_key)
        
        return deets!
    }
}
