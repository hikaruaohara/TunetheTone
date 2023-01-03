import Foundation
import UIKit

class Player: Identifiable {
    let gamePlayerID: String
    let name: String
    let photo: UIImage
    let formattedScore: String
    let rank: Int
    
    init(gamePlayerID: String, name: String, photo: UIImage, formattedScore: String, rank: Int) {
        self.gamePlayerID = gamePlayerID
        self.name = name
        self.photo = photo
        self.formattedScore = formattedScore
        self.rank = rank
    }
}
