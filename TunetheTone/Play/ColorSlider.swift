import SwiftUI

struct ColorSlider: View {
    @EnvironmentObject var playModel: PlayModel
    let color: Color
    
    var body: some View {
        HStack {
            Spacer()

            switch color {
            case .red:
                Circle()
                    .foregroundColor(color)
                    .frame(width: 30)
                    .onTapGesture {
                        playImpactHaptic()
                        playModel.userColor.red = max(0, playModel.userColor.red - 1)
                    }
                
                Spacer()
                
                Slider(value: $playModel.userColor.red, in: 0 ... 255, step: 1)
                    .tint(color)
                    .onChange(of: playModel.userColor.red) { _ in
                        playSelectionHaptic()
                    }
                
                Spacer()
                                
                Text(String(format: "%.0f", playModel.userColor.red))
                    .frame(width: 60)
                    .foregroundColor(color)
                    .onTapGesture {
                        playImpactHaptic()
                        playModel.userColor.red = min(playModel.userColor.red + 1, 255)
                    }
            case .green:
                Circle()
                    .foregroundColor(color)
                    .frame(width: 30)
                    .onTapGesture {
                        playImpactHaptic()
                        playModel.userColor.green = max(0, playModel.userColor.green - 1)
                    }
                
                Spacer()
                
                Slider(value: $playModel.userColor.green, in: 0 ... 255, step: 1)
                    .tint(color)
                    .onChange(of: playModel.userColor.green) { _ in
                        playSelectionHaptic()
                    }
                
                Spacer()
                
                Text(String(format: "%.0f", playModel.userColor.green))
                    .frame(width: 60)
                    .foregroundColor(color)
                    .onTapGesture {
                        playImpactHaptic()
                        playModel.userColor.green = min(playModel.userColor.green + 1, 255)
                    }
            case .blue:
                Circle()
                    .foregroundColor(color)
                    .frame(width: 30)
                    .onTapGesture {
                        playImpactHaptic()
                        playModel.userColor.blue = max(0, playModel.userColor.blue - 1)
                    }
                
                Spacer()
                
                Slider(value: $playModel.userColor.blue, in: 0 ... 255, step: 1)
                    .tint(color)
                    .onChange(of: playModel.userColor.blue) { _ in
                        playSelectionHaptic()
                    }
                
                Spacer()
                
                Text(String(format: "%.0f", playModel.userColor.blue))
                    .frame(width: 60)
                    .foregroundColor(color)
                    .onTapGesture {
                        playImpactHaptic()
                        playModel.userColor.blue = min(playModel.userColor.blue + 1, 255)
                    }
            default:
                Text("error occured")
            }
            Spacer()
        }
        .font(.title)
        .bold()
    }
}

struct ColorSlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorSlider(color: .red)
            .environmentObject(PlayModel())
    }
}

func playSelectionHaptic() {
    let generator = UISelectionFeedbackGenerator()
    generator.selectionChanged()
}

func playImpactHaptic() {
    let generator = UIImpactFeedbackGenerator(style: .rigid)
    generator.impactOccurred()
}
