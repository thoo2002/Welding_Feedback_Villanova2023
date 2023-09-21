import SwiftUI
import CoreBluetooth

@main
struct Real_timeApp: App {
    @State private var showSplash = true

    var body: some Scene {
        WindowGroup {
            if showSplash {
                SplashView(showSplash: $showSplash)
            } else {
                ContentView()
            }
        }
    }
}

