import SwiftUI
import GameKit

struct HomeView: View {
    @EnvironmentObject var model: Model
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Tune the Tone")
                    .foregroundColor(.white)
                    .font(.largeTitle.weight(.heavy))
                
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 24)
                        .frame(width: 130, height: 50)
                        .foregroundColor(.white)
                    
                    Button("Play") {
                        model.presentation = "PlayView"
                        GKAccessPoint.shared.isActive = false
                    }
                    .frame(width: 130, height: 50)
                    .foregroundColor(.black)
                    .font(.largeTitle.weight(.bold))
                }
                
                Spacer()
                
                Text("👑Weekly Ranking👑")
                    .foregroundColor(.white)
                    .font(.title)
                
                PlayersList()
                
                Spacer()
                Spacer()
            }
        }
        .onAppear {
            authenticateUser()
            setAccessPoint()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Model())
    }
}

func authenticateUser() {
    GKLocalPlayer.local.authenticateHandler = { _, error in
        guard error == nil else {
            print(error?.localizedDescription ?? "")
            return
        }
    }
}

func setAccessPoint() {
    GKAccessPoint.shared.location = .topLeading
    GKAccessPoint.shared.showHighlights = false
    GKAccessPoint.shared.isActive = true
}
