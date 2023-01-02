import Foundation
import UIKit

class Player: Identifiable {
    var id = UUID()
    let name: String
    let photo: UIImage
    let formattedScore: String
    let rank: Int
    
    init(name: String, photo: UIImage, formattedScore: String, rank: Int) {
        self.name = name
        self.photo = photo
        self.formattedScore = formattedScore
        self.rank = rank
    }
}
