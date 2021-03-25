//
//  ContentView.swift
//  Shared
//
//  Created by Christopher Garcia on 3/23/21.
//

import SwiftUI
import HealthKit
import HealthKitUI

func fetchHealthData() -> Void {
    let healthStore = HKHealthStore()
    
    if HKHealthStore.isHealthDataAvailable() {
        //.. do health data things
        let readData = Set([HKObjectType.quantityType(forIdentifier: .bloodGlucose)!])
        
        healthStore.getRequestStatusForAuthorization(toShare: [], read: readData)
    }
    else {
        print("No health data available")
    }
}

struct ContentView: View {
    var body: some View {
        Button(action: fetchHealthData) {
            Text("fetch()")
                .bold()
                .font(.largeTitle)
                .foregroundColor(.white)
        }
        .frame(width:140, height:80)
        .background(Color.black)
        .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
