import SwiftUI
import GameKit

struct ResultView: View {
    @EnvironmentObject var model: Model
    @EnvironmentObject var playModel: PlayModel
    @State private var matchingRate: Float = 0.0
    
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
                
                (Text(String(format: "%.1f%% ", matchingRate)).foregroundColor(.yellow) + Text(" Matched!!"))
                    .foregroundColor(.white)
                    .font(.largeTitle.weight(.bold))

                Spacer()
                Spacer()
                Spacer()
                
                HStack {
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 24)
                            .frame(width: 130, height: 50)
                            .foregroundColor(.white)
                        
                        Button("Next") {
                            playModel.correctColor = (0, 0, 0)
                            playModel.userColor = (0, 0, 0)
                            model.presentation = "PlayView"
                        }
                        .foregroundColor(.black)
                        .font(.largeTitle.weight(.bold))
                    }
                    
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 24)
                            .frame(width: 130, height: 50)
                            .foregroundColor(.white)
                        
                        Button("Home") {
                            playModel.correctColor = (0, 0, 0)
                            playModel.userColor = (0, 0, 0)
                            model.presentation = "HomeView"
                        }
                        .foregroundColor(.black)
                        .font(.largeTitle.weight(.bold))
                    }
                    
                    Spacer()
                }
                
                Spacer()
            }
        }
        .onAppear {
            matchingRate = round(playModel.getMatchingRate() * 10) / 10
            let score = Int(matchingRate * 10)
            GKLeaderboard.submitScore(score, context: 0, player: GKLocalPlayer.local,
                leaderboardIDs: ["BestScore", "WeeklyBestScore"]) { error in
                print(error.debugDescription)
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
