//
//  EvaluationStructure.swift
//  professional-texting
//
//  Created by Michelle Nathania on 06/09/26.
//

import Foundation
import SwiftUI
import FoundationModels

@Generable
struct EvaluationStructure {
    let overallAssessment: OverallAssessment
    let competencies: [CompetenceEvaluation]
}

@Generable
struct CompetenceEvaluation {
    let status: CompetenceStatus
    let competence: Competence
    let summary: String
    let suggestions: [String]
}

@Generable
enum Competence {
    case clarity
    case conciseness
    case politeness
    case capitalizationPunctuation
}


@Generable
enum CompetenceStatus {
    case needsImprovement
    case alreadyGood
}

@Generable
enum OverallAssessment {
    case good
    case bad
}

extension Competence {
    var title: String {
        switch self {
        case .clarity:
            return "Clarity"
            
        case .conciseness:
            return "Conciseness"
            
        case .politeness:
            return "Politeness"
            
        case .capitalizationPunctuation:
            return "Capitalization & punctuation"
        }
    }
}

extension CompetenceStatus {
    var title: String {
        switch self {
        case .needsImprovement:
            return "Needs improvement"
            
        case .alreadyGood:
            return "Already good"
        }
    }
}

extension CompetenceStatus {
    var color: Color {
        switch self {
        case .needsImprovement:
            return .red
            
        case .alreadyGood:
            return .green
        }
    }
}

extension OverallAssessment {
    var title: String {
        switch self {
        case .good:
            return "You can send it! 🎉"
            
        case .bad:
            return "Your message needs some fixing! 🔧"
        }
    }
}
