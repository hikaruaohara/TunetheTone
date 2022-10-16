//
//  ContentView.swift
//  ColorMatch
//
//  Created by 青原光 on 2022/10/16.
//

import SwiftUI

struct ContentView: View {    
    var body: some View {
        PlayView()
            .environmentObject(PlayViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
