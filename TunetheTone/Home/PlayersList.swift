import SwiftUI
import GameKit
import UIKit

struct PlayersList: View {
    @State var players: [Player] = []
    
    var body: some View {
        VStack {
            ForEach(players) { player in
                HStack {
                    Spacer()
                    Text("\(player.rank)")
                    
                    Image(uiImage: player.photo)

                    
                    Text(player.name)
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    Text(player.formattedScore)
                    
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width - 30, height: 50)
                .border(.white)
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
                                let newElement = Player(name: player.displayName, photo: image!, formattedScore: entry.formattedScore, rank: entry.rank)
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
