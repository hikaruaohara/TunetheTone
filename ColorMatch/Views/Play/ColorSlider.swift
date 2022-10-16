//
//  ColorSlider.swift
//  ColorMatch
//
//  Created by 青原光 on 2022/10/16.
//

import SwiftUI

struct ColorSlider: View {
    @EnvironmentObject var model: PlayViewModel
    
    let color: String
    
    var body: some View {
        HStack {
            Spacer()
            if color == "red" {
                Circle()
                    .foregroundColor(.red)
                    .frame(width: 20)
                Spacer()
                Slider(value: $model.userColor.red, in: 0 ... 255, step: 1)
                    .accentColor(.red)
                Spacer()
                Text(String(format: "%.0f", model.userColor.red))
                    .frame(width: 40)
                    .foregroundColor(.red)
            } else if color == "green" {
                Circle()
                    .foregroundColor(.green)
                    .frame(width: 20)
                Spacer()
                Slider(value: $model.userColor.green, in: 0 ... 255, step: 1)
                    .accentColor(.green)
                Spacer()
                Text(String(format: "%.0f", model.userColor.green))
                    .frame(width: 40)
                    .foregroundColor(.green)
            } else if color == "blue" {
                Circle()
                    .foregroundColor(.blue)
                    .frame(width: 20)
                Spacer()
                Slider(value: $model.userColor.blue, in: 0 ... 255, step: 1)
                    .accentColor(.blue)
                Spacer()
                Text(String(format: "%.0f", model.userColor.blue))
                    .frame(width: 40)
                    .foregroundColor(.blue)
            }
            Spacer()
        }
    }
}

struct ColorSlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorSlider(color: "red")
            .environmentObject(PlayViewModel())
    }
}
