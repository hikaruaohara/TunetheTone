import Foundation
class PlayModel: ObservableObject {
    @Published var correctColor = (red: 0.0, green: 0.0, blue: 0.0)
    @Published var userColor = (red: 0.0, green: 0.0, blue: 0.0)
    
    func getScore() -> Float {
        let score = fabs(correctColor.red - userColor.red) + fabs(correctColor.green - userColor.green) + fabs(correctColor.blue - userColor.blue)
        
        return Float(score)
    }
    
    func getMatchingRate() -> Float {
        let matchingRate = 100 - getScore() / 7.65
        
        return Float(matchingRate)
    }
}
