//
//  ContentView.swift
//  professional-texting
//
//  Created by Michelle Nathania on 03/09/26.
//

import SwiftUI

struct HomeView: View {
    // MARK: Variables
    @State private var message: String = "" // user's message
    @State private var evaluation: EvaluationStructure?
    @State private var errorMessage: String?
    @State private var isEvaluating: Bool = false
    @State private var showEvaluation: Bool = false
    @FocusState private var isEditorFocused: Bool
    
    private let modelService = FoundationModelService()
    
    var body: some View {
        NavigationStack {
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
                            .padding(.leading, 5)
                            .padding(.top, 10)
                    }
                }
                .frame(maxWidth: 350)
                
                Spacer()
                
                Button {
                    Task {
                        isEvaluating = true
                        errorMessage = nil
                        
                        do {
                            evaluation = try await modelService.evaluate(message: message)
//                            let result = try await modelService.evaluate(message: message)
//
//                            print("OVERALL ASSESSMENT:")
//                            print(result.overallAssessment)
//
//                            print("COMPETENCIES:")
//                            print(result.competencies)
//
//                            evaluation = result
                            showEvaluation = true
                        }
                        catch {
                            errorMessage = "Something went wrong: \(error.localizedDescription)"
                        }
                        
                        isEvaluating = false
                        
                    }
                } label: {
                    HStack {
                        if isEvaluating {
                            ProgressView()
                                .tint(.white)
                        }
                        
                        Text(isEvaluating ? "Evaluating..." : "Evaluate")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                }
                .buttonStyle(.borderedProminent)
                .disabled(message.isEmpty || isEvaluating)
                .navigationDestination(isPresented: $showEvaluation) {
                    if let evaluation {
                        ResultView(message: message, evaluation: evaluation)
                    }
                }
            }
            .padding()
            .onTapGesture {
                isEditorFocused = false
            }
        }
    }
}

//#Preview {
//    HomeView()
//}
