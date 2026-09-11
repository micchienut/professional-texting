//
//  Shortcut.swift
//  professional-texting
//
//  Created by Michelle Nathania on 08/09/26.
//

import AppIntents

struct EvaluateTextIntent: AppIntent {
    static let title: LocalizedStringResource = "Evaluate Message"
    static let description = IntentDescription(
        "Check whether a message is professional and get suggestions for improvement."
    )
    
    @Parameter(
        title: "Message",
        description: "The message to evaluate.",
        requestValueDialog: "What message would you like to evaluate?"
    )
    var message: String
    
    static var parameterSummary: some ParameterSummary {
        Summary("Evaluate \(\.$message)")
    }
    
    @MainActor
    func perform() async throws -> some IntentResult & ProvidesDialog {
        let modelService = FoundationModelService()
        let evaluation = try await modelService.evaluate(message: message)
        
        let needsImprovement = evaluation.competencies.contains {
            $0.status == .needsImprovement
        }
        
//        let suggestions = evaluation.competencies
//            .flatMap { $0.suggestions }
//            .prefix(5)
//        
//        let suggestionText = suggestions
//            .map { "• \($0)" }
//            .joined(separator: "\n")
        
        if needsImprovement {
            return .result(
                dialog: IntentDialog(stringLiteral: OverallAssessment.good.title)
            )
        }
        else {
            return .result(
                dialog: IntentDialog(stringLiteral: OverallAssessment.bad.title)
            )
        }
    }
}
