import SwiftUI
import GameKit
import UIKit

struct PlayersList: View {
    @State var players: [Player] = []
    
    var body: some View {
        VStack {
            ForEach(players.reversed()) { player in
                HStack {
                    Group {
                        switch player.rank {
                        case 1:
                            Text("🥇")
                        case 2:
                            Text("🥈")
                        case 3:
                            Text("🥉")
                        default:
                            Text("　")
                        }
                    }
                    .font(.largeTitle)
                    .frame(width: 40)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 24, style: .continuous)
                            .stroke(lineWidth: 2.0)
                            .frame(width: UIScreen.main.bounds.width - 70, height: 50)
                            .foregroundColor(player.gamePlayerID == GKLocalPlayer.local.gamePlayerID ? .yellow : .white)
                        
                        HStack(spacing: 10) {
                            Text("\(player.rank)")
                                .padding(.leading, 10)
                            
                            Image(uiImage: player.photo)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 45)
                                .clipShape(Circle())
                            
                            Text(player.name)
                                .frame(maxWidth: 150, alignment: .leading)
                            
                            Text(player.formattedScore)
                                .padding(.trailing, 10)
                        }
                        .frame(width: UIScreen.main.bounds.width - 70, height: 50)
                    }
                }
            }
        }
        .foregroundColor(.white)
        .bold()
        .onAppear {
            GKLeaderboard.loadLeaderboards(IDs: ["WeeklyBestScore"]) { leaderboards, _ in
                leaderboards?[0].loadEntries(for: .global, timeScope: .allTime, range: NSRange(location: 1, length: 5), completionHandler: { playEntry, entries, _, _ in
                    if let entries = entries {
                        for entry in entries {
                            let player = entry.player
                            player.loadPhoto(for: .small) { image, _ in
                                let newElement = Player(gamePlayerID: player.gamePlayerID, name: player.displayName, photo: image!, formattedScore: entry.formattedScore, rank: entry.rank)
                                players.append(newElement)
                            }
                        }
                    }
                })
            }        
        }
    }
}

struct PlayersList_Previews: PreviewProvider {
    static var previews: some View {
        PlayersList()
    }
}
