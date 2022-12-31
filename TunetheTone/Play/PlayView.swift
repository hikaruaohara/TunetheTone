import SwiftUI

struct PlayView: View {
    @EnvironmentObject var model: Model
    @EnvironmentObject var playModel: PlayModel
    @State private var count = 15
    @State private var isEnabled = true
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                Text("\(count)")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Circle()
                        .foregroundColor(Color(red: playModel.correctColor.red / 255, green: playModel.correctColor.green / 255, blue: playModel.correctColor.blue / 255))
                    
                    Spacer()
                    
                    Circle()
                        .foregroundColor(Color(red: playModel.userColor.red / 255, green: playModel.userColor.green / 255, blue: playModel.userColor.blue / 255))
                    
                    Spacer()
                }
                
                Spacer()
                
                Button() {
                    isEnabled.toggle()
                    
                    playModel.correctColor = (Double(Int.random(in: 0...255)), Double(Int.random(in: 0...255)), Double(Int.random(in: 0...255)))
                    playModel.userColor = (0, 0, 0)
                    
                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                        count -= 1
                        if count <= 0 {
                            model.presentation = 1
                            timer.invalidate()
                            count = 15
                            isEnabled.toggle()
                        }
                    }
                } label: {
                    Text("Start")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .opacity(isEnabled ? 1 : 0.5)
                }
                .disabled(!isEnabled)
                
                Spacer()
                
                ColorSlider(color: "red")
                ColorSlider(color: "green")
                ColorSlider(color: "blue")
                
                Spacer()
            }
        }
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
            .environmentObject(Model())
            .environmentObject(PlayModel())
    }
}
