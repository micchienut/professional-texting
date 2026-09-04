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
            VStack(alignment: .leading) {
                Text("Your message")
                    .font(.title)
                    .bold()
                
                Text(message)
            }
            
            VStack(alignment: .leading) {
                Text("How your message sounds")
                    .font(.title)
                    .bold()
                
                // TODO: Insert model's returned value
                Text(evaluation)
            }
        }
    }
}

#Preview {
    ResultView(message: "Hello, world!", evaluation: "Evaluation from AI goes here")
}
