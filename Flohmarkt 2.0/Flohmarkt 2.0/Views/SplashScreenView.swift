//
//  SplashScreenView.swift
//  Flohmarkt 2.0
//
//  Created by Michael Fleps on 08.08.24.
//

import SwiftUI

struct SplashScreenView: View {
    @EnvironmentObject var uViewModel: UserViewModel
    @EnvironmentObject var aViewModel: ArticleViewModel
    @State private var isActive = false
    @State private var scale: CGFloat = 0.25
    @State private var breatheIn = true
    @State private var breatheOut = false
    
    var body: some View {
        if isActive {
            LogInView()
                .environmentObject(uViewModel)
                .environmentObject(aViewModel)
        } else {
            VStack {
                Spacer()
                
                
                ZStack {
                    Text("we whish you a happy shopping")
                        .font(.largeTitle)
                        .foregroundColor(.red)
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
                    Text("we whish you a happy shopping")
                        .font(.largeTitle)
                        .foregroundColor(.green)
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
