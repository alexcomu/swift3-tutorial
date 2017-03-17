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
        let currentStatus =  healthStore.authorizationStatus(for: stepsToRead)
        switch currentStatus {
        case .notDetermined:
            print("NOT DETERMINED")
        case .sharingDenied:
            print("DENIED")
        case .sharingAuthorized:
            print("AUTHORIZED")
        }
        
        if HKHealthStore.isHealthDataAvailable() {
            healthStore.requestAuthorization(toShare: nil, read: readDataTypes, completion: completion)
            //getSteps(stepsToRead: stepsToRead)
        }else{
            print("NO ACCESS")
        }
        
        
        
    }
    
    func getSteps(stepsToRead: HKQuantityType){
        
        
        //        let stepQuery = HKSampleQuery(sampleType: stepsToRead, predicate: nil, limit: 5, sortDescriptors: nil)
        //        {(query, results, error) in
        //            if let results = results as? [HKQuantitySample]{
        //                print(results)
        //            }
        //        }
        //        healthStore.execute(stepQuery)
        
        
        let calendar = Calendar.current
        var interval = DateComponents()
        interval.day = 1
        
        // Set the anchor date to 7 days ago.
        var anchorComponents = calendar.dateComponents([.day, .month, .year, .hour], from: NSDate() as Date)
        print(anchorComponents)
        let offset: Int = -7
        anchorComponents.day! += offset
        anchorComponents.hour = 0
        print(anchorComponents)
        
        guard let anchorDate = calendar.date(from: anchorComponents) else {
            fatalError("*** unable to create a valid date from the given components ***")
        }
        guard let quantityType = HKObjectType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount) else{
            fatalError("*** Unable to create a step count type ***")
        }
        
        // Create the query
        let query = HKStatisticsCollectionQuery(quantityType: quantityType,
                                                quantitySamplePredicate: nil,
                                                options: .cumulativeSum,
                                                anchorDate: anchorDate,
                                                intervalComponents: interval as DateComponents)
        
        // Set the results handler
        query.initialResultsHandler = {
            query, results, error in
            
            guard let statsCollection = results else {
                // Perform proper error handling here
                fatalError("*** An error occurred while calculating the statistics: \(String(describing: error?.localizedDescription)) ***")
            }
            
            let endDate = Date()
            
            guard let startDate = calendar.date(byAdding: .day, value: offset, to: endDate) else{
                fatalError("*** Unable to calculate the start date ***")
            }
        
            
            // Print the daily step counts over the past 7 days
            statsCollection.enumerateStatistics(from: startDate, to: endDate) { statistics, stop in
                if let quantity = statistics.sumQuantity() {
                    let steps = quantity.doubleValue(for: HKUnit.count())
                    print("\(Int(round(steps))) --> \(steps)")
                    
                }
            }
        }
        
        healthStore.execute(query)
        
    }
    
}

