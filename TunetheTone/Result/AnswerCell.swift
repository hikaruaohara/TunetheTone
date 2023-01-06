import SwiftUI

struct AnswerCell: View {
    @EnvironmentObject var playModel: PlayModel
    enum Target {
        case correct
        case user
    }
    let target: Target
    
    var body: some View {
        switch target {
        case .correct:
            let colors = playModel.correctColor
            VStack {
                Spacer()
                Text("Correct\nAnswer")
                    .multilineTextAlignment(.center)
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                    .frame(width: 130, height: 100)
                
                Spacer()
                
                Circle()
                    .foregroundColor(Color(red: colors.red / 255, green: colors.green / 255, blue: colors.blue / 255))
                
                Spacer()
                
                RGBValueCell(color: .red, value: colors.red)
                RGBValueCell(color: .green, value: colors.green)
                RGBValueCell(color: .blue, value: colors.blue)
                
                Spacer()
            }
        case .user:
            let userColor = playModel.userColor
            let correctColor = playModel.correctColor
            VStack {
                Spacer()
                Text("Your\nAnswer")
                    .multilineTextAlignment(.center)
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                    .frame(width: 130, height: 100)
                
                Spacer()
                
                Circle()
                    .foregroundColor(Color(red: userColor.red / 255, green: userColor.green / 255, blue: userColor.blue / 255))
                
                Spacer()
                
                VStack (alignment: .leading) {
                    HStack {
                        RGBValueCell(color: .red, value: userColor.red)
                        Text(getErrorText(userValue: userColor.red, correctValue: correctColor.red))
                            .font(.body.weight(.bold))
                    }
                    
                    HStack {
                        RGBValueCell(color: .green, value: userColor.green)
                        Text(getErrorText(userValue: userColor.green, correctValue: correctColor.green))
                            .font(.body.weight(.bold))
                    }
                    
                    HStack {
                        RGBValueCell(color: .blue, value: userColor.blue)
                        Text(getErrorText(userValue: userColor.blue, correctValue: correctColor.blue))
                            .font(.body.weight(.bold))
                    }
                }
                .foregroundColor(.white)
                
                Spacer()
            }
        }
    }
}

struct AnswerCell_Previews: PreviewProvider {
    static var previews: some View {
        AnswerCell(target: .correct)
            .environmentObject(PlayModel())
    }
}

func getErrorText(userValue: Double, correctValue: Double) -> String {
    let error = Int(userValue - correctValue)
    if error > 0 {
        return "(+\(error))"
    } else if error < 0 {
        return "(\(error))"
    } else {
        return "(±0)"
    }
}
