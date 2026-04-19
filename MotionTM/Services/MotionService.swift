//
//  MotionService.swift
//  MotionTM
//
//  Created by Tatiana6mo on 4/7/26.
//

import Foundation
import CoreMotion

class MotionService {
    
    //Access coremotion class
    private let motionManager: CMMotionManager = CMMotionManager()
    
    func startGettingValues(
        onGyro:@escaping(Double,Double,Double)-> Void,
        onAccel:@escaping(Double,Double,Double)-> Void
        
    ){
        
        if self.motionManager.isAccelerometerAvailable == true {
            
            // 10 times per second updates
            self.motionManager.accelerometerUpdateInterval = 0.1
            
            
            // CALL BACK FUNC THAT HANDLE ACC, FOR DATA AND ERRORS
            let accelHandler:(CMAccelerometerData?,Error?) -> Void = { data, error in
                // DATA UNWRAPING
                if let safeData:CMAccelerometerData = data {
                    let x:Double = safeData.acceleration.x
                    let y:Double = safeData.acceleration.y
                    let z:Double = safeData.acceleration.z
                    
                    // trigger the call OF FUNC
                        onAccel(x,y,z)
                    }
                    
                }
            self.motionManager.startAccelerometerUpdates(to: .main, withHandler: accelHandler)
            
            
             }
             // is Sensor a
        if motionManager.isGyroAvailable == true {
            
            self.motionManager.gyroUpdateInterval = 0.1
            
            self.motionManager.startGyroUpdates(to: .main, withHandler: {(data,error ) in
                
                
                // if new data is here make sure is "safe" that means we make sure
                //that there is data before calculating or doing something with it
                // in out case
                if let safeData:CMGyroData = data {
                    let x:Double = safeData.rotationRate.x
                    let y:Double = safeData.rotationRate.y
                    let z:Double = safeData.rotationRate.z
                    onGyro(x,y,z)
                }
                
            })
            
        }
            
        
            
    }
    func stop(){
        self.motionManager.stopAccelerometerUpdates()
        self.motionManager.stopGyroUpdates()
    }
            
}



