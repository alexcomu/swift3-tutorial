//
//  ViewController.swift
//  14-HealthKit-Example
//
//  Created by Alex Comunian on 15/03/17.
//  Copyright © 2017 Hackademy. All rights reserved.
//

import UIKit
import HealthKit
import CoreLocation


class ViewController: UIViewController {
    
    let healthStore: HKHealthStore = HKHealthStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        HealthManager.Instance().askForAuthorization(){ success in
            if success{
                HealthManager.Instance().getLastSevenDaysSteps(){ success, steps in
                    print(success)
                    print(steps)
                }
            }
        }
    }
}

