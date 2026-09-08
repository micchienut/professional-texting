//
//  CompetenceCard.swift
//  professional-texting
//
//  Created by Michelle Nathania on 06/09/26.
//

import SwiftUI

struct CompetenceCard: View {
    @State private var isExpanded: Bool = true
    let competenceEvaluation: CompetenceEvaluation
    
    var body: some View {
        VStack (alignment: .leading, spacing: 15) {
            VStack (alignment: .leading, spacing: 10) {
                CompetenceStatusCapsule(status: competenceEvaluation.status)
                
                HStack {
                    Text(competenceEvaluation.competence.title)
                        .font(.title3)
                        .bold()
                    
                    Spacer()
                    
                    Button {
                        withAnimation (.easeInOut(duration: 0.25)) {
                            isExpanded.toggle()
                        }
                    } label: {
                        Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                            .foregroundStyle(Color.primary)
                    }
                }
            }
            
            if isExpanded {
                // TODO: Output 1-2 sentences from FM (improve instructions)
                Text(competenceEvaluation.summary)
                
                VStack (alignment: .leading, spacing: 5) {
                    Text("Suggested improvements:")
                        .bold()
                    
                    ForEach(competenceEvaluation.suggestions, id: \.self) { suggestion in
                        Text("• \(suggestion)")
                    }
                }
            }
        }
        .padding([.trailing, .leading], 15)
        .padding([.top, .bottom], 20)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.background)
                .shadow(color: .black.opacity(0.2), radius: 3)
        )
    }
}

//#Preview {
//    CompetenceCard()
//}
