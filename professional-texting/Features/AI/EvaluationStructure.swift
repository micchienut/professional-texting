//
//  EvaluationStructure.swift
//  professional-texting
//
//  Created by Michelle Nathania on 06/09/26.
//

import Foundation
import FoundationModels

@Generable
struct EvaluationStructure {
    let overallAssessment: String
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
