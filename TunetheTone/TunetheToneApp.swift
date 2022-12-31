import SwiftUI

@main
struct TunetheToneApp: App {
    @StateObject var model = Model()
    @StateObject var playViewModel = PlayModel()
    
    var body: some Scene {
        WindowGroup {
            VStack {
                switch model.presentation {
                case 0:
                    PlayView()
                case 1:
                    ResultView()
                default:
                    Text("error")
                }
            }
            .environmentObject(model)
            .environmentObject(playViewModel)
        }
    }
}
