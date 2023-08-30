//
//  SplashView.swift
//  Real_time
//
//  Created by Alex Rhodes on 8/30/23.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .background(Color.black
                )
            Image("logo2")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
            
        }
    }
}
struct SplashView_Preview: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
