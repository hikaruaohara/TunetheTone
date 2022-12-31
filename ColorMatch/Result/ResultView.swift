//
//  ResultView.swift
//  ColorMatch
//
//  Created by 青原光 on 2022/10/17.
//

import SwiftUI

struct ResultView: View {
    @EnvironmentObject var model: Model
    @EnvironmentObject var playModel: PlayModel
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    AnswerCell(target: .correct)
                        .frame(maxWidth: UIScreen.main.bounds.width / 2)
                    
                    Spacer()
                    
                    AnswerCell(target: .user)
                        .frame(maxWidth: UIScreen.main.bounds.width / 2)
                    
                    Spacer()
                }                
                
                (Text(String(format: "%.1f%% ", playModel.getMatchingRate())).foregroundColor(.yellow) + Text(" Matched!!"))
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .bold()
                
                Spacer()
                Spacer()
                Spacer()
                
                Button("Next") {
                    playModel.correctColor = (0, 0, 0)
                    playModel.userColor = (0, 0, 0)
                    model.presentation = 0
                }
                .foregroundColor(.white)
                .font(.largeTitle)
                .bold()
                
                Spacer()
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
            .environmentObject(PlayModel())
    }
}
