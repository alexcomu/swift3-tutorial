//
//  Forecast.swift
//  12-webRequest
//
//  Created by Alex Comunian on 20/01/17.
//  Copyright © 2017 Alex Comunian. All rights reserved.
//

import UIKit
import Alamofire

class Forecast{
    
    var _date: String!
    var _weatherType: String!
    var _highTemp: String!
    var _lowTemp: String!
    
    var date: String!{
        if _date == nil{
            _date = ""
        }
        return _date
    }
    
    var weatherType: String!{
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }
    
    var highTemp: String!{
        if _highTemp == nil{
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp: String!{
        if _lowTemp == nil{
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    init(weatherDict: Dictionary<String, AnyObject>){
        if let temp = weatherDict["temp"] as? Dictionary<String, AnyObject>{
            if let minTemp = temp["min"] as? Double{
                self._lowTemp = "\(Double(round((1000*(minTemp-273))/1000)))"
            }
            if let maxTemp = temp["max"] as? Double{
                self._highTemp = "\(Double(round((1000*(maxTemp-273))/1000)))"
            }
        }
        
        if let weather = weatherDict["weather"] as? [Dictionary<String, AnyObject>]{
            if let wtype = weather[0]["main"] as? String{
                self._weatherType = wtype
            }
        }
        
        if let date = weatherDict["dt"] as? Double{
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeek()
        }
    }
    
}


extension Date{
    func dayOfTheWeek() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}







