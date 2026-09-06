//
//  CompetenceCard.swift
//  professional-texting
//
//  Created by Michelle Nathania on 06/09/26.
//

import SwiftUI

struct CompetenceCard: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 15) {
            VStack (alignment: .leading, spacing: 10) {
                CompetenceStatus()
                
                HStack {
                    Text("Clarity")
                        .font(.title3)
                        .bold()
                    
                    Spacer()
                    
                    // TODO: Add chevron button to collapse/expand the view
                    Image(systemName: "chevron.up")
                }
            }
            
            // TODO: Output 1-2 sentences from FM
            Text("The message is clear in its purpose, but it could be more specific.")
            
            VStack (alignment: .leading, spacing: 5) {
                Text("Suggested improvements:")
                    .bold()
                
                // TODO: Parse list from FM
                Text("• Specify exact date of the report")
                Text("• Mention the department or person responsible")
            }
        }
        .padding([.trailing, .leading], 15)
        .padding([.top, .bottom], 20)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(color: .black.opacity(0.2), radius: 3)
        )
    }
}

#Preview {
    CompetenceCard()
}
