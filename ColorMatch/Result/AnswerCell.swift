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
        if target == "correct" {
            VStack {
                Spacer()
                
                Text("Correct Answer")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Spacer()
                
                Circle()
                    .foregroundColor(Color(red: playModel.correctColor.red / 255, green: playModel.correctColor.green / 255, blue: playModel.correctColor.blue / 255))
                
                Spacer()
                
                HStack {
                    Circle()
                        .foregroundColor(.red)
                        .frame(width: 20)
                    
                    Text(String(format: "%.0f", playModel.correctColor.red))
                        .foregroundColor(.red)
                        .frame(width: 40)
                }
                                
                HStack {
                    Circle()
                        .foregroundColor(.green)
                        .frame(width: 20)
                    
                    Text(String(format: "%.0f", playModel.correctColor.green))
                        .foregroundColor(.green)
                        .frame(width: 40)
                }
                                
                HStack {
                    Circle()
                        .foregroundColor(.blue)
                        .frame(width: 20)
                    
                    Text(String(format: "%.0f", playModel.correctColor.blue))
                        .foregroundColor(.blue)
                        .frame(width: 40)
                }
                
                Spacer()
            }
            .bold()
        } else if target == "user" {
            VStack {
                Spacer()
                
                Text("Your Answer")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .bold()
                
                Spacer()
                
                Circle()
                    .foregroundColor(Color(red: playModel.userColor.red / 255, green: playModel.userColor.green / 255, blue: playModel.userColor.blue / 255))
                
                Spacer()
                
                HStack {
                    Circle()
                        .foregroundColor(.red)
                        .frame(width: 20)
                    
                    Text(String(format: "%.0f", playModel.userColor.red))
                        .foregroundColor(.red)
                        .frame(width: 40)
                }
                
                HStack {
                    Circle()
                        .foregroundColor(.green)
                        .frame(width: 20)
                    
                    Text(String(format: "%.0f", playModel.userColor.green))
                        .foregroundColor(.green)
                        .frame(width: 40)
                }
                
                HStack {
                    Circle()
                        .foregroundColor(.blue)
                        .frame(width: 20)
                    
                    Text(String(format: "%.0f", playModel.userColor.blue))
                        .foregroundColor(.blue)
                        .frame(width: 40)
                }
                
                Spacer()
            }
            .bold()
        }
    }
}

struct AnserCell_Previews: PreviewProvider {
    static var previews: some View {
        AnswerCell(target: "correct")
            .environmentObject(PlayModel())
    }
}
