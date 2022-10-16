//
//  PlayView.swift
//  ColorMatch
//
//  Created by 青原光 on 2022/10/16.
//

import SwiftUI

struct PlayView: View {
    @EnvironmentObject var model: PlayViewModel
    @State private var count = 15
    @State private var isEnabled = true
    
    var body: some View {
        if !model.didFinish {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack {
                    Text("\(count)")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    HStack {
                        Circle()
                            .foregroundColor(Color(red: model.correctColor.red / 255, green: model.correctColor.green / 255, blue: model.correctColor.blue / 255))
                        
                        Circle()
                            .foregroundColor(Color(red: model.userColor.red / 255, green: model.userColor.green / 255, blue: model.userColor.blue / 255))
                    }
                    
                    Spacer()
                    
                    Button() {
                        isEnabled.toggle()
                        
                        model.correctColor = (Double(Int.random(in: 0...255)), Double(Int.random(in: 0...255)), Double(Int.random(in: 0...255)))
                        model.userColor = (0, 0, 0)
                        
                        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                            count -= 1
                            if count <= 0 {
                                model.didFinish.toggle()
                                timer.invalidate()
                                count = 15
                                isEnabled.toggle()                            
                            }
                        }
                    } label: {
                        Text("Start")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                            .opacity(isEnabled ? 1 : 0.5)
                    }
                    .disabled(!isEnabled)
                    
                    Spacer()
                    
                    ColorSlider(color: "red")
                    ColorSlider(color: "green")
                    ColorSlider(color: "blue")
                    
                    Spacer()
                }
            }
        } else {
            ResultView()
        }
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
            .environmentObject(PlayViewModel())
    }
}
