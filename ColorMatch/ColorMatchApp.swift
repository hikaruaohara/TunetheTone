//
//  ColorMatchApp.swift
//  ColorMatch
//
//  Created by 青原光 on 2022/10/16.
//

import SwiftUI

@main
struct ColorMatchApp: App {
    @StateObject var model = Model()
    @StateObject var playViewModel = PlayModel()
    
    var body: some Scene {
        WindowGroup {
            VStack {
                switch model.presentation {
                case 0:
                    PlayView()
                case 1:
                    ResultView()
                default:
                    Text("error")
                }
            }
            .environmentObject(model)
            .environmentObject(playViewModel)
        }
    }
}
