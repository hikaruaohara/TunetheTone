//
//  PlayViewModel.swift
//  ColorMatch
//
//  Created by 青原光 on 2022/10/16.
//

import Foundation
class PlayViewModel: ObservableObject {
    @Published var correctColor = (red: 0.0, green: 0.0, blue: 0.0)
    @Published var userColor = (red: 0.0, green: 0.0, blue: 0.0)
}
