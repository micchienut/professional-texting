//
//  ContentView.swift
//  professional-texting
//
//  Created by Michelle Nathania on 03/09/26.
//

import SwiftUI

struct HomeView: View {
    // MARK: Variables
    @State private var message = "" // user's message
    
    var body: some View {
        VStack (spacing: 30) {
            Spacer()
            
            VStack (alignment: .leading, spacing: 10) {
                Text("Write your message")
                    .font(.title)
                    .bold()
                
                Text("Write or paste your message and get feedback to make it more professional.")
                    .font(.subheadline)
            }
            
            ZStack (alignment: .topLeading) {
                TextEditor(text: $message)
                
                if message.isEmpty {
                    Text("Start typing or paste your message")
                        .foregroundStyle(Color.secondary)
                        .padding(3)
                }
                
            }
            .frame(maxWidth: 350, maxHeight: 200)
            
            Spacer()
            
            Button("Evaluate message") {
                // action
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
