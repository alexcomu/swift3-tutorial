//
//  HealthManager.swift
//  14-HealthKit-Example
//
//  Created by Alex Comunian on 17/03/17.
//  Copyright © 2017 Hackademy. All rights reserved.
//

import Foundation
import HealthKit

public typealias HealthComplete = (Bool) -> Void
public typealias StepsComplete = (Bool, [Int]) -> ()

// Singleton
public class HealthManager
{
    static let instance : HealthManager = HealthManager()
    var healthStore: HKHealthStore
    
    private init() {
        print("INIT")
        self.healthStore = HKHealthStore()
    }
    
    public static func Instance() -> HealthManager {
        return instance
    }
    
    public func askForAuthorization(completed: @escaping HealthComplete){
        let stepsToRead = HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount)!
        let readDataTypes: Set<HKObjectType> = [stepsToRead]
        
        let completion: ((Bool, Error?) -> Void)! = {
            (success, error) -> Void in
            if success{
                completed(success)
            }else{
                print(error?.localizedDescription as Any)
                completed(false)
            }
        }
        
        if HKHealthStore.isHealthDataAvailable() {
            self.healthStore.requestAuthorization(toShare: nil, read: readDataTypes, completion: completion)
        }else{
            print("NO ACCESS")
            completed(false)
        }
    }
    
    
    public func getLastSevenDaysSteps(completed: @escaping StepsComplete){
        var stepsList: [Int] = []        
        let calendar = Calendar.current
        var interval = DateComponents()
        let dasyAgo: Int = -7
        let offset: Int = -6
        interval.day = 1
        
        // Set the anchor date to 7 days ago.
        var anchorComponents = calendar.dateComponents([.day, .month, .year, .hour], from: NSDate() as Date)
        anchorComponents.day! += offset
        anchorComponents.hour = 0
        
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
            
            guard let startDate = calendar.date(byAdding: .day, value: dasyAgo, to: endDate) else{
                fatalError("*** Unable to calculate the start date ***")
            }
            
            
            // Print the daily step counts over the past 7 days
            statsCollection.enumerateStatistics(from: startDate, to: endDate) { statistics, stop in
                
                if let quantity = statistics.sumQuantity() {
                    let steps = quantity.doubleValue(for: HKUnit.count())
                    stepsList.append(Int(round(steps)))
                    if stepsList.count == 7{
                        completed(true, stepsList)
                    }
                }
            }
        }
        self.healthStore.execute(query)
    }
}

