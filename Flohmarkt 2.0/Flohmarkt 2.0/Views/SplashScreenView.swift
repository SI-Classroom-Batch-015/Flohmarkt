//
//  SplashScreenView.swift
//  Flohmarkt 2.0
//
//  Created by Michael Fleps on 08.08.24.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var scale: CGFloat = 0.25
    @State private var breatheIn = true
    @State private var breatheOut = false
    
    var body: some View {
        if isActive {
            LogInView() // Nach der Animation wird zur LogInView navigiert
        } else {
            VStack {
                Spacer()
                
                // Animierter Text "Flohmarktapp 2.0"
                ZStack {
                    Text("Flohmarktapp 2.0")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        .scaleEffect(scale)
                        .animation(.easeInOut(duration: 2.5).repeatForever(autoreverses: true), value: scale)
                        .onAppear() {
                            scale = 1.0
                        }
                        .opacity(breatheOut ? 0.2 : 1) // Opacity-Animation
                        .animation(.easeInOut(duration: 2.5).repeatForever(autoreverses: true), value: breatheOut)
                        .onAppear {
                            breatheOut.toggle()
                        }
                    
                    // Zusätzlicher Effekt, der "atmet"
                    Text("Flohmarktapp 2.0")
                        .font(.largeTitle)
                        .foregroundColor(.blue)
                        .scaleEffect(breatheIn ? 0.9 : 1.1)
                        .animation(.easeInOut(duration: 2.5).repeatForever(autoreverses: true), value: breatheIn)
                        .onAppear() {
                            breatheIn.toggle()
                        }
                }
                
                Spacer()
                
                // Timer
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
        .environmentObject(ArticleViewModel())
        .environmentObject(UserViewModel())
}
