import SwiftUI
import GameKit

@main
struct TunetheToneApp: App {
    @StateObject var model = Model()
    @StateObject var playViewModel = PlayModel()
    
    var body: some Scene {
        WindowGroup {
            VStack {
                switch model.presentation {
                case "HomeView":
                    HomeView()
                case "PlayView":
                    PlayView()
                case "ResultView":
                    ResultView()
                default:
                    Text("error occured")
                }
            }
            .environmentObject(model)
            .environmentObject(playViewModel)
        }
    }
}
