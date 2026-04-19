//
//  MotionViewModel.swift
//  MotionTM
//
//  Created by Tatiana6mo on 4/7/26.
//

import Foundation
import Combine


class MotionViewModel: ObservableObject {
    
    // backgroundColor
    @Published var backgroundColor: Color = .white
    
    // update values for accl
    @Published var accelX: Double = 0
    @Published var accelY: Double = 0
    @Published var accelZ: Double = 0
    
    
    // update values for gyro
    @Published var gyroX: Double = 0
    @Published var gyroY: Double = 0
    @Published var gyroZ: Double = 0
    
    
    @Published var isRunning: Bool = false
    
    
    var motion:MotionService = MotionService()
    
    func start(){
        if isRunning == true {
            return
        }
        
        motion.startGettingValues(onGyro: {(x:Double, y:Double, z:Double) in
            self.gyroX = x
            self.gyroY = y
            self.gyroZ = z
            
        }, onAccel:{(x:Double, y:Double, z:Double) in
            self.accelX = x
            self.accelY = y
            self.accelZ = z
            
        })
    }
    
    func stop(){
        motion.stop()
        isRunning = false
    }
    
    func almostLeveled() -> String {
        let xAbs = abs(accelX)
        let yAbs = abs(accelY)
        let zAbs = abs(accelZ)
        
        if xAbs < 0.10 && yAbs < 0.10{
            return "Almost leveled"
        } else {
            return "Not leveled"
        }
    }
    
    //Create a color background base 0n accel data
    func updateColorBasedOnTilt(CMAccelerometerData) {
        let x = data.acceleration.x
        let y = data.acceleration.y
        
        if abs(x) > abs(y) {
            if x > 0 {
                view.backgroundColor = UIColor.red
            } else {
                view.backgroundColor = UIColor.blue
                }
        } else {
            if y > 0 {
                view.backgroundColor = UIColor.green
            } else {
                View.backgroundColor = UIColor.yellow
                
            }
        }
        
    }
        
        // Stop Update
        func viewDidDisappear(_ animated: Bool) {
            super.viewDidDisappear(animated)
            motionManager.stopAccelerometerUpdates()
    }
    
    
    
    
}
    
    


