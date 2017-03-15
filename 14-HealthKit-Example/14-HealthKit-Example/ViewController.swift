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
        let stepsToRead = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!
        let readDataTypes: Set<HKObjectType> = [stepsToRead]
        
        let completion: ((Bool, Error?) -> Void)! = {
            (success, error) -> Void in
            print(success)
            if success{
                self.getSteps(stepsToRead: stepsToRead)
            }else{
                print(error?.localizedDescription as Any)
            }
            
        }
        
        healthStore.requestAuthorization(toShare: nil, read: readDataTypes, completion: completion)
        getSteps(stepsToRead: stepsToRead)
    }

    func getSteps(stepsToRead: HKQuantityType){
        
        
//        let yesterday: NSDate = NSDate().addingTimeInterval(-7*24*60*60)
//        let today: NSDate = NSDate()
//        
//        //   Get the start of the day
//        let date = NSDate()
//        let cal = Calendar(identifier: Calendar.Identifier.gregorian)
//        let newDate = cal.startOfDay(for: date as Date)
//        
//        //  Set the Predicates & Interval
//        let predicate = HKQuery.predicateForSamples(withStart: newDate as Date, end: NSDate() as Date, options: .strictStartDate)
//        let interval: NSDateComponents = NSDateComponents()
//        interval.day = 7
//        
//        
//        let query = HKStatisticsCollectionQuery(quantityType: stepsToRead, quantitySamplePredicate: predicate, options: [.cumulativeSum], anchorDate: newDate as Date, intervalComponents:interval as DateComponents)
//        
//        query.initialResultsHandler = { query, result, error in
//            
//            if error != nil{
//                return
//            }
//            
//            if let myResults = result{
//                myResults.enumerateStatistics(from: yesterday as Date, to: today as Date){
//                    statistics, stop in
//                    
//                    if let quantity = statistics.sumQuantity(){
//                        let steps = quantity.doubleValue(for: HKUnit.count())
//                        
//                        print("Steps: \(steps)")
//                    }
//                        
//                }
//            }
//        
//        }
//        healthStore.execute(query)
        
        
        
        let stepQuery = HKSampleQuery(sampleType: stepsToRead, predicate: nil, limit: 5, sortDescriptors: nil)
        {(query, results, error) in
            if let results = results as? [HKQuantitySample]{
                print(results)
            }
        }
        healthStore.execute(stepQuery)
    }

}

