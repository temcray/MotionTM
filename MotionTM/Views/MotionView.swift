//
//  MotionView.swift
//  MotionTM
//
//  Created by Tatiana6mo on 4/7/26.
//

import SwiftUI

struct MotionView: View {
    
    @StateObject var viewModel: MotionViewModel = MotionViewModel()
    
    var body: some View {
        VStack(spacing:20){
            Button{
                viewModel.start()
            }label:{
                Text("Start").frame(maxWidth:200)
            }.buttonStyle(.borderedProminent).padding()
            
            Button{
                viewModel.stop()
            }label:{
                Text("Stop").frame(maxWidth:200)
            }.buttonStyle(.bordered)
            
            
            VStack(spacing: 10){
                Text("ACCELEROMETER")
                Text("X: "+String(format: "%.4f",viewModel.accelX))
                Text("Y: "+String(format: "%.4f",viewModel.accelY))
                Text("Z: "+String(format: "%.4f",viewModel.accelZ))
            }.padding()
            
            VStack(spacing: 10){
                Text("GYROSCOPE")
                Text("X: "+String(format: "%.4f",viewModel.gyroX))
                Text("Y: "+String(format: "%.4f",viewModel.gyroY))
                Text("Z: "+String(format: "%.4f",viewModel.gyroZ))
            }.padding()
            
            Spacer()
        }
        
    }
}

#Preview {
    MotionView()
}
