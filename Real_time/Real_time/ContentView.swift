import SwiftUI

struct ContentView: View {
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
                    RectangleButton(color: Color.orange, title: " New Project ")
                    RectangleButton(color: Color.orange, title: "Saved Project")
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
        Button(action: {
            // Handle button action here
        }) {
            Text(title)
                .foregroundColor(.black)
                .padding()
                .background(color)
                .cornerRadius(10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
