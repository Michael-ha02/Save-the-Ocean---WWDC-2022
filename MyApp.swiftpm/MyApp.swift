import SwiftUI



@main
struct MyApp: App {
    @StateObject var viewRouter = ViewRouter()
    var body: some Scene {
        
        WindowGroup {
            MotherView(viewRouter: viewRouter)
        }
    }
}
