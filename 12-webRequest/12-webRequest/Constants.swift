//
//  Constants.swift
//  12-webRequest
//
//  Created by Alex Comunian on 19/01/17.
//  Copyright © 2017 Alex Comunian. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "e845942df829527b0be197403abd2533"


typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)45.11\(LONGITUDE)7.75\(APP_ID)\(API_KEY)"

