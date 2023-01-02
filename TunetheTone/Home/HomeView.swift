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
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .frame(width: 130, height: 70)
                        .foregroundColor(.white)
                    
                    Button("Play") {
                        model.presentation = "PlayView"
                        GKAccessPoint.shared.isActive = false
                    }
                    .frame(width: 130, height: 70)
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .bold()
                }
                
                Spacer()
                
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
