//
//  AnswerCell.swift
//  ColorMatch
//
//  Created by 青原光 on 2022/10/18.
//

import SwiftUI

struct AnswerCell: View {
    @EnvironmentObject var playModel: PlayModel
    let target: String
    
    var body: some View {
        let colors = target == "correct" ? playModel.correctColor : playModel.userColor
        let title = target == "correct" ? "Correct\nAnswer" : "Your\nAnswer"

        VStack {
            Spacer()
            Text(title)
                .multilineTextAlignment(.center)
                .font(.largeTitle)
                .foregroundColor(.white)
            
            Spacer()
            
            Circle()
                .foregroundColor(Color(red: colors.red / 255, green: colors.green / 255, blue: colors.blue / 255))
            
            Spacer()
            
            HStack {
                Circle()
                    .foregroundColor(.red)
                    .frame(width: 20)
                
                Text(String(format: "%.0f", colors.red))
                    .foregroundColor(.red)
                    .frame(width: 40)
            }
                            
            HStack {
                Circle()
                    .foregroundColor(.green)
                    .frame(width: 20)
                
                Text(String(format: "%.0f", colors.green))
                    .foregroundColor(.green)
                    .frame(width: 40)
            }
                            
            HStack {
                Circle()
                    .foregroundColor(.blue)
                    .frame(width: 20)
                
                Text(String(format: "%.0f", colors.blue))
                    .foregroundColor(.blue)
                    .frame(width: 40)
            }
            
            Spacer()
        }
        .bold()
    }
}

struct AnserCell_Previews: PreviewProvider {
    static var previews: some View {
        AnswerCell(target: "correct")
            .environmentObject(PlayModel())
    }
}
