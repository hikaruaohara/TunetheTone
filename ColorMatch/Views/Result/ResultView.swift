//
//  ResultView.swift
//  ColorMatch
//
//  Created by 青原光 on 2022/10/17.
//

import SwiftUI

struct ResultView: View {
    @EnvironmentObject var playViewModel: PlayViewModel
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                HStack {
                    VStack {
                        Text("Corect Answer")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .bold()
                        
                        Circle()
                            .foregroundColor(Color(red: playViewModel.correctColor.red / 255, green: playViewModel.correctColor.green / 255, blue: playViewModel.correctColor.blue / 255))
                        
                        HStack {
                            Circle()
                                .foregroundColor(.red)
                                .frame(width: 20)
                            
                            Text(String(format: "%.0f", playViewModel.correctColor.red))
                                .foregroundColor(.white)
                                .frame(width: 40)
                        }
                        
                        HStack {
                            Circle()
                                .foregroundColor(.green)
                                .frame(width: 20)
                            
                            Text(String(format: "%.0f", playViewModel.correctColor.green))
                                .foregroundColor(.white)
                                .frame(width: 40)
                        }
                        
                        HStack {
                            Circle()
                                .foregroundColor(.blue)
                                .frame(width: 20)
                            
                            Text(String(format: "%.0f", playViewModel.correctColor.blue))
                                .foregroundColor(.white)
                                .frame(width: 40)
                        }
                    }
                    
                    VStack {
                        Text("Your Answer")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .bold()
                        
                        Circle()
                            .foregroundColor(Color(red: playViewModel.userColor.red / 255, green: playViewModel.userColor.green / 255, blue: playViewModel.userColor.blue / 255))
                        
                        HStack {
                            Circle()
                                .foregroundColor(.red)
                                .frame(width: 20)
                            
                            Text(String(format: "%.0f", playViewModel.userColor.red))
                                .foregroundColor(.white)
                                .frame(width: 40)
                        }
                        
                        HStack {
                            Circle()
                                .foregroundColor(.green)
                                .frame(width: 20)
                            
                            Text(String(format: "%.0f", playViewModel.userColor.green))
                                .foregroundColor(.white)
                                .frame(width: 40)
                        }
                        
                        HStack {
                            Circle()
                                .foregroundColor(.blue)
                                .frame(width: 20)
                            
                            Text(String(format: "%.0f", playViewModel.userColor.blue))
                                .foregroundColor(.white)
                                .frame(width: 40)
                        }
                    }
                }
                
                Spacer()
                
                Text(String(format: "Score: %.0f", fabs(playViewModel.correctColor.red - playViewModel.userColor.red) + fabs(playViewModel.correctColor.green - playViewModel.userColor.green) + fabs(playViewModel.correctColor.blue - playViewModel.userColor.blue)))
                    .foregroundColor(.white)
                    .font(.largeTitle)
                
                Spacer()
                
                Button() {
                    playViewModel.didFinish = false
                    playViewModel.correctColor = (0, 0, 0)
                    playViewModel.userColor = (0, 0, 0)
                } label: {
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .bold()
                }
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
            .environmentObject(PlayViewModel())
    }
}
