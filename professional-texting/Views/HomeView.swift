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
    @FocusState private var isEditorFocused: Bool
    
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
                    .focused($isEditorFocused)
                
                if message.isEmpty {
                    Text("Start typing or paste your message")
                        .foregroundStyle(Color.secondary)
                        .padding(.leading, 3)
                        .padding(.top, 10)
                }
            }
            .frame(maxWidth: 350)
            
            Spacer()
            
            // TODO: Fix button design (fill bottom screen)
            Button ("Evaluate message") {
                Task {
                    try await FoundationModelService().evaluate(message: message)
                }
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .onTapGesture {
            isEditorFocused = false
        }
    }
}

#Preview {
    HomeView()
}
