import Foundation

class PlayModel: ObservableObject {
    @Published var correctColor = (red: 0.0, green: 0.0, blue: 0.0)
    @Published var userColor = (red: 0.0, green: 0.0, blue: 0.0)
    let maxDistance = sqrt(pow(255, 2) * 3)
    
    func getDistance() -> Double {
        let score = sqrt(pow(correctColor.red - userColor.red, 2) + pow(correctColor.green - userColor.green, 2) + pow(correctColor.blue - userColor.blue, 2))
        
        return score
    }
    
    func getMatchingRate() -> Float {
        let matchingRate = (1 - getDistance() / maxDistance) * 100
        
        return Float(matchingRate)
    }
}
