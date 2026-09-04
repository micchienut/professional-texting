//
//  ResultView.swift
//  professional-texting
//
//  Created by Michelle Nathania on 04/09/26.
//

import SwiftUI

struct ResultView: View {
    let message: String
    let evaluation: String
    
    var body: some View {
        VStack (alignment: .leading, spacing: 40){
            VStack(alignment: .leading, spacing: 5) {
                Text("Your message")
                    .font(.title)
                    .bold()
                
                Text(message)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("How your message sounds")
                    .font(.title)
                    .bold()
                
                ScrollView {
                    Text(evaluation)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .frame(maxWidth: .infinity)
            }
        }
        .padding()
    }
}

#Preview {
    ResultView(message: "Hello, world!", evaluation: "Evaluation from AI goes here")
}
