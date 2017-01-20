//
//  Location.swift
//  12-webRequest
//
//  Created by Alex Comunian on 20/01/17.
//  Copyright © 2017 Alex Comunian. All rights reserved.
//

import Foundation
import CoreLocation

// Singleton Class
class Location{
    static var sharedInstance = Location()
    private init() {}
    
    var latitude: Double!
    var longitude: Double!
}
