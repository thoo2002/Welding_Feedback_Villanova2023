//
//  RealTime2App.swift
//  RealTime2
//
//  Created by Alex Rhodes on 11/2/23.
//

import SwiftUI
import CoreBluetooth
import CoreData

@main
struct RealTime2App: App {
    let persistenceController = PersistenceController.shared
    @State private var showSplash = true
    private let bluetoothManager = BluetoothManager()

    var body: some Scene {
        WindowGroup {
            if showSplash {
                SplashView(showSplash: $showSplash)
                    .onAppear {
                        // Prompt the user to connect the correct device when the view appears
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            // Show an alert or perform any necessary UI prompt
                            // You can customize the alert message and actions according to your needs
                            if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                                let alert = UIAlertController(title: "Connect Device", message: "Please connect the correct device", preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                                windowScene.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
                            }
                        }
                    }
            } else {
                ContentView()
            }
        }
    }
}
