//
//  ResultView.swift
//  professional-texting
//
//  Created by Michelle Nathania on 04/09/26.
//

import SwiftUI

struct ResultView: View {
    let message: String
    let evaluation: EvaluationStructure
    
    var body: some View {
        VStack (alignment: .leading, spacing: 40){
            // TODO: Make the message editable so user can fix their own message
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
                
                Text(evaluation.overallAssessment.title)
                
                ScrollView {
                    VStack (alignment: .leading, spacing: 30) {
                        ForEach(evaluation.competencies, id: \.competence) { competence in
                            CompetenceCard(competenceEvaluation: competence)
                        }
                    }
                }
            }
            
            // TODO: Add re-evaluate button
        }
        .padding()
    }
}

//#Preview {
//    ResultView()
//}
