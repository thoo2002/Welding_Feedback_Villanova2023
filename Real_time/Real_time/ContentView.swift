import SwiftUI

struct ContentView: View {
    let bluetoothManager = BluetoothManager()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Image("logo2")
                        .resizable()
                        .scaledToFit()
                    Text("Welcome to RealTime.\nYour Welding Assistant")
                                           .font(.title)
                                           .multilineTextAlignment(.center)
                                           .foregroundColor(Color(white: 90))
                    
                    
                    
                    // Use NavigationLink directly for navigation
                    NavigationLink(destination: NewProjectView()) {
                        RectangleButton(color: Color.orange, title: " New Project ")
                    }
                    
                    NavigationLink(destination: SavedProjectView()) {
                        RectangleButton(color: Color.orange, title: "Saved Project")
                    }
                }
                .padding()
                .cornerRadius(10)
                .shadow(radius: 5)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            }
        }
    }
}

struct RectangleButton: View {
    var color: Color
    var title: String
    
    var body: some View {
        Text(title)
            .foregroundColor(.black)
            .padding()
            .background(color)
            .cornerRadius(10)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


