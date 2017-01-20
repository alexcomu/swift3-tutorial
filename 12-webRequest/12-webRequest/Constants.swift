//
//  Constants.swift
//  12-webRequest
//
//  Created by Alex Comunian on 19/01/17.
//  Copyright © 2017 Alex Comunian. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let BASE_URL_FORECAST = "http://api.openweathermap.org/data/2.5/forecast/daily?cnt=10&mode=json&"
let LATITUDE = "lat=\(Location.sharedInstance.latitude!)"
let LONGITUDE = "&lon=\(Location.sharedInstance.longitude!)"
let APP_ID = "&appid="
let API_KEY = "YOUR-APP-ID"

typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)\(LONGITUDE)\(APP_ID)\(API_KEY)"
let FOREACAST_WEATHER_URL = "\(BASE_URL_FORECAST)\(LATITUDE)\(LONGITUDE)\(APP_ID)\(API_KEY)"


