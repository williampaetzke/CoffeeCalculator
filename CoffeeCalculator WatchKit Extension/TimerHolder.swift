//
//  TimerHolder.swift
//  CoffeeCalculator WatchKit Extension
//
//  Created by Bill Paetzke on 2/11/20.
//  Copyright © 2020 Bill Paetzke. All rights reserved.
//

import Foundation

class TimerHolder : ObservableObject {
    var timer : Timer!
    @Published var count = -3
    @Published var isRunning = false
    @Published var startDate : Date? = nil
    
    func start() {
        timer?.invalidate()
        
        count = -3
        startDate = Date().addingTimeInterval(3)
        /*self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            _ in
            self.count += 1
        }*/
        timer = Timer(timeInterval: 1, repeats: true) {
            _ in
            self.count += 1
        }
        RunLoop.current.add(timer, forMode: .common)
        isRunning = true
    }
    
    func stop() {

        timer?.invalidate()
        isRunning = false
    }
    
    func reset() {
        startDate = nil
    }
}