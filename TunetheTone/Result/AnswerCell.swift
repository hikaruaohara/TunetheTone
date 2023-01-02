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
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Spacer()
                
                Circle()
                    .foregroundColor(Color(red: colors.red / 255, green: colors.green / 255, blue: colors.blue / 255))
                
                Spacer()
                
                RGBValueCell(color: .red, value: colors.red)
                RGBValueCell(color: .green, value: colors.green)
                RGBValueCell(color: .blue, value: colors.blue)
                
                Spacer()
            }
            .bold()
        case .user:
            let colors = playModel.userColor
            VStack {
                Spacer()
                Text("Your\nAnswer")
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                
                Spacer()
                
                Circle()
                    .foregroundColor(Color(red: colors.red / 255, green: colors.green / 255, blue: colors.blue / 255))
                
                Spacer()
                
                VStack (alignment: .leading) {
                    HStack {
                        RGBValueCell(color: .red, value: colors.red)
                        Text(getErrorText(userValue: colors.red, correctValue:playModel.correctColor.red))
                    }
                    
                    HStack {
                        RGBValueCell(color: .green, value: colors.green)
                        Text(getErrorText(userValue: colors.green, correctValue:playModel.correctColor.green))
                    }
                    
                    HStack {
                        RGBValueCell(color: .blue, value: colors.blue)
                        Text(getErrorText(userValue: colors.blue, correctValue:playModel.correctColor.blue))
                    }
                }
                
                Spacer()
            }
            .bold()
        }
    }
}

struct AnswerCell_Previews: PreviewProvider {
    static var previews: some View {
        AnswerCell(target: .user)
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
